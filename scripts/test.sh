#!/usr/bin/env bash
set -euo pipefail

echo "=== TEST SCRIPT START ==="

# Run unit/integration tests
echo "Running tests..."
npm test -- --ci --watchAll=false

echo "Tests completed successfully!"

