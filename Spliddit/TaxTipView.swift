//
//  TaxTipView.swift
//  Spliddit
//
//  Created by Walter Lee on 11/15/25.
//

import SwiftUI

struct TaxTipView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var taxAmount: Double
    @Binding var tipAmount: Double

    @State private var taxString: String
    @State private var tipString: String

    init(taxAmount: Binding<Double>, tipAmount: Binding<Double>) {
        _taxAmount = taxAmount
        _tipAmount = tipAmount
        _taxString = State(initialValue: String(format: "%.2f", taxAmount.wrappedValue))
        _tipString = State(initialValue: String(format: "%.2f", tipAmount.wrappedValue))
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Tax") {
                    HStack {
                        Text("$")
                        TextField("0.00", text: $taxString)
                            .keyboardType(.decimalPad)
                    }
                }

                Section("Tip") {
                    HStack {
                        Text("$")
                        TextField("0.00", text: $tipString)
                            .keyboardType(.decimalPad)
                    }

                    // Quick tip buttons
                    GlassEffectContainer(spacing: 12.0) {
                        HStack(spacing: 12) {
                            ForEach([15, 18, 20, 25], id: \.self) { percentage in
                                Button("\(percentage)%") {
                                    // This would need subtotal to calculate
                                    // For now just a placeholder
                                }
                                .buttonStyle(.glass)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Tax & Tip")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        saveTaxTip()
                        dismiss()
                    }
                    .buttonStyle(.glassProminent)
                }
            }
        }
    }

    private func saveTaxTip() {
        taxAmount = Double(taxString) ?? 0
        tipAmount = Double(tipString) ?? 0
    }
}

#Preview {
    TaxTipView(taxAmount: .constant(3.50), tipAmount: .constant(8.00))
}
