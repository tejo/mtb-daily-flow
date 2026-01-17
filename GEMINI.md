# MTB Daily Flow Project

## Project Overview
This project is a standalone web application designed to guide users through a 10-minute daily Mountain Bike (MTB) training routine. The application provides a timer, exercise instructions, and embedded video demonstrations for a series of mobility, balance, and reactivity exercises.

## Architecture & Technologies
*   **Type:** Hybrid Mobile App (Capacitor) / Single-Page Application (SPA).
*   **Technologies:** HTML5, CSS3, Vanilla JavaScript, Capacitor (Android).
*   **Structure:**
    *   `www/`: Contains the web application (HTML, CSS, JS).
    *   `android/`: Contains the native Android project.
    *   Root: Build configuration and scripts.

## Key Files
*   **`www/index.html`**: The main entry point. Contains UI, logic, and data.
*   **`mtb_exercise.md`**: Documentation outlining the "MTB Flow & Reactivity" training plan.
*   **`plan.md`**: Current migration plan for Capacitor and Android CLI build.

## Building and Running
*   **Web:** Open `www/index.html` locally or serve via `make serve`.
*   **Android:** Use `make build-android` (requires Android SDK setup).

## Development Conventions
*   **Code Style:** Keep CSS and JS embedded within `index.html` unless the project grows significantly.
*   **Naming:** CamelCase for JS variables (`timeLeft`, `startBtn`), dashed-case for CSS classes/IDs (`#app-container`).
*   **Video Integration:** Videos are embedded via YouTube iframes with parameters optimized for autoplay and looping (muted).