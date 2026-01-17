# Capacitor Conversion Plan

## Goal
Convert the existing static web app into a Capacitor Android application. The app should be buildable using only Android CLI tools (no full Android Studio) and distributable/updatable via GitHub Pages.

## Steps

1.  **Project Restructuring**
    *   Create a `www/` directory.
    *   Move web assets (`index.html`, `sw.js`, `manifest.json`, icons) into `www/`.
    *   *Reason*: Capacitor requires a specific web asset directory to sync.

2.  **Capacitor Setup**
    *   Initialize Node.js project (`package.json`).
    *   Install Capacitor Core, CLI, and Android platform.
    *   Initialize Capacitor config.

3.  **Android SDK Setup (CLI-only)**
    *   Create a script (`setup_sdk.sh`) to download and configure Android Command Line Tools locally if not present.
    *   This ensures the user doesn't need the heavy Android Studio installation.

4.  **Asset Generation**
    *   Install `@capacitor/assets`.
    *   Configure assets (icons/splash) to be generated from existing SVGs.

5.  **Build Automation**
    *   Update `Makefile` to include:
        *   `install-deps`: Install npm and sdk dependencies.
        *   `build-android`: Sync capacitor and assemble the APK using Gradle.
        *   `copy-apk`: Move the built APK to the `www/` folder so it can be committed and served via GitHub Pages.

6.  **Distribution**
    *   Add a "Download App" button to `www/index.html`.
    *   Ensure the APK is accessible via the web interface.
