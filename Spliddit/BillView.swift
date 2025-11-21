//
//  BillView.swift
//  Spliddit
//
//  Created by Walter Lee on 11/15/25.
//

import SwiftUI

struct BillView: View {
    @State private var bill: Bill
    @State private var showingAddItem = false
    @State private var showingAddPerson = false

    init(bill: Bill = Bill()) {
        _bill = State(initialValue: bill)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // People Section
                    peopleSection

                    // Items Section
                    itemsSection

                    // Tax & Tip Section
                    taxTipSection

                    // Summary Section
                    summarySection
                }
                .padding()
            }
            .navigationTitle(bill.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Edit Bill Name") { }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView { item in
                    bill.items.append(item)
                }
            }
            .sheet(isPresented: $showingAddPerson) {
                AddPersonView { person in
                    bill.people.append(person)
                }
            }
        }
    }

    // MARK: - People Section
    private var peopleSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("People")
                    .font(.headline)
                Spacer()
                Button(action: { showingAddPerson = true }) {
                    Label("Add Person", systemImage: "person.badge.plus")
                        .font(.subheadline)
                }
                .buttonStyle(.glass)
            }

            if bill.people.isEmpty {
                ContentUnavailableView(
                    "No People Yet",
                    systemImage: "person.2",
                    description: Text("Add people to split the bill with")
                )
                .frame(height: 150)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    GlassEffectContainer(spacing: 20.0) {
                        HStack(spacing: 16) {
                            ForEach(bill.people) { person in
                                PersonCardWithDrop(
                                    person: person,
                                    amountOwed: bill.amountOwed(by: person.id),
                                    onTap: {
                                        openVenmo(for: person)
                                    },
                                    onDrop: { droppedItems in
                                        handleDrop(droppedItems: droppedItems, onto: person)
                                    }
                                )
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .glassEffect(.regular, in: .rect(cornerRadius: 16))
    }

    // MARK: - Items Section
    private var itemsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Receipt Items")
                    .font(.headline)
                Spacer()
                Button(action: { showingAddItem = true }) {
                    Label("Add Item", systemImage: "plus.circle.fill")
                        .font(.subheadline)
                }
                .buttonStyle(.glass)
            }

            if bill.items.isEmpty {
                ContentUnavailableView(
                    "No Items Yet",
                    systemImage: "list.bullet.rectangle",
                    description: Text("Add items from your receipt")
                )
                .frame(height: 150)
            } else {
                VStack(spacing: 8) {
                    ForEach(bill.items) { item in
                        ReceiptItemRow(
                            item: item,
                            people: bill.people,
                            onRemove: {
                                bill.items.removeAll { $0.id == item.id }
                            },
                            onToggleAssignment: { personId in
                                toggleItemAssignment(item: item, personId: personId)
                            }
                        )
                        .draggable(item)
                    }
                }
            }
        }
        .padding()
        .glassEffect(.regular, in: .rect(cornerRadius: 16))
    }

    // MARK: - Tax & Tip Section
    private var taxTipSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tax & Tip")
                .font(.headline)

            // Tax Input
            VStack(alignment: .leading, spacing: 8) {
                Text("Tax")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Text("$")
                        .foregroundStyle(.secondary)
                    TextField("0.00", value: $bill.taxAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.plain)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 8))
            }

            // Tip Input
            VStack(alignment: .leading, spacing: 8) {
                Text("Tip")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Text("$")
                        .foregroundStyle(.secondary)
                    TextField("0.00", value: $bill.tipAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.plain)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 8))
            }
            
            // Quick Tip Buttons
            VStack(alignment: .leading, spacing: 8) {
                Text("Quick Tip")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                GlassEffectContainer(spacing: 8.0) {
                    HStack(spacing: 8) {
                        ForEach([15, 18, 20, 25], id: \.self) { percentage in
                            Button("\(percentage)%") {
                                bill.tipAmount = bill.subtotal * Double(percentage) / 100.0
                            }
                            .buttonStyle(.glass)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
        .padding()
        .glassEffect(.regular, in: .rect(cornerRadius: 16))
    }

    // MARK: - Summary Section
    private var summarySection: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Subtotal")
                Spacer()
                Text(bill.subtotal, format: .currency(code: "USD"))
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)

            Divider()

            HStack {
                Text("Total")
                    .font(.headline)
                Spacer()
                Text(bill.total, format: .currency(code: "USD"))
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
        .padding()
        .glassEffect(.regular.tint(.green.opacity(0.1)), in: .rect(cornerRadius: 16))
    }

    // MARK: - Helper Functions
    private func handleDrop(droppedItems: [ReceiptItem], onto person: Person) {
        // Create a new copy of items array to trigger SwiftUI update
        var updatedItems = bill.items
        for droppedItem in droppedItems {
            if let index = updatedItems.firstIndex(where: { $0.id == droppedItem.id }) {
                updatedItems[index].assignedTo.insert(person.id)
            }
        }
        bill.items = updatedItems
    }
    
    private func toggleItemAssignment(item: ReceiptItem, personId: UUID) {
        if let index = bill.items.firstIndex(where: { $0.id == item.id }) {
            if bill.items[index].assignedTo.contains(personId) {
                bill.items[index].assignedTo.remove(personId)
            } else {
                bill.items[index].assignedTo.insert(personId)
            }
        }
    }

    private func openVenmo(for person: Person) {
        let amount = bill.amountOwed(by: person.id)
        guard amount > 0 else { return }

        // Venmo URL scheme: venmo://paycharge?txn=pay&recipients=USERNAME&amount=AMOUNT&note=NOTE
        // For phone numbers: venmo://paycharge?txn=charge&recipients=PHONENUMBER&amount=AMOUNT&note=NOTE
        let amountString = String(format: "%.2f", amount)
        let note = "Spliddit: \(bill.name)"
        let encodedNote = note.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        // Try to open Venmo app
        if let url = URL(string: "venmo://paycharge?txn=charge&amount=\(amountString)&note=\(encodedNote)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                // Fallback to Venmo web if app not installed
                if let webUrl = URL(string: "https://venmo.com/") {
                    UIApplication.shared.open(webUrl)
                }
            }
        }
    }
}

