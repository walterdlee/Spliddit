# Changelog

All notable changes to Spliddit will be documented in this file.

## [Unreleased]

## [1.0.0] - 2025-11-15

### ✨ Major Features Added

#### Apple Liquid Glass Design System
- Implemented Apple's cutting-edge Liquid Glass design throughout the entire app
- Added glass effects to all major UI elements
- Integrated `GlassEffectContainer` for smooth element blending
- Applied `.glass` and `.glassProminent` button styles across the app

#### Welcome Screen (ContentView)
- Complete redesign with Liquid Glass aesthetic
- Beautiful gradient background (blue → purple → pink)
- Large glass icon with receipt symbol
- Glass title card with app name and tagline
- Two glass buttons: "Create New Bill" (prominent) and "View Saved Bills"
- Navigation to bill creation

#### Bill Splitting Interface (BillView)
- **People Section**
  - Glass container with person cards
  - `GlassEffectContainer` allows nearby cards to blend together
  - Each person card has interactive glass with personalized color tint
  - Drop target highlighting with animated borders during drag operations
  - Scale effect (1.05x) when dragging items over cards
  - Real-time total calculation per person

- **Receipt Items Section**
  - Glass container for all items
  - Individual items with interactive glass effects
  - Person name tags use capsule glass with color tints
  - Drag and drop support with visual feedback
  - Remove button for each item

- **Tax & Tip Section**
  - Glass container matching design language
  - Display current tax and tip amounts
  - Glass edit button to open input sheet

- **Summary Section**
  - Glass container with subtle green tint
  - Displays subtotal and grand total
  - Emphasizes final amount with larger typography

#### Person Management (AddPersonView)
- Form-based person creation
- Name input field
- Color selection grid (10 colors)
- Glass effect on each color circle
- Selected colors get interactive glass + checkmark
- Smooth selection animations
- Glass prominent "Add" button

#### Item Management (AddItemView)
- Form-based item creation
- Item name input
- Price input with $ prefix
- Glass prominent "Add" button
- Input validation

#### Tax & Tip Input (TaxTipView)
- Separate inputs for tax and tip
- Quick tip percentage buttons (15%, 18%, 20%, 25%)
- Buttons in `GlassEffectContainer` with glass style
- Glass prominent "Done" button

### 🎨 Visual Design

#### Glass Effects
- **Basic glass**: Used for containers and sections
- **Tinted glass**: Person cards with their assigned colors (15% opacity)
- **Interactive glass**: Touch-responsive elements
- **Capsule glass**: Person tags on items (30% opacity tint)

#### Animations
- Spring animations (0.3s response time)
- Scale effects on hover
- Color highlighting on drop targets
- Smooth state transitions

#### Colors
- 10 person colors: Blue, Green, Orange, Purple, Pink, Yellow, Cyan, Indigo, Mint, Red
- Gradient backgrounds
- Context-dependent tints
- Dark mode support

### 🔧 Technical Implementation

#### Core Functionality
- **Drag and Drop**: Implemented using `Transferable` protocol
  - Long press to start drag
  - Visual feedback during drag
  - Drop on person cards to assign items
  - Multi-person assignment for splitting items

- **Real-time Calculations**
  - Automatic subtotal calculation
  - Proportional tax and tip distribution
  - Per-person totals
  - Split item pricing (divided equally)

- **Data Models**
  - `Bill`: Main bill structure
  - `Person`: Individual with name, color, and ID
  - `ReceiptItem`: Item with name, price, and assigned people
  - All models conform to `Identifiable`, `Codable`
  - `ReceiptItem` conforms to `Transferable` for drag/drop

#### Architecture
- SwiftUI for all views
- State management with `@State` and `@Binding`
- Sheets for modal presentations
- Navigation stack for view hierarchy
- Reusable components (PersonCard, ReceiptItemRow)

### 💳 Integrations

#### Venmo
- Deep linking support
- Pre-filled amount from calculated total
- Pre-filled note with bill name
- Automatic fallback to web if app not installed
- URL scheme: `venmo://paycharge?txn=charge&amount=X&note=Y`

### 📚 Documentation

#### Created Documents
- **README.md** - Project overview, features, and getting started
- **QUICK_START.md** - User guide for using the app
- **LIQUID_GLASS_GUIDE.md** - Technical implementation details
- **LIQUID_GLASS_SUMMARY.md** - Overview of all Liquid Glass features
- **VISUAL_DESIGN.md** - Complete visual design specification
- **CHANGELOG.md** - This file

### 🎯 User Experience

#### Interactions
- **Drag and drop items** - Long press → drag → drop on person
- **Tap person card** - Opens Venmo with pre-filled payment request
- **Add buttons** - All use glass styles for consistency
- **Color selection** - Interactive glass provides clear feedback
- **Edit actions** - Glass buttons throughout

#### Visual Feedback
- Drop target highlighting with person's color
- Animated borders during drag operations
- Scale effects on interactive elements
- Checkmarks on selected colors
- Real-time total updates

### 🚀 Performance

#### Optimizations
- Used `GlassEffectContainer` for groups of glass elements
- Limited glass effect nesting
- Interactive glass only on touch targets
- Efficient state updates
- Lightweight view hierarchy

### 📱 Platform Support

#### Requirements
- iOS 17.0+ (for Liquid Glass effects)
- Xcode 15.0+
- Swift 5.9+
- Modern Apple devices for optimal visual effects

#### Compatibility
- iPhone: All sizes supported
- iPad: Adaptive layout
- Dark Mode: Full support
- Accessibility: VoiceOver compatible

### 🐛 Bug Fixes
- Fixed drag and drop not working (added `Transferable` conformance)
- Fixed person card drop destinations
- Improved visual feedback during interactions

### ⚠️ Known Limitations
- Cannot edit bill names after creation (coming in future update)
- Cannot remove people once added (coming in future update)
- Cannot remove item assignment without deleting entire item (coming in future update)
- Bills are not persisted (coming in future update)
- No undo/redo functionality (coming in future update)

### 🔮 Future Roadmap

#### Phase 2
- [ ] Bill persistence (save and load bills)
- [ ] Edit bill names
- [ ] Remove people from bills
- [ ] Edit/remove item assignments
- [ ] Undo/redo support

#### Phase 3
- [ ] OCR receipt scanning
- [ ] Multiple currency support
- [ ] Additional payment integrations (Zelle, Cash App, PayPal)
- [ ] Export summaries as PDF or image
- [ ] Group presets (save frequent groups)

#### Phase 4
- [ ] Percentage-based splitting (not just equal splits)
- [ ] Settlement history and tracking
- [ ] Recurring bills
- [ ] Bill templates
- [ ] Multi-bill management

---

## Version History

### [1.0.0] - 2025-11-15
- Initial release with complete Liquid Glass design system
- Core bill splitting functionality
- Venmo integration
- Comprehensive documentation

---

## Contributing

See [README.md](README.md) for contribution guidelines.

## License

[Add license information]

---

**Built with ❤️ and Liquid Glass ✨**
