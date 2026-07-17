#!/bin/bash
# Build script for Gaming Performance Module

MODULE_NAME="gaming-perf-rn10s"
VERSION="v3.0"
DATE=$(date +%Y%m%d)

echo "================================="
echo " Building $MODULE_NAME"
echo " Version: $VERSION"
echo " Date: $DATE"
echo "================================="

# Create temp directory
TEMP_DIR="build/$MODULE_NAME-$VERSION"
rm -rf build/
mkdir -p $TEMP_DIR

# Copy module files
echo "[*] Copying module files..."
cp -r module/* $TEMP_DIR/

# Set permissions
echo "[*] Setting permissions..."
find $TEMP_DIR -type f -exec chmod 644 {} \;
chmod 755 $TEMP_DIR/META-INF/com/google/android/update-binary
chmod 755 $TEMP_DIR/customize.sh
chmod 755 $TEMP_DIR/post-fs-data.sh
chmod 755 $TEMP_DIR/service.sh
chmod 755 $TEMP_DIR/common/gaming_tweaks.sh

# Create zip
echo "[*] Creating zip file..."
cd build
zip -r9 "../${MODULE_NAME}-${VERSION}-${DATE}.zip" "${MODULE_NAME}-${VERSION}"
cd ..

# Cleanup
echo "[*] Cleaning up..."
rm -rf build/

echo ""
echo "================================="
echo " Build Complete!"
echo " File: ${MODULE_NAME}-${VERSION}-${DATE}.zip"
echo " Size: $(du -h ${MODULE_NAME}-${VERSION}-${DATE}.zip | cut -f1)"
echo "================================="