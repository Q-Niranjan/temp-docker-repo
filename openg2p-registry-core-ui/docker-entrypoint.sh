#!/bin/sh
# temp-docker-repo/openg2p-registry-core-ui/docker-entrypoint.sh
set -e

echo "=== OpenG2P Registry Core UI Starting ==="

# Just copy pre-merged files (NO merge logic!)
if [ -d "/app/extension-locales" ] && [ "$(ls -A /app/extension-locales 2>/dev/null)" ]; then
    echo "Extension locales found. Copying merged files..."
    
    # Simply copy - files are already merged in CI/CD
    cp -f /app/extension-locales/*.json /app/locales/ 2>/dev/null || true
    
    echo "✓ Locales copied successfully"
    echo "Available locales:"
    ls -lh /app/locales/
else
    echo "No extension locales. Using core locales only."
fi

echo "=== Starting NextJS Server ==="
exec "$@"
