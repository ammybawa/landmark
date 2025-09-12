#!/usr/bin/env bash
set -euo pipefail

echo "=== BUILD SCRIPT START ==="

# Install dependencies
echo "Installing dependencies..."
npm ci

# Build the React app
echo "Building React app..."
npm run build

echo "Build completed successfully!"

