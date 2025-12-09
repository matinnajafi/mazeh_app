# Copilot Instructions for Mazeh App

## Project Overview
**Mazeh App** is a modern Flutter recipe application featuring RTL (right-to-left) support for Persian language. The app showcases recipes with animated interactions, saved recipes management, and category-based browsing.

**Stack:** Flutter 3.7.2+, Dart, Material Design

---

## Architecture & Key Patterns

### Directory Structure
- `lib/screens/` - Full-page widgets (SaveRecipeScreen, HomeScreen)
- `lib/widgets/` - Reusable UI components with specific responsibilities
- `lib/constants/` - Centralized configuration (colors, constants)
- `images/` - Asset images referenced in code (e.g., `images/recipe.png`)

### RTL-First Design Pattern
**This app is built for Persian language with RTL text direction as the default:**
- Wrap content with `Directionality(textDirection: TextDirection.rtl, child: ...)` in screens/lists
- See example: `SaveRecipeScreen` line 31 and `RecipeList` line 16 in `recipe_card_widget.dart`
- Use Persian text in UI labels (e.g., "دستورهای ذخیره‌شده" = "Saved Recipes")
- When creating new screens, explicitly set RTL in Directionality widget for consistency

### Animation Strategy
**Use flutter_staggered_animations (v1.1.1) for list item animations:**
- Wrap lists with `AnimationLimiter` for proper coordination
- Use `AnimationConfiguration.staggeredList(position: index)` with 600ms duration
- Apply `SlideAnimation` (verticalOffset: 40) + `FadeInAnimation` combo for entrance effects
- Example: `SaveRecipeScreen` lines 40-51 demonstrates full pattern

### Custom AppBar Pattern
**Use FadeScrollAppBar (v0.0.7) for advanced scroll behavior:**
- Configure with `scrollController`, `expandedHeight: 280`, `fadeOffset: 110`
- Define separate `appBarLeading` (expanded state) and `fadeWidget` (collapsed state)
- Apply custom colors via `backgroundColor` and `fadeWidget`
- Used in `HomeScreen` - study this implementation for scroll-triggered UI changes

### Color System
**Single source of truth in `constants/app_color.dart`:**
```dart
static const Color red = Color(0xFFFF4949);        // Primary accent
static const Color backgroundColor = Color(0xFFECECEC);  // Default background
```
- Define new colors here before using in widgets
- Use `AppColor.red`, `AppColor.backgroundColor` throughout

---

## Development Workflows

### Building & Running
```bash
flutter pub get          # Install dependencies
flutter run             # Run on connected device/emulator
flutter analyze         # Check lint issues (see analysis_options.yaml)
```

### Key Dependencies & Usage
| Package | Version | Purpose | Example File |
|---------|---------|---------|--------------|
| flutter_staggered_animations | 1.1.1 | List animation coordination | SaveRecipeScreen |
| fade_scroll_app_bar | 0.0.7 | Scroll-based AppBar transitions | HomeScreen |
| carousel_slider | 5.1.1 | Banner carousel | BannerSlider widget |
| flutter_lints | Latest | Code quality enforcement | Configured in analysis_options.yaml |

### Asset Images
- Store in `images/` directory (e.g., `images/recipe.png`, `images/user.jpg`)
- Reference as: `Image.asset('images/filename.png')`
- Used in `RecipeCardWidget` and `AppbarLeading`

---

## Code Conventions

### Stateless vs Stateful
- Use `StatelessWidget` for UI-only components (RecipeCardWidget, AppbarLeading)
- Use `StatefulWidget` with `ScrollController` when managing scroll behavior (HomeScreen)
- Explicit `const` constructors for all widgets (improves performance)

### Widget Composition
- Single responsibility: Each widget in `widgets/` handles one concern
- Example: `RecipeCardWidget` handles recipe display, not data fetching
- Use `SliverToBoxAdapter` to wrap non-Sliver widgets in `CustomScrollView`

### Spacing & Layout
- Prefer `SizedBox(height: X)` for vertical spacing between Slivers
- Use `Padding(EdgeInsets.symmetric(...))` for consistent margins
- Follow Material Design spacing scale (4, 8, 12, 16, 24, etc.)

### Empty States
- Always provide empty state UI (see `SaveRecipeScreen._buildEmptyState()`)
- Use icons from `Icons` (e.g., `Icons.bookmark_border`) with `size: 80`
- Provide helpful text instructions in Persian

---

## Testing & Validation
- Lint checks enabled via `flutter_lints` (see `analysis_options.yaml`)
- Run `flutter analyze` before committing
- No custom test framework configured; use standard `flutter_test` for unit tests

---

## Critical Integration Points

### Navigation
- Currently using `MaterialApp.home` for simple navigation (main.dart)
- Entry point: `SaveRecipeScreen` (will likely expand to multi-screen navigation)
- For adding routes: Use `Navigator.push()` or implement named routing

### Image Assets
- Hardcoded image paths: `'images/recipe.png'`, `'images/user.jpg'`
- Ensure images exist in assets folder before use
- Consider data-driven approach as app scales

### Font Family
- Persian font 'CSB' used in `AppbarLeading` (font must be configured in pubspec.yaml)
- Default Material font used elsewhere; only override when necessary

---

## Common Tasks

**Add a new screen:**
1. Create file in `lib/screens/`
2. Extend `StatelessWidget` or `StatefulWidget`
3. Wrap content with `Directionality(textDirection: TextDirection.rtl, ...)`
4. Use `Scaffold` as root widget
5. Compose from existing widgets in `lib/widgets/`

**Add a reusable widget:**
1. Create file in `lib/widgets/`
2. Follow naming: `<Feature>Widget` or `<Feature>Item`
3. Make `const` constructor
4. Keep logic minimal (avoid business logic)
5. Accept configuration via constructor parameters

**Add new color:**
1. Define in `constants/app_color.dart`
2. Use `static const Color` pattern
3. Reference throughout app as `AppColor.colorName`

---

## Known Limitations & TODOs
- Data is currently mock-generated (SaveRecipeScreen: `List.generate(10, ...)`)
- No backend integration yet
- Image paths hardcoded (consider asset management)
- Navigation not yet fully implemented beyond entry point
