#!/bin/sh
# Maven wrapper script for Unix/Linux/macOS

set -e

if [ -z "$JAVA_HOME" ]; then
    if command -v java >/dev/null 2>&1; then
        JAVA_EXEC=$(which java)
    else
        echo "Error: JAVA_HOME is not set and java could not be found in PATH." >&2
        exit 1
    fi
fi

TARGET_DIR="$HOME/.m2/wrapper/dists/apache-maven-3.9.6-bin"
MAVEN_HOME="$TARGET_DIR/apache-maven-3.9.6"

if [ ! -f "$MAVEN_HOME/bin/mvn" ]; then
    echo "Downloading Apache Maven 3.9.6..."
    mkdir -p "$TARGET_DIR"
    ZIP_FILE="$TARGET_DIR/apache-maven-3.9.6-bin.zip"
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip -o "$ZIP_FILE"
    elif command -v wget >/dev/null 2>&1; then
        wget -q https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip -O "$ZIP_FILE"
    else
        echo "Error: curl or wget is required to download Maven." >&2
        exit 1
    fi
    echo "Extracting Maven..."
    unzip -q "$ZIP_FILE" -d "$TARGET_DIR"
    chmod +x "$MAVEN_HOME/bin/mvn"
fi

exec "$MAVEN_HOME/bin/mvn" "$@"
