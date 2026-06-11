# 👑 Quiz Royale

> **Battle. Learn. Conquer.**
> A real-time multiplayer educational quiz game for kids — built with Flutter.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Tech Stack](#tech-stack)
3. [Repository Structure](#repository-structure)
4. [Firebase Setup](#firebase-setup)
5. [GitHub Upload](#github-upload)
6. [Codemagic Build](#codemagic-build)
7. [Phase Roadmap](#phase-roadmap)
8. [Architecture](#architecture)

---

## Project Overview

Quiz Royale is an Android-only real-time educational battle game where up to 6 kids compete to answer questions fastest and score highest. Features streak bonuses, XP levelling, and a live leaderboard.

**Target:** Android 5.0+ (API 21+)
**Players:** 2–6 per game
**Questions per round:** 10
**Time per question:** 15 seconds

---

## Tech Stack

| Layer | Technology |
|---|---|
| UI Framework | Flutter 3.22+ |
| State Management | Riverpod 2.x |
| Navigation | GoRouter 14.x |
| Auth | Firebase Auth |
| Game State DB | Firebase Realtime Database |
| User Data | Cloud Firestore |
| Push Notifications | Firebase Messaging |
| Architecture | Feature-first |

---

## Repository Structure

```
quiz_royale/
├── android/
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── kotlin/com/quizroyale/app/
│   │   │   │   └── MainActivity.kt
│   │   │   ├── res/
│   │   │   │   ├── drawable/launch_background.xml
│   │   │   │   ├── values/styles.xml
│   │   │   │   ├── values/colors.xml
│   │   │   │   └── xml/network_security_config.xml
│   │   │   └── AndroidManifest.xml
│   │   ├── build.gradle
│   │   └── google-services.json        ← REPLACE with real file
│   ├── gradle/wrapper/
│   │   └── gradle-wrapper.properties
│   ├── build.gradle
│   ├── gradle.properties
│   └── settings.gradle
├── assets/
│   ├── animations/                     ← Add Lottie JSON files here
│   ├── fonts/                          ← Add Nunito TTF fonts here
│   ├── icons/
│   └── images/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_constants.dart
│   │   │   ├── app_strings.dart
│   │   │   ├── constants.dart          ← barrel export
│   │   │   └── route_constants.dart
│   │   ├── router/
│   │   │   └── app_router.dart
│   │   ├── theme/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_dimensions.dart
│   │   │   ├── app_text_styles.dart
│   │   │   ├── app_theme.dart
│   │   │   └── theme.dart              ← barrel export
│   │   └── utils/
│   │       ├── app_logger.dart
│   │       └── extensions.dart
│   ├── features/
│   │   ├── error/
│   │   │   └── error_screen.dart
│   │   ├── loading/
│   │   │   └── loading_screen.dart
│   │   └── splash/
│   │       └── splash_screen.dart
│   ├── shared/
│   │   └── widgets/
│   │       ├── qr_avatar.dart
│   │       ├── qr_badge.dart
│   │       ├── qr_button.dart
│   │       ├── qr_card.dart
│   │       ├── qr_loader.dart
│   │       ├── qr_scaffold.dart
│   │       ├── qr_star_field.dart
│   │       ├── qr_text_field.dart
│   │       └── widgets.dart            ← barrel export
│   ├── app.dart
│   ├── firebase_options.dart           ← REPLACE with flutterfire output
│   └── main.dart
├── .gitignore
├── analysis_options.yaml
├── codemagic.yaml
├── pubspec.yaml
└── README.md
```

---

## Firebase Setup

**⚠️ The app will not compile until you complete these steps.**

### Step 1 — Create a Firebase project

1. Go to [console.firebase.google.com](https://console.firebase.google.com)
2. Click **Add project** → name it `quiz-royale`
3. Disable Google Analytics (optional for now)

### Step 2 — Register your Android app

1. In your Firebase project, click **Add app** → Android
2. Use package name: `com.quizroyale.app`
3. Download `google-services.json`
4. **Replace** `android/app/google-services.json` with the downloaded file

### Step 3 — Enable Firebase services

In the Firebase Console, enable:
- **Authentication** → Email/Password + Anonymous
- **Firestore Database** → Start in test mode
- **Realtime Database** → Start in test mode
- **Cloud Messaging** → (auto-enabled)

### Step 4 — Update firebase_options.dart

If you have Flutter installed locally:
```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=YOUR_PROJECT_ID
```
This overwrites `lib/firebase_options.dart` with real values.

**Without Flutter locally:** Manually copy the values from `google-services.json` into `lib/firebase_options.dart` following the field mapping in that file's comments.

---

## GitHub Upload

```bash
# 1. Create a new repo on github.com named "quiz-royale"

# 2. Extract the ZIP you downloaded

# 3. From inside the quiz_royale/ folder:
git init
git add .
git commit -m "Phase 1: Foundation"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/quiz-royale.git
git push -u origin main
```

---

## Codemagic Build

### Connect repository
1. Go to [codemagic.io](https://codemagic.io)
2. **Add application** → select your `quiz-royale` GitHub repo
3. Codemagic auto-detects `codemagic.yaml`

### First build (debug APK)
1. Select workflow **Android Debug APK**
2. Click **Start new build**
3. Download APK from the **Artifacts** tab when complete

### Add your email
Edit `codemagic.yaml` and replace `YOUR_EMAIL@example.com` with your real email to receive build notifications.

### ⚠️ Before building
Codemagic needs a valid `google-services.json`. Either:
- Commit your real `google-services.json` (private repo only), **or**
- Add it as a Codemagic **Environment variable** → group `firebase_credentials`
  - Variable name: `GOOGLE_SERVICES` / value: base64 of the file content
  - Add a script step to decode it before the build

---

## Phase Roadmap

| Phase | Feature |
|---|---|
| ✅ **1** | Foundation — Router, Theme, Splash, Shared Widgets |
| 🔲 **2** | Authentication — Email, Anonymous guest, Riverpod auth state |
| 🔲 **3** | Home & Lobby — Create/join game, room codes |
| 🔲 **4** | Game Engine — Questions, timer, answer selection, scoring |
| 🔲 **5** | Results & Leaderboard — Podium, XP, animated scoreboard |
| 🔲 **6** | Profile & Progression — Levels, avatars, stats |
| 🔲 **7** | Push Notifications — Game invites, friend challenges |
| 🔲 **8** | Polish — Sound, haptics, confetti, animations |

---

## Architecture

Quiz Royale uses **feature-first architecture**:

```
features/
  auth/
    data/        ← repositories, data sources
    domain/      ← models, use-cases
    presentation/ ← screens, controllers (Riverpod notifiers)
  game/
    data/
    domain/
    presentation/
  ...
```

**State management:** All state lives in Riverpod providers.
No `setState` except for purely local widget animation.

**Navigation:** GoRouter with redirect guards (Phase 2+) that check auth state.

**Data flow:**
```
UI → Riverpod Notifier → Repository → Firebase
Firebase → Stream → Riverpod Provider → UI rebuild
```
