#!/bin/bash

# ~/dabra/scripts/java/install.sh
# Instala OpenJDK manualmente desde Adoptium con enlace simbólico

JAVA_DIR="$HOME/dabra/scripts/java"
mkdir -p "$JAVA_DIR"

JDK_VERSION="21"
JDK_DISTRO="temurin"
JDK_ARCHIVE="OpenJDK${JDK_VERSION}U-jdk_x64_linux_hotspot_latest.tar.gz"
DOWNLOAD_URL="https://api.adoptium.net/v3/binary/latest/${JDK_VERSION}/ga/linux/x64/jdk/hotspot/normal/${JDK_DISTRO}/latest?project=jdk"

INSTALL_PATH="$HOME/.jdk"
mkdir -p "$INSTALL_PATH"

echo "Descargando OpenJDK $JDK_VERSION desde Adoptium..."
wget -qO "$JAVA_DIR/$JDK_ARCHIVE" "$DOWNLOAD_URL"

echo "Extrayendo JDK en $INSTALL_PATH..."
tar -xzf "$JAVA_DIR/$JDK_ARCHIVE" -C "$INSTALL_PATH"

JDK_FOLDER=$(tar -tf "$JAVA_DIR/$JDK_ARCHIVE" | head -1 | cut -f1 -d"/")
BIN_PATH="$INSTALL_PATH/$JDK_FOLDER/bin"

# Crear enlaces simbólicos a java y javac
for bin in java javac; do
  if [[ -x "$BIN_PATH/$bin" ]]; then
    sudo ln -sf "$BIN_PATH/$bin" "/usr/local/bin/$bin"
    echo "Enlace simbólico creado: $bin -> $BIN_PATH/$bin"
  fi
done

echo "Java instalado y enlazado. Ejecuta 'java -version' para verificar."
