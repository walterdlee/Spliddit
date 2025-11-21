//
//  Models.swift
//  Spliddit
//
//  Created by Walter Lee on 11/15/25.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

// MARK: - Person Model
struct Person: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var color: Color

    init(id: UUID = UUID(), name: String, color: Color = .blue) {
        self.id = id
        self.name = name
        self.color = color
    }

    // Custom coding for Color
    enum CodingKeys: String, CodingKey {
        case id, name, colorHex
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        let hex = try container.decode(String.self, forKey: .colorHex)
        color = Color(hex: hex) ?? .blue
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(color.toHex(), forKey: .colorHex)
    }
}

// MARK: - Receipt Item Model
struct ReceiptItem: Identifiable, Hashable, Codable, Transferable {
    let id: UUID
    var name: String
    var price: Double
    var assignedTo: Set<UUID> // Person IDs who this item is assigned to

    init(id: UUID = UUID(), name: String, price: Double, assignedTo: Set<UUID> = []) {
        self.id = id
        self.name = name
        self.price = price
        self.assignedTo = assignedTo
    }

    // Price per person if split
    func pricePerPerson() -> Double {
        guard !assignedTo.isEmpty else { return 0 }
        return price / Double(assignedTo.count)
    }
    
    // MARK: - Transferable Conformance
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .receiptItem)
    }
}

// MARK: - Custom UTType for ReceiptItem
extension UTType {
    static let receiptItem = UTType(exportedAs: "com.spliddit.receiptitem")
}

// MARK: - Bill Model
struct Bill: Identifiable, Codable {
    let id: UUID
    var name: String
    var date: Date
    var items: [ReceiptItem]
    var people: [Person]
    var taxAmount: Double
    var tipAmount: Double

    init(
        id: UUID = UUID(),
        name: String = "New Bill",
        date: Date = Date(),
        items: [ReceiptItem] = [],
        people: [Person] = [],
        taxAmount: Double = 0,
        tipAmount: Double = 0
    ) {
        self.id = id
        self.name = name
        self.date = date
        self.items = items
        self.people = people
        self.taxAmount = taxAmount
        self.tipAmount = tipAmount
    }

    // Calculate subtotal (sum of all items)
    var subtotal: Double {
        items.reduce(0) { $0 + $1.price }
    }

    // Calculate total (subtotal + tax + tip)
    var total: Double {
        subtotal + taxAmount + tipAmount
    }

    // Calculate how much each person owes
    func amountOwed(by personId: UUID) -> Double {
        // Sum of items assigned to this person (split if shared)
        let itemsTotal = items.reduce(0.0) { sum, item in
            if item.assignedTo.contains(personId) {
                return sum + item.pricePerPerson()
            }
            return sum
        }

        // Calculate their share of tax and tip proportionally
        guard subtotal > 0 else { return 0 }
        let proportion = itemsTotal / subtotal
        let taxShare = taxAmount * proportion
        let tipShare = tipAmount * proportion

        return itemsTotal + taxShare + tipShare
    }

    // Get all people who have items assigned to them
    var peopleWithItems: [Person] {
        let assignedIds = Set(items.flatMap { $0.assignedTo })
        return people.filter { assignedIds.contains($0.id) }
    }
}

// MARK: - Color Extension for Hex Support
extension Color {
    init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return nil
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    func toHex() -> String {
        guard let components = UIColor(self).cgColor.components,
              components.count >= 3 else {
            return "007AFF"
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])

        return String(format: "%02lX%02lX%02lX",
                     lroundf(r * 255),
                     lroundf(g * 255),
                     lroundf(b * 255))
    }
}

// MARK: - Color Palette
extension Color {
    static let personColors: [Color] = [
        .blue, .green, .orange, .purple, .pink, .red, .yellow, .cyan, .indigo, .mint
    ]
}
