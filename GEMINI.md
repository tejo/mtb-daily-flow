# MTB Daily Flow Project

## Project Overview
This project is a standalone web application designed to guide users through a 10-minute daily Mountain Bike (MTB) training routine. The application provides a timer, exercise instructions, and embedded video demonstrations for a series of mobility, balance, and reactivity exercises. It is built as a hybrid app using Capacitor, distributable as a web app and an Android APK.

## Architecture & Technologies
*   **Type:** Hybrid Mobile App (Capacitor) / Single-Page Application (SPA).
*   **Technologies:** HTML5, CSS3, Vanilla JavaScript, Capacitor (Android).
*   **Structure:**
    *   `www/`: Contains the web application (HTML, CSS, JS) and the generated APK (`www/apk/`).
    *   `android/`: Contains the native Android project.
    *   `android-sdk/`: Local Android SDK (ignored by git).
    *   Root: Build configuration (`Makefile`, `capacitor.config.ts`, `package.json`).

## Key Files
*   **`www/index.html`**: The main entry point. Contains UI, logic, and data.
*   **`mtb_exercise.md`**: Documentation outlining the "MTB Flow & Reactivity" training plan.
*   **`setup_sdk.sh`**: Script to install Android Command Line Tools locally.
*   **`Makefile`**: Automation for dependencies, SDK setup, and building the APK.

## Building and Running
*   **Web:** Run `make serve` and open `http://localhost:8000/www/`.
*   **Android Build:** 
    1.  First time: `make install-deps` and `make setup-sdk`.
    2.  Build APK: `make build-android`.
    3.  The APK is generated at `www/apk/mtb-daily-flow.apk`.

## Distribution
The app is distributed via GitHub Pages. The `www/index.html` file contains a "Download App" button that links to the commit-tracked APK. This button is automatically hidden when running within the native Android app.

## Development Conventions
*   **Code Style:** Keep CSS and JS embedded within `index.html` unless the project grows significantly.
*   **Naming:** CamelCase for JS variables (`timeLeft`, `startBtn`), dashed-case for CSS classes/IDs (`#app-container`).
*   **Video Integration:** Videos are embedded via YouTube iframes with parameters optimized for autoplay and looping (muted).
*   **Capacitor:** Always run `make build-android` after modifying `www/` to sync changes and rebuild the APK.