# HUDDLE — Campus Life Platform 🎓

HUDDLE is a campus-life mobile and web application built for college students (Build Arena Hackathon). It solves the problem of campus information and student engagement being fragmented across disparate platforms by centralizing study partnerships, campus events, student clubs, and collaborative learning into a unified ecosystem.

---

## 🏗️ Architecture & Technology Stack

HUDDLE is organized as a unified monorepo powered by **Serverpod 3.4.13** and **Flutter 3.41**:

```
microsoft huddle/
├── HUDDLE_FEATURES.md       # Full feature matrix & requirement tracker
├── README.md                # Project quickstart and run guide
└── huddle/                  # Monorepo root
    ├── huddle_server/       # Serverpod Backend (Endpoints, .spy.yaml models, Migrations)
    ├── huddle_client/       # Shared typed Dart client library
    └── huddle_flutter/      # Flutter application (Mobile, Desktop, Web)
```

- **Frontend:** Flutter + Dart (Material 3, Dark Navy & Violet/Teal design system, Google Fonts Inter)
- **Backend:** Serverpod (Typed RPC, WebSockets, ORM, Auth, Endpoint validation)
- **Database:** PostgreSQL (Docker containerized or managed cloud instance)
- **Cache:** Redis
- **Resilient Dual-Mode Engine:** `HuddleService` seamlessly calls live Serverpod client endpoints while maintaining built-in seed fallbacks for zero-crash demonstrations and offline hackathon judging.

---

## 🚀 Quickstart: Running the Application

### Option A: Run Flutter App (Instant Demo)

From `huddle/huddle_flutter`:

```powershell
cd "c:\Users\rudra\OneDrive\Desktop\microsoft huddle\huddle\huddle_flutter"

# Run on Chrome
flutter run -d chrome

# Or run natively on Windows Desktop
flutter run -d windows
```

### Option B: Run Serverpod Backend with Docker

1. Ensure Docker Desktop is running.
2. In a terminal:
```powershell
cd "c:\Users\rudra\OneDrive\Desktop\microsoft huddle\huddle\huddle_server"

# Start PostgreSQL and Redis containers
docker compose up -d

# Apply database migrations & run server
dart run bin/main.dart --apply-migrations
```
The Serverpod backend will listen at `http://localhost:8080/` (API) and `http://localhost:8082/` (Web/Insights).

---

## 📱 Features Implemented

### 1. Authentication & Profiles
- [x] Student registration (name, email, password, course, year, college, bio)
- [x] Login, logout, persistent session with `HuddleService`
- [x] Profile editor with study preferences:
  - Mode: *Online, In-Person, Hybrid*
  - Timing: *Morning, Afternoon, Night*
  - Style: *Solo Focus, Pair Work, Group Study*
- [x] Interactive subject & interest tag selector chips

### 2. Study-Buddy Matching Engine
- [x] Discovery feed of students with compatibility cards
- [x] Dynamic Match Score (0–100%) computed based on shared courses, subjects, interests, and study preferences
- [x] Study request lifecycle: Send request, Accept, Decline, Cancel
- [x] Study Requests Hub: **Incoming**, **Outgoing**, and **Accepted Connections** tabs
- [x] Detailed student profile modal view

### 3. Campus Events Hub
- [x] Categorized events feed (Hackathon, Workshop, Cultural, Tech, Career)
- [x] Search by title, venue, or keyword
- [x] Detailed event view with organizer details, date/time, venue, seats remaining
- [x] 1-Tap RSVP & Unregister with live capacity counter updates
- [x] Event bookmarking & saved list

### 4. Student Communities & Clubs
- [x] Club discovery feed with member counts & category badges
- [x] 1-Tap Join / Leave toggle
- [x] Community detail page with member count, upcoming events, and community post discussions feed
- [x] Interactive "Share discussion / announcement" posting

### 5. Subject Quizzes & Challenges
- [x] Quizzes categorized by subject: *Data Structures & Algorithms*, *System Design*, *Fullstack Web*, *DBMS*
- [x] Single-question view with progress indicator
- [x] Instant answer checking, score calculation, and review screen with explanations
- [x] Best score & attempt history tracking

### 6. Central Dashboard (Home)
- [x] Personalized greeting header with user name and college
- [x] Unread notification badge & alert counter
- [x] Quick action navigation pills (*Find Buddy, Take Quiz, Explore Events, My Clubs*)
- [x] Horizontal carousel of top-matched study buddies
- [x] Upcoming registered events feed
- [x] Joined communities preview
- [x] Pending study requests banner

### 7. Real-Time Chat & Communications
- [x] 1-on-1 direct messaging screen between matched study buddies
- [x] Quick study prompts (*"Share notes", "Schedule call", "Review quiz"*)
- [x] Real-time message bubbles with timestamp formatting

### 8. Notifications, Bookmarks & Settings
- [x] Notifications screen with unread counter and "Mark all as read"
- [x] Bookmarks hub with tabbed filters for Saved Events and Saved Buddies
- [x] Settings screen with Dark/Light mode theme switch, notification toggles, and change password dialog

---

## 🎨 Design System

HUDDLE strictly adheres to the requested high-contrast, modern UI palette:
- **Midnight Navy Background:** `#090D1A`
- **Surface & Cards:** `#13192B` with `#232D48` borders
- **Primary Violet Accent:** `#7C3AED`
- **Secondary Teal Highlight:** `#05ECE1`
- **Typography:** Modern Google Fonts (Inter)
- **Every screen incorporates the 3 standard UI states:**
  - 🔄 **Loading:** Pulsing shimmer skeletons
  - 📭 **Empty:** Friendly illustrations, explanatory message, and CTA buttons
  - ⚠️ **Error:** Detailed error explanation and retry action

---

## 🧪 Verification & Analysis Status

- `dart analyze` across entire monorepo (`huddle_server`, `huddle_client`, `huddle_flutter`): **0 issues found** ✅
- `serverpod generate`: **0 errors** ✅
- `flutter build web`: **Compiled successfully** (`build/web`) ✅