// MARK: - Person Card with Drop Support
struct PersonCardWithDrop: View {
    let person: Person
    let amountOwed: Double
    let onTap: () -> Void
    let onDrop: ([ReceiptItem]) -> Void
    @State private var isTargeted = false
    
    var body: some View {
        PersonCard(person: person, amountOwed: amountOwed, onTap: onTap)
            .dropDestination(for: ReceiptItem.self) { droppedItems, location in
                onDrop(droppedItems)
                return true
            } isTargeted: { targeted in
                isTargeted = targeted
            }
            .overlay {
                if isTargeted {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(person.color, lineWidth: 3)
                        .padding(-4)
                }
            }
            .scaleEffect(isTargeted ? 1.05 : 1.0)
            .animation(.spring(response: 0.3), value: isTargeted)
    }
}

// MARK: - Person Card
struct PersonCard: View {
    let person: Person
    let amountOwed: Double
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                Circle()
                    .fill(person.color.gradient)
                    .frame(width: 60, height: 60)
                    .overlay {
                        Text(person.name.prefix(1).uppercased())
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }

                Text(person.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(1)

                Text(amountOwed, format: .currency(code: "USD"))
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(amountOwed > 0 ? .green : .secondary)
            }
            .frame(width: 100)
            .padding()
        }
        .buttonStyle(.plain)
        .glassEffect(.regular.tint(person.color.opacity(0.15)).interactive(), in: .rect(cornerRadius: 16))
    }
}

// MARK: - Receipt Item Row
struct ReceiptItemRow: View {
    let item: ReceiptItem
    let people: [Person]
    let onRemove: () -> Void
    let onToggleAssignment: (UUID) -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.body)
                    .fontWeight(.medium)

                // Show assigned people
                if !item.assignedTo.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 4) {
                            ForEach(assignedPeople, id: \.id) { person in
                                Text(person.name)
                                    .font(.caption2)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .glassEffect(.regular.tint(person.color.opacity(0.3)), in: .capsule)
                            }
                        }
                    }
                }
            }

            Spacer()

            Text(item.price, format: .currency(code: "USD"))
                .font(.body)
                .fontWeight(.semibold)

            Button(action: onRemove) {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
                    .font(.subheadline)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 12))
    }

    private var assignedPeople: [Person] {
        people.filter { item.assignedTo.contains($0.id) }
    }
}

#Preview {
    BillView(bill: Bill(
        name: "Dinner at Joe's",
        items: [
            ReceiptItem(name: "Burger", price: 14.00),
            ReceiptItem(name: "Pizza", price: 16.00),
            ReceiptItem(name: "Beer", price: 6.00)
        ],
        people: [
            Person(name: "Sarah", color: .blue),
            Person(name: "Mike", color: .green)
        ],
        taxAmount: 3.50,
        tipAmount: 8.00
    ))
}
