
# CarouselView with Paging

An iOS collection view implementation that creates a beautiful carousel effect with smooth paging, 3D transformations, and interactive scrolling animations.

https://github.com/user-attachments/assets/f586ed8e-8a19-4fbe-b0e3-4ff17a28c91e

## Overview

This project demonstrates how to create a custom carousel view using `UICollectionView` with advanced visual effects including:

- **3D Transform Effects**: Cells scale and move vertically based on their distance from the center
- **Smooth Paging**: Custom paging behavior with velocity-based snapping
- **Interactive Scrolling**: Real-time visual feedback as users scroll through items
- **Circular Cell Design**: Beautiful circular containers for displaying content

## Features

### 🎨 Visual Effects
- **Scale Animation**: Cells scale down as they move away from center (configurable scale factor)
- **Vertical Movement**: Off-center cells move vertically to create depth perception
- **Z-Position Layering**: Center cell appears on top with proper depth ordering
- **Smooth Transitions**: Fluid animations during scrolling and interaction

### 📱 User Interaction
- **Velocity-Based Scrolling**: Smart paging that responds to swipe velocity
- **Tap to Center**: Tap any cell to smoothly scroll it to the center
- **Peek Effect**: Side cells are partially visible, encouraging exploration
- **Responsive Layout**: Adapts to different screen sizes and orientations

### 🎵 Sample Content
The demo showcases frequency-based images (396Hz, 417Hz, 432Hz, 528Hz, 639Hz, 741Hz) commonly associated with sound healing and meditation frequencies.

## Architecture

### Core Components

#### `HorizontalPagingCollectionViewController`
Base class providing the fundamental paging functionality:
- Custom scroll behavior with snap-to-cell animation
- Velocity threshold detection for smooth navigation
- Dynamic item sizing based on screen dimensions
- Configurable section insets

#### `CarouselCollectionViewController`
Extends the base class with carousel-specific features:
- 3D transformation calculations
- Real-time cell configuration during scrolling
- Scale and position animations
- Z-index management for proper layering

#### `CaruselItemCollectionCell`
Custom collection view cell featuring:
- Circular container view with black background
- Aspect-fit image display
- Auto-layout for different content sizes
- Reusable cell implementation

#### `CaruselItem`
Data model enum defining:
- Available carousel items
- Image asset name mapping
- Type-safe item enumeration

## Technical Implementation

### Transform Calculations
```swift
// Distance from center calculation
let distance = collectionView.contentOffset.x + collectionView.bounds.width / 2 - distanceDelta
let normalizedDistance = min(1, max(-1, distance / (collectionView.bounds.width / 2)))

// Scale transformation
let scaleFactor: CGFloat = 0.6
let scale = 1 - abs(normalizedDistance) * (1 - scaleFactor)

// Vertical offset for depth effect
let yOffset = abs(normalizedDistance) * collectionView.bounds.height / yCellPositionOffset
```

### Custom Paging Logic
- Tracks the major cell index before dragging begins
- Calculates velocity thresholds for smart snapping
- Implements spring-damped animations for smooth transitions
- Handles edge cases for first and last items

## Configuration

### Customizable Parameters

| Parameter | Description | Default Value |
|-----------|-------------|---------------|
| `scaleFactor` | How much cells shrink when off-center | 0.6 |
| `yCellPositionOffset` | Vertical movement divisor | 4 |
| `swipeVelocityThreshold` | Minimum velocity for page skipping | 0.5 |
| `sectionInset` | Spacing around carousel items | 120pt |
| `maxZPosition` | Maximum z-index for layering | 1000 |

### Layout Customization
Override `calculateSectionInset()` in your subclass to adjust the peek amount:
```swift
override func calculateSectionInset() -> CGFloat {
    return 120 // Adjust for more/less peeking
}
```

## Requirements

- **iOS**: 11.0+
- **Xcode**: 12.0+
- **Swift**: 5.0+
- **Frameworks**: UIKit

## Usage

1. **Subclass HorizontalPagingCollectionViewController** for basic paging
2. **Subclass CarouselCollectionViewController** for full carousel effects
3. **Implement data source methods** to provide your content
4. **Customize visual parameters** as needed for your design

### Basic Implementation
```swift
class MyCarouselViewController: CarouselCollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register your custom cell
        collectionView.register(YourCustomCell.self, 
                               forCellWithReuseIdentifier: "YourCell")
    }
    
    override func calculateSectionInset() -> CGFloat {
        return 100 // Customize peek amount
    }
}
```

## Demo Content

The included demo features frequency-based imagery:
- **396Hz**: Root Chakra - Grounding
- **417Hz**: Sacral Chakra - Change
- **432Hz**: Heart Chakra - Healing
- **528Hz**: Solar Plexus - Transformation
- **639Hz**: Throat Chakra - Communication
- **741Hz**: Third Eye Chakra - Intuition

## Performance Considerations

- Transforms are applied only to visible cells for optimal performance
- Z-position calculations are lightweight and cache-friendly
- Spring animations use optimal damping values to prevent oscillation
- Layout updates are minimized through efficient scroll handling

## License

Copyright © 2018-2025 Shai Balassiano & Taras Chernysh. All rights reserved.

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

---

*Perfect for meditation apps, music players, image galleries, or any interface requiring elegant horizontal navigation with visual flair.*


