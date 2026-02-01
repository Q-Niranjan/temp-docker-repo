#!/bin/sh
set -e

echo "=== OpenG2P Registry Core UI Starting ==="

# Copy pre-merged extension locales if mounted
if [ -d "/app/extension-locales" ] && [ "$(ls -A /app/extension-locales 2>/dev/null)" ]; then
    echo "Extension locales found. Copying merged files..."
    cp -f /app/extension-locales/*.json /app/locales/ 2>/dev/null || true
    echo "✓ Locales updated"
    echo "Available locales:"
    ls -lh /app/locales/
else
    echo "No extension locales. Using core locales only."
fi

echo "=== Starting NextJS Server ==="
exec "$@"
