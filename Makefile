.PHONY: serve help install-deps build-android setup-sdk

# Configuration
# If ANDROID_HOME is not set in shell, default to local ./android-sdk
ANDROID_HOME ?= $(PWD)/android-sdk
export ANDROID_HOME

help:
	@echo "Available commands:"
	@echo "  make serve         - Start a local development server"
	@echo "  make install-deps  - Install Node.js dependencies"
	@echo "  make setup-sdk     - Download and configure Android SDK (CLI)"
	@echo "  make build-android - Build the APK"

serve:
	@echo "Starting server at http://localhost:8000"
	cd www && python3 -m http.server 8000

install-deps:
	npm install

setup-sdk:
	./setup_sdk.sh

build-android:
	@echo "Building Android APK..."
	npx cap sync android
	npx capacitor-assets generate --android
	cd android && ./gradlew assembleDebug
	@echo "APK built at android/app/build/outputs/apk/debug/app-debug.apk"
	mkdir -p www/apk
	cp android/app/build/outputs/apk/debug/app-debug.apk www/apk/mtb-daily-flow.apk
	@echo "APK copied to www/apk/mtb-daily-flow.apk"