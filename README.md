# IPOT QR Ordering — Flutter

Customer-facing QR ordering app: scan table QR → browse menu → add to cart → place order → track status.

---

## 🚀 Setup

**Requirements**: Flutter 3.19+, Dart 3.2+

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate freezed/json models
dart run build_runner build --delete-conflicting-outputs

# 3. Run app
flutter run
```

---

## 🏗️ Architecture

The app follows a **Feature-first Clean Architecture** pattern, emphasizing separation of concerns and high maintainability.

### 1. Presentation Layer (Page-View-Widget Pattern)
To keep the UI code clean and decoupled, each feature is split into three layers:
- **`*_screen.dart` (Page)**: The entry point. It handles dependency injection (providing BLoCs/Cubits) and acts as a wrapper for the view.
- **`*_view.dart` (View)**: Contains the primary layout and high-level UI logic (handling state transitions, listeners, and main scaffold).
- **`widgets/*.dart` (Components)**: Reusable, atomic UI components extracted to keep the View files concise and readable.

### 2. State Management (BLoC/Cubit)
- **BLoC**: Used for complex async flows with multiple event types (e.g., `MenuBloc` for search/filter/fetch, `OrderBloc` for submission/polling).
- **Cubit**: Used for simpler, local state management (e.g., `CartCubit` as a singleton for shared cart data, `ScannerCubit` for QR processing).

### 3. Data Layer
- **Repository Pattern**: BLoCs communicate only with Repositories.
- **Offline Support**: `MenuRepository` implements a caching strategy using **Hive**. It serves cached data for up to 30 minutes if the network fails.
- **API Service**: Powered by **Dio** for robust HTTP networking.

### 4. Navigation & UX
- **GoRouter**: Declarative routing with custom **Fade & Scale transitions** for a premium feel.
- **Premium UI**: Modern aesthetic using **Plus Jakarta Sans** typography, a **Deep Navy & Electric Blue** palette, and smooth animations (pulse effects on scanner and order timeline).

---

## 📂 Project Structure

```
lib/
├── core/           # DI (GetIt), routing (GoRouter), global theme
├── data/           # Models (Freezed), repositories, API service
└── features/
    ├── splash/     # Animated entry sequence
    ├── scanner/    # QR parsing & camera logic
    ├── menu/       # Category filtering & featured offers
    ├── cart/       # Order summary & checkout
    └── order/      # Real-time status tracking (polling)
```

---

## 🧪 Testing

The project prioritizes logic validation through unit and BLoC tests.

| File                      | Coverage                                         |
| ------------------------- | ------------------------------------------------ |
| `cart_cubit_test.dart`    | add, increment, decrement, remove, subtotal math |
| `scanner_cubit_test.dart` | valid QR, invalid QR, empty tableId, reset       |
| `menu_bloc_test.dart`     | fetch success/error, category filter, search     |

```bash
# Run all tests
flutter test
```

---

## ✨ Key Features

- **Animated Splash Screen**: High-impact brand introduction.
- **Dynamic Promo Carousel**: Engaging special offers on the menu page.
- **Shimmer & Pulse Effects**: Visual feedback for active scanning and order tracking.
- **Real-time Order Polling**: Automatic status updates every 5 seconds until delivery.
- **Deep Customization**: Enforcement of required options, max selections, and price modifiers.
