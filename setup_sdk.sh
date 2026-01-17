#!/bin/bash
set -e

# Configuration
SDK_DIR="$(pwd)/android-sdk"
CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
ANDROID_PLATFORM="android-34"
BUILD_TOOLS="build-tools;34.0.0"

# Check for Java
if ! command -v java &> /dev/null; then
    echo "Error: Java is not installed. Please install Java (JDK 17+) and try again."
    exit 1
fi

echo "Setting up Android SDK in $SDK_DIR..."

mkdir -p "$SDK_DIR/cmdline-tools"

# Download Command Line Tools
if [ ! -f "$SDK_DIR/cmdline-tools/tools.zip" ]; then
    echo "Downloading Command Line Tools..."
    curl -o "$SDK_DIR/cmdline-tools/tools.zip" "$CMDLINE_TOOLS_URL"
fi

# Extract
if [ ! -d "$SDK_DIR/cmdline-tools/latest" ]; then
    echo "Extracting tools..."
    unzip -q "$SDK_DIR/cmdline-tools/tools.zip" -d "$SDK_DIR/cmdline-tools"
    # Rename 'cmdline-tools' inside the zip (usually named 'cmdline-tools') to 'latest'
    # The zip usually contains a folder named 'cmdline-tools'. We need to move its contents to 'latest'.
    # Note: Extracting creates cmdline-tools/cmdline-tools.
    mv "$SDK_DIR/cmdline-tools/cmdline-tools" "$SDK_DIR/cmdline-tools/latest"
fi

# Environment Variables
export ANDROID_HOME="$SDK_DIR"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# Install SDK Packages
echo "Accepting licenses and installing SDK packages..."
yes | sdkmanager --licenses > /dev/null 2>&1 || true
sdkmanager "platform-tools" "platforms;$ANDROID_PLATFORM" "$BUILD_TOOLS"

echo "Android SDK setup complete."
echo "To build, run: export ANDROID_HOME=$SDK_DIR && make build-android"
