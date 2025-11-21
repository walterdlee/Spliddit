# Spliddit Visual Design Overview

This document describes the visual appearance and design of Spliddit with Apple's Liquid Glass design system.

## App Screens

### 1. Welcome Screen (ContentView)

**Visual Description:**
```
┌─────────────────────────────┐
│                             │
│    [Gradient Background]    │
│    Blue → Purple → Pink     │
│                             │
│         ╭─────╮             │
│         │ 📄  │  ← Glass    │
│         ╰─────╯    Circle   │
│                             │
│      ╭──────────╮           │
│      │ Spliddit │           │
│      ╰──────────╯           │
│   Split bills with ease     │
│                             │
│                             │
│  ┌─────────────────────┐   │
│  │ + Create New Bill   │   │ ← Glass Prominent
│  └─────────────────────┘   │
│                             │
│  ┌─────────────────────┐   │
│  │ 📋 View Saved Bills │   │ ← Glass
│  └─────────────────────┘   │
│                             │
└─────────────────────────────┘
```

**Glass Elements:**
- Large circular glass icon with receipt symbol
- Rectangular glass title card
- Two glass buttons with different prominence levels
- Gradient background creates depth

**Colors:**
- Background: Blue-Purple-Pink gradient
- Text: White
- Glass: Translucent with blur

---

### 2. Bill View (Main Screen)

**Visual Description:**
```
┌─────────────────────────────────┐
│ ← Dinner at Joe's         ⋯    │
│                                 │
│ ╭────────────────────────────╮  │
│ │ People     [+ Add Person]  │  │
│ │                            │  │
│ │  ┌────┐  ┌────┐  ┌────┐   │  │
│ │  │ 👤 │  │ 👤 │  │ 👤 │   │  │ ← Person Cards
│ │  │ S  │  │ M  │  │ A  │   │  │   (Glass with
│ │  │$14 │  │$22 │  │$18 │   │  │    color tint)
│ │  └────┘  └────┘  └────┘   │  │
│ ╰────────────────────────────╯  │
│                                 │
│ ╭────────────────────────────╮  │
│ │ Receipt Items [+ Add Item] │  │
│ │                            │  │
│ │ ┌──────────────────────┐  │  │
│ │ │ Burger        $14.00 │  │  │ ← Item Rows
│ │ │ [Sarah]           🗑️ │  │  │   (Interactive
│ │ └──────────────────────┘  │  │    glass)
│ │                            │  │
│ │ ┌──────────────────────┐  │  │
│ │ │ Pizza         $16.00 │  │  │
│ │ │ [Mike]            🗑️ │  │  │
│ │ └──────────────────────┘  │  │
│ ╰────────────────────────────╯  │
│                                 │
│ ╭────────────────────────────╮  │
│ │ Tax & Tip          ✏️      │  │
│ │                            │  │
│ │ Tax      $3.50             │  │
│ │ Tip      $8.00             │  │
│ ╰────────────────────────────╯  │
│                                 │
│ ╭────────────────────────────╮  │
│ │ Subtotal        $54.00     │  │
│ │ ─────────────────────────  │  │
│ │ Total           $65.50     │  │ ← Green tinted
│ ╰────────────────────────────╯  │   glass
│                                 │
└─────────────────────────────────┘
```

**Glass Elements:**
- 4 main sections, each with glass effect
- Person cards in a `GlassEffectContainer` (can blend together)
- Interactive item rows with glass
- Buttons use glass styles

**Interactions:**
- Drag items from Receipt Items section
- Drop on person cards (they glow!)
- Tap person card → Opens Venmo
- Tap edit icons → Opens sheets

---

### 3. Add Person Sheet

