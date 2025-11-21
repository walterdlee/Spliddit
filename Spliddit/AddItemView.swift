//
//  AddItemView.swift
//  Spliddit
//
//  Created by Walter Lee on 11/15/25.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var itemName = ""
    @State private var itemPrice = ""
    let onAdd: (ReceiptItem) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Item Details") {
                    TextField("Item name", text: $itemName)
                        .autocorrectionDisabled()

                    HStack {
                        Text("$")
                        TextField("0.00", text: $itemPrice)
                            .keyboardType(.decimalPad)
                    }
                }
            }
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addItem()
                    }
                    .disabled(itemName.isEmpty || itemPrice.isEmpty)
                    .buttonStyle(.glassProminent)
                }
            }
        }
    }

    private func addItem() {
        guard let price = Double(itemPrice) else { return }
        let item = ReceiptItem(name: itemName, price: price)
        onAdd(item)
        dismiss()
    }
}

#Preview {
    AddItemView { item in
        print("Added: \(item)")
    }
}
