# Spliddit

**Making bill splitting fun and effortless with Apple's Liquid Glass design. ✨**

## Overview

Spliddit is an iOS app that transforms the awkward experience of splitting bills into something intuitive and enjoyable. Built with SwiftUI and featuring Apple's cutting-edge Liquid Glass design system, it combines a delightful drag-and-drop interface with seamless Venmo integration to make settling up with friends as easy as possible.

## The Vision

No more calculator apps, spreadsheets, or mental math. Here's how Spliddit works:

1. **📝 Enter the receipt** - Add all items from your bill: food, drinks, tax, and tip
2. **👥 Add your friends** - Enter the names of everyone splitting the bill
3. **🎯 Drag & drop** - Simply drag each receipt item and drop it on whoever ordered it
4. **💸 Venmo & pay** - Open Venmo with pre-populated amounts to instantly charge your friends

## Key Features

- ✨ **Apple's Liquid Glass design system** - Beautiful, modern interface with fluid glass effects
- 🎨 **Intuitive drag-and-drop interface** - Assign items to people with simple gestures
- 💰 **Smart bill parsing** - Easily input items, prices, tax, and tip
- 👥 **Group management** - Add and manage multiple people per bill
- 📊 **Automatic calculations** - See who owes what in real-time
- 💳 **Venmo integration** - One-tap payment requests with pre-filled amounts
- 🌈 **Personalized colors** - Each person gets their own color theme

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

1. Clone the repository:
```bash
git clone <your-repository-url>
```

2. Open the project in Xcode:
```bash
cd Spliddit
open Spliddit.xcodeproj
```

3. Build and run the project (⌘ + R)

## Project Structure

```
Spliddit/
├── ContentView.swift          # Welcome screen with Liquid Glass
├── BillView.swift            # Main bill splitting interface
├── AddPersonView.swift       # Person creation view
├── AddItemView.swift         # Item creation view
├── TaxTipView.swift          # Tax and tip input view
├── Models.swift              # Data models (Bill, Person, ReceiptItem)
├── Assets.xcassets/          # App assets and images
├── LIQUID_GLASS_GUIDE.md     # Liquid Glass implementation guide
└── README.md                 # This file
```

## How It Works

### The Core Experience

The magic of Spliddit is in its simplicity:

- **Receipt entry**: Quickly add items with names and prices
- **Drag items to people**: Tap and drag a receipt item, then drop it on a person's avatar or card
- **Split shared items**: Drop an item on multiple people to split it evenly
- **Auto-calculate totals**: Tax and tip are distributed proportionally based on who ordered what
- **Instant Venmo**: Tap a person to open Venmo with their total pre-filled and ready to request

### Example Flow

1. You're out with 3 friends at a restaurant
2. Open Spliddit and create a new bill
3. Add your friends: Sarah, Mike, and Alex
4. Enter items: "Burger $14", "Pizza $16", "Beer $6" (x2), "Coke $3"
5. Drag the burger to your avatar (you ordered it)
6. Drag the pizza to Sarah
7. Drag one beer to Mike, one to Alex
8. Drag the Coke to Sarah
9. Enter tax ($3.50) and tip ($8.00)
10. Tap Sarah → Venmo opens with her total ($21.38) ready to request

## Development

### Tech Stack

- **SwiftUI** - Modern declarative UI framework
- **Liquid Glass** - Apple's dynamic material design system
- **Swift Concurrency** - async/await for seamless operations
- **Transferable Protocol** - Native drag and drop support
- **URL Schemes** - Deep linking for Venmo integration

### Architecture

- Clean separation of models, views, and business logic
- Smooth animations with spring physics
- Glass effect containers for related UI elements
- Interactive glass materials that respond to touch
- Robust calculation engine for splitting bills fairly
- Extensible design for future payment integrations

### Design System

See [LIQUID_GLASS_GUIDE.md](LIQUID_GLASS_GUIDE.md) for detailed information about how Apple's Liquid Glass design system is implemented throughout the app.

## Roadmap

### MVP (Phase 1) ✅
- [x] Receipt item entry and management
- [x] Person/friend management with color themes
- [x] Drag-and-drop item assignment
- [x] Tax and tip distribution logic
- [x] Total calculation per person
- [x] Venmo deep link integration
- [x] **Apple Liquid Glass design system**
- [x] Interactive glass effects and animations

### Future Features (Phase 2+)
- [ ] Save and view past bills
- [ ] Edit bill names and details
- [ ] OCR receipt scanning
- [ ] Support for splitting items by percentage (not just evenly)
- [ ] Additional payment apps (Zelle, Cash App, PayPal)
- [ ] Group presets (save frequent groups)
- [ ] Settlement history and tracking
- [ ] Export summaries as PDF or image

## Documentation

- 📖 **[Quick Start Guide](QUICK_START.md)** - User guide for getting started with Spliddit
- 🎨 **[Liquid Glass Implementation Guide](LIQUID_GLASS_GUIDE.md)** - Technical details of the Liquid Glass design
- ✨ **[Liquid Glass Summary](LIQUID_GLASS_SUMMARY.md)** - Overview of all Liquid Glass features
- 🖼️ **[Visual Design Specification](VISUAL_DESIGN.md)** - Complete visual design documentation
- 📝 **[Changelog](CHANGELOG.md)** - Version history and updates

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[Add your license information here]

## Author

Walter Lee

## Acknowledgments

Created on November 15, 2025

---

**Note**: This is an active development project. Features and documentation will be updated as development progresses.