**Visual Description:**
```
┌─────────────────────────────────┐
│ Cancel    Add Person    [Add]   │
│─────────────────────────────────│
│                                 │
│ Person Details                  │
│ ┌─────────────────────────────┐ │
│ │ Name                        │ │
│ └─────────────────────────────┘ │
│                                 │
│ Color                           │
│                                 │
│  ○  ○  ○  ○  ○                 │ ← Color circles
│  🔵 🟢 🟠 🟣 🔴                 │   with glass
│                                 │   (selected has
│  ○  ○  ○  ○  ○                 │    checkmark +
│  🟡 🔵 🟣 🟢 🩷                 │    interactive
│                                 │    glass)
│                                 │
└─────────────────────────────────┘
```

**Glass Elements:**
- Each color circle has glass effect
- Selected circle: Interactive glass + checkmark
- Add button: Glass prominent style

**Visual Feedback:**
- Selected circle glows
- Checkmark appears with animation
- Add button highlights when valid

---

### 4. Add Item Sheet

**Visual Description:**
```
┌─────────────────────────────────┐
│ Cancel      Add Item     [Add]  │
│─────────────────────────────────│
│                                 │
│ Item Details                    │
│ ┌─────────────────────────────┐ │
│ │ Item name                   │ │
│ └─────────────────────────────┘ │
│                                 │
│ ┌───┬─────────────────────────┐ │
│ │ $ │ 0.00                    │ │
│ └───┴─────────────────────────┘ │
│                                 │
└─────────────────────────────────┘
```

**Glass Elements:**
- Add button uses glass prominent style
- Clean, minimal design

---

### 5. Tax & Tip Sheet

**Visual Description:**
```
┌─────────────────────────────────┐
│ Cancel    Tax & Tip     [Done]  │
│─────────────────────────────────│
│                                 │
│ Tax                             │
│ ┌───┬─────────────────────────┐ │
│ │ $ │ 0.00                    │ │
│ └───┴─────────────────────────┘ │
│                                 │
│ Tip                             │
│ ┌───┬─────────────────────────┐ │
│ │ $ │ 0.00                    │ │
│ └───┴─────────────────────────┘ │
│                                 │
│ ┌────┐ ┌────┐ ┌────┐ ┌────┐   │ ← Tip buttons
│ │15% │ │18% │ │20% │ │25% │   │   in glass
│ └────┘ └────┘ └────┘ └────┘   │   container
│                                 │
└─────────────────────────────────┘
```

**Glass Elements:**
- Tip buttons in `GlassEffectContainer`
- All use glass button style
- Done button uses glass prominent
- Buttons can blend when close

---

## Color Palette

### Person Colors (10 options)
```
Blue    🔵  RGB(0, 122, 255)
Green   🟢  RGB(52, 199, 89)
Orange  🟠  RGB(255, 149, 0)
Purple  🟣  RGB(175, 82, 222)
Pink    🔴  RGB(255, 45, 85)
Yellow  🟡  RGB(255, 204, 0)
Cyan    🔵  RGB(50, 173, 230)
Indigo  🟣  RGB(88, 86, 214)
Mint    🟢  RGB(0, 199, 190)
Red     🔴  RGB(255, 59, 48)
```

### Glass Tints Used
- Person cards: Person color @ 15% opacity
- Person tags on items: Person color @ 30% opacity
- Summary total: Green @ 10% opacity
- App icon: Blue @ 20% opacity

### Background Gradients
- Welcome screen: Blue → Purple → Pink
- Other screens: System background (light/dark mode adaptive)

---

## Animation Details

### Spring Animations
**Response time**: 0.3 seconds
**Used for**:
- Drop target highlighting
- Card scaling
- Color selection
- State changes

### Scale Effects
- Drop target: 1.05x scale
- Normal: 1.0x scale
- Smooth interpolation

### Transitions
- Sheet presentations: Slide up
- Glass morphing: Automatic with containers
- Color changes: Cross-fade

---

## Typography

### Font Sizes
- **Large Title**: 48pt (App title)
- **Title**: 28pt (Navigation titles)
- **Title 2**: 22pt (Section totals)
- **Title 3**: 20pt (Tax/Tip amounts)
- **Headline**: 17pt (Section headers)
- **Body**: 17pt (Item names)
- **Subheadline**: 15pt (Button labels, person names)
- **Caption**: 12pt (Person amounts)
- **Caption 2**: 11pt (Person tags)

