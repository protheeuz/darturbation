# darturbation

A Flutter package that provides a collection of customizable and smooth animations for various UI elements such as buttons, loading indicators, page transitions, fade transitions, rotation transitions, and scale transitions.

## Features

- **Button Animations**: Pulse, Bounce, and Rotation animations for buttons.
- **Fade Transitions**: Smooth fade transitions for page navigation.
- **Loading Indicators**: Spinning, Pulsing, and Bouncing animations for loading indicators.
- **Page Transitions**: Slide, Fade, Scale, and Rotation transitions for page navigation.
- **Rotation Transitions**: Smooth rotation transitions for page navigation.
- **Scale Transitions**: Smooth scale transitions for page navigation.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  darturbation:
    git:
      url: https://github.com/protheeuz/darturbation.git
      ref: main
```

### Usage

## Page Transition
```dart
import 'package:darturbation/darturbation.dart';

// Use CustomPageTransition for smooth page transitions
Navigator.of(context).push(CustomPageTransition(page: YourNextPage(), transitionType: PageTransitionType.slide));
```
## Button Animations
```dart
import 'package:darturbation/darturbation.dart';

// Use AnimatedButton for interactive button animations
AnimatedButton(
  text: 'Press Me',
  onPressed: () {
    // Your onPressed logic here
  },
  animationType: ButtonAnimationType.pulse, // Options: pulse, bounce, rotation
);
```
## Loading Indicators
```dart
import 'package:darturbation/darturbation.dart';

// Use LoadingIndicator for custom loading animations
LoadingIndicator(
  indicatorType: LoadingIndicatorType.spinning, // Options: spinning, pulsing, bouncing
  color: Colors.blue,
  size: 50.0,
);
```
## Fade Transition
```dart
import 'package:darturbation/darturbation.dart';

// Use FadeTransitionPage for fade transitions
Navigator.of(context).push(FadeTransitionPage(page: YourNextPage()));
```
## Scale Transition
```dart
import 'package:darturbation/darturbation.dart';

// Use ScaleTransitionPage for scale transitions
Navigator.of(context).push(ScaleTransitionPage(page: YourNextPage()));
```
## Rotation Transition
```dart
import 'package:darturbation/darturbation.dart';

// Use RotationTransitionPage for rotation transitions
Navigator.of(context).push(RotationTransitionPage(page: YourNextPage()));
```
### Example
Check the [example](lib/example/main.dart) directory for a complete example of how to use this package.