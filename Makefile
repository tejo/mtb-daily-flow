.PHONY: serve help

# Default target
help:
	@echo "Available commands:"
	@echo "  make serve   - Start a local development server on port 8000"

# Serve the website using Python's built-in HTTP server
serve:
	@echo "Starting server at http://localhost:8000"
	python3 -m http.server 8000
