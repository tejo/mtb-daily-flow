#!/bin/bash
set -e

SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip"
ANDROID_HOME="$(pwd)/android-sdk"
CMDLINE_TOOLS_ROOT="$ANDROID_HOME/cmdline-tools"

echo "Setting up Android SDK at $ANDROID_HOME..."

# Create directories
mkdir -p "$CMDLINE_TOOLS_ROOT"

# Download
if [ ! -d "$CMDLINE_TOOLS_ROOT/latest" ]; then
    echo "Downloading Android Command Line Tools..."
    curl -L -o commandlinetools.zip "$SDK_URL"

    echo "Unzipping..."
    unzip -q commandlinetools.zip -d "$CMDLINE_TOOLS_ROOT"
    
    # Structure fix: cmdline-tools/cmdline-tools -> cmdline-tools/latest
    mv "$CMDLINE_TOOLS_ROOT/cmdline-tools" "$CMDLINE_TOOLS_ROOT/latest"
    
    rm commandlinetools.zip
else
    echo "Command line tools already installed."
fi

export PATH="$CMDLINE_TOOLS_ROOT/latest/bin:$PATH"
export ANDROID_HOME="$ANDROID_HOME"

# Accept licenses
echo "Accepting licenses..."
yes | sdkmanager --licenses --sdk_root="$ANDROID_HOME" > /dev/null

# Install packages
echo "Installing platform-tools, platforms;android-36, and build-tools..."
sdkmanager "platform-tools" "platforms;android-36" "build-tools;36.0.0" --sdk_root="$ANDROID_HOME"

echo "Android SDK setup complete."
