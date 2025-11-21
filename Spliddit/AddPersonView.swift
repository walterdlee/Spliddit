//
//  AddPersonView.swift
//  Spliddit
//
//  Created by Walter Lee on 11/15/25.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var personName = ""
    @State private var selectedColor: Color = .personColors.randomElement() ?? .blue
    let onAdd: (Person) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Person Details") {
                    TextField("Name", text: $personName)
                        .autocorrectionDisabled()
                }

                Section("Color") {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 16) {
                        ForEach(Color.personColors, id: \.self) { color in
                            Button(action: { selectedColor = color }) {
                                Circle()
                                    .fill(color.gradient)
                                    .frame(width: 50, height: 50)
                                    .overlay {
                                        if selectedColor == color {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(.white)
                                                .fontWeight(.bold)
                                                .font(.title2)
                                        }
                                    }
                            }
                            .buttonStyle(.plain)
                            .glassEffect(selectedColor == color ? .regular.interactive() : .regular, in: .circle)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Add Person")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addPerson()
                    }
                    .disabled(personName.isEmpty)
                    .buttonStyle(.glassProminent)
                }
            }
        }
    }

    private func addPerson() {
        let person = Person(name: personName, color: selectedColor)
        onAdd(person)
        dismiss()
    }
}

#Preview {
    AddPersonView { person in
        print("Added: \(person)")
    }
}
