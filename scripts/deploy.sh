#!/usr/bin/env bash
set -euo pipefail

ENVIRONMENT=${1:-staging}

echo "=== DEPLOY SCRIPT START for $ENVIRONMENT ==="

# Variables come from GitHub Secrets (set them in Settings → Secrets → Actions)
DEPLOY_USER=${DEPLOY_USER:?DEPLOY_USER secret not set}
DEPLOY_HOST=${DEPLOY_HOST:?DEPLOY_HOST secret not set}
DEPLOY_PATH=${DEPLOY_PATH:?DEPLOY_PATH secret not set}

# Ensure build exists
if [ ! -d "build" ]; then
  echo "Build directory not found! Run build first."
  exit 1
fi

# Copy build files to server
echo "Deploying to $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH ..."
rsync -avz --delete build/ "$DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH"

echo "Deployment completed successfully!"