### Font Weights
- **Bold**: App title, totals
- **Semibold**: Amounts, button labels
- **Medium**: Item names, section headers
- **Regular**: Body text

### Font Designs
- **Rounded**: App title (friendly, modern)
- **Default (SF Pro)**: Everything else

---

## Spacing

### Padding
- Screen edges: 20pt
- Section internal: 12-16pt
- Between sections: 20pt
- Button content: 16pt vertical, 20pt horizontal

### Item Spacing
- Person cards: 16pt apart
- Receipt items: 8pt apart
- Color circles: 16pt apart
- Tip buttons: 12pt apart

### Corner Radii
- Large cards: 16pt
- Medium cards: 12pt
- Small elements: 8pt
- Circles: Full (50% of diameter)
- Capsules: Full (50% of height)

---

## Glass Effect Hierarchy

### Level 1: Containers (Sections)
```
Corner Radius: 16pt
Tint: None (or subtle)
Interactive: No
Purpose: Organization
```

### Level 2: Cards (People, Items)
```
Corner Radius: 12pt
Tint: Context-dependent (person colors)
Interactive: Yes
Purpose: Main content
```

### Level 3: Buttons & Tags
```
Corner Radius: 8pt (or capsule/circle)
Tint: Context-dependent
Interactive: Yes
Purpose: Actions and labels
```

---

## Accessibility

### Contrast
- White text on glass over gradients: WCAG AA compliant
- Person colors: All have sufficient contrast with white text
- Interactive elements: Clear visual distinction

### Touch Targets
- Minimum size: 44x44pt (Apple HIG)
- Person cards: 100x120pt (well above minimum)
- Buttons: Full width with padding
- Color circles: 50x50pt (above minimum)

### VoiceOver Support
- All interactive elements labeled
- Person cards: "[Name], owes [amount]"
- Buttons: Clear action labels
- Items: "[Item name], [price], assigned to [people]"

---

## Dark Mode Support

All glass effects automatically adapt to dark mode:
- Glass blur adjusts to dark backgrounds
- Text remains readable
- Person colors maintain identity
- Gradients invert appropriately

---

## Performance Considerations

### Glass Effect Optimization
- Used `GlassEffectContainer` for groups of elements
- Limited number of glass layers on screen
- Interactive glass only on touch targets
- Tint opacities kept low (0.1-0.3)

### Animation Optimization
- Spring physics with reasonable stiffness
- Minimal property changes during animations
- Reusable components to reduce view hierarchy

### Memory Usage
- Views are lightweight
- No heavy image assets
- SF Symbols for all icons
- Efficient state management

---

## Platform-Specific Details

### iOS 17.0+ Features Used
- `glassEffect()` modifier
- `GlassEffectContainer`
- `.glass` and `.glassProminent` button styles
- `Transferable` protocol
- Modern SwiftUI APIs

### Device Compatibility
- iPhone: All sizes (SE to Pro Max)
- iPad: Adaptive layout
- Older devices: Graceful degradation of effects

---

## Design Philosophy

### Principles
1. **Clarity** - Glass effects enhance, don't obscure
2. **Consistency** - Uniform spacing, sizing, and behavior
3. **Delight** - Smooth animations and tactile feedback
4. **Context** - Color tints provide meaning
5. **Performance** - Beautiful but efficient

### Inspiration
- Apple's iOS design language
- Liquid Glass introduction in iOS 17
- First-party Apple apps
- Modern, premium aesthetics

---

## Future Visual Enhancements

### Potential Additions
- [ ] Morphing transitions between views
- [ ] Glass effect unions for related elements
- [ ] Parallax effects on scroll
- [ ] Animated glass textures
- [ ] Custom glass shapes for special contexts
- [ ] Theme variations (dark glass, light glass)

---

**This visual design creates a cohesive, modern, and premium experience that feels distinctly Apple while being uniquely Spliddit! ✨**
