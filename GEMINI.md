# MTB Daily Flow Project

## Project Overview
This project is a standalone web application designed to guide users through a 10-minute daily Mountain Bike (MTB) training routine. The application provides a timer, exercise instructions, and embedded video demonstrations for a series of mobility, balance, and reactivity exercises.

## Architecture & Technologies
*   **Type:** Single-Page Application (SPA) / Static Site.
*   **Technologies:** HTML5, CSS3, Vanilla JavaScript.
*   **Structure:** Monolithic - all styles, markup, and logic are contained within a single `index.html` file for portability and simplicity.

## Key Files
*   **`index.html`**: The main entry point. Contains:
    *   **UI/Layout:** Responsive card-based design with dark mode aesthetics.
    *   **Logic:** JavaScript for the workout timer (`tick` function), state management (`currentIdx`, `timeLeft`), and YouTube iframe embedding.
    *   **Data:** The `exercises` array containing names, durations, and YouTube video IDs.
*   **`mtb_exercise.md`**: Documentation outlining the "MTB Flow & Reactivity" training plan, including core principles and detailed descriptions of each movement.

## Building and Running
No build process is required.
*   **Run:** simply open `index.html` in any modern web browser.
*   **Development:** Edit `index.html` directly.

## Development Conventions
*   **Code Style:** Keep CSS and JS embedded within `index.html` unless the project grows significantly.
*   **Naming:** CamelCase for JS variables (`timeLeft`, `startBtn`), dashed-case for CSS classes/IDs (`#app-container`).
*   **Video Integration:** Videos are embedded via YouTube iframes with parameters optimized for autoplay and looping (muted).
