# Spliddit Setup Guide

## Adding Files to Xcode Project

The following Swift files have been created in your project directory:

1. **Models.swift** - Core data models (Person, ReceiptItem, Bill)
2. **BillView.swift** - Main bill splitting interface
3. **AddItemView.swift** - Sheet for adding receipt items
4. **AddPersonView.swift** - Sheet for adding people
5. **TaxTipView.swift** - Sheet for entering tax and tip
6. **ContentView.swift** - Updated to show BillView

### Steps to Add Files to Xcode:

1. Open **Spliddit.xcodeproj** in Xcode
2. In the Project Navigator (left sidebar), right-click on the "Spliddit" folder
3. Select "Add Files to Spliddit..."
4. Select all the new Swift files:
   - Models.swift
   - BillView.swift
   - AddItemView.swift
   - AddPersonView.swift
   - TaxTipView.swift
5. Make sure "Copy items if needed" is **unchecked** (files are already in the right place)
6. Make sure "Add to targets: Spliddit" is **checked**
7. Click "Add"

**Note:** ContentView.swift should already be in your project, so you don't need to add it again.

## Running the App

1. Press **⌘ + R** or click the Play button in Xcode
2. Choose an iOS Simulator (iPhone 15 recommended)
3. The app should build and run

## Testing Spliddit

### Basic Flow:

1. **Add People:**
   - Tap "Add Person" button in the People section
   - Enter names like "Sarah", "Mike", "Alex"
   - Choose different colors for each person
   - Add them

2. **Add Receipt Items:**
   - Tap "Add Item" in the Receipt Items section
   - Enter items like:
     - "Burger" - $14.00
     - "Pizza" - $16.00
     - "Beer" - $6.00
     - "Coke" - $3.00

3. **Drag & Drop Items:**
   - Long press on a receipt item
   - Drag it over to a person's card
   - Drop it to assign that item to that person
   - You can drop the same item on multiple people to split it!

4. **Add Tax & Tip:**
   - Tap the edit icon in Tax & Tip section
   - Enter tax amount (e.g., $3.50)
   - Enter tip amount (e.g., $8.00)
   - Tap Done

5. **View Totals:**
   - Each person's card shows how much they owe
   - The summary at the bottom shows the overall total
   - Tax and tip are distributed proportionally

6. **Venmo Integration:**
   - Tap on a person's card
   - If Venmo is installed, it opens with the amount pre-filled
   - If not, it opens the Venmo website

## Known Limitations

1. **Venmo URL Scheme:** The Venmo deep link may need the recipient's username or phone number. Currently it just opens Venmo with the amount.

2. **Data Persistence:** Bills are not saved between app launches yet (this would be a future feature).

3. **Item Editing:** You can't edit items once created, only delete and re-add them.

## Troubleshooting

### Build Errors:

If you get build errors about missing files:
- Make sure all .swift files are added to the Xcode project (see steps above)
- Check that they're added to the correct target

### Drag & Drop Not Working:

- Make sure you're doing a **long press** on the item before dragging
- iOS Simulator: Click and hold, then drag
- Real device: Touch and hold, then drag

### Venmo Not Opening:

- Venmo integration requires the Venmo app to be installed
- Test on a real device with Venmo installed for best results
- On simulator, it will try to open venmo.com

## Next Steps

Ideas for enhancements:
- [ ] Save bills with SwiftData/Core Data
- [ ] OCR receipt scanning with Vision framework
- [ ] Edit existing items
- [ ] Multiple bills management
- [ ] Export/share bill summaries
- [ ] Support for percentage-based splits (not just even splits)
- [ ] Integration with other payment apps (Zelle, Cash App)
