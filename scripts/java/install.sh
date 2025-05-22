#!/bin/bash

# ~/dabra/scripts/java/install.sh
# Instala OpenJDK manualmente desde Adoptium

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

# Obtener carpeta resultante
JDK_FOLDER=$(tar -tf "$JAVA_DIR/$JDK_ARCHIVE" | head -1 | cut -f1 -d"/")

# Crear alias de entorno JAVA_HOME si no existe
ALIAS_LINE="export JAVA_HOME=\"$INSTALL_PATH/$JDK_FOLDER\" && export PATH=\$JAVA_HOME/bin:\$PATH"
BASH_ALIASES="$HOME/.bash_aliases"
ZSH_RC="$HOME/.zshrc"

if [[ -n "$ZSH_VERSION" ]]; then
  if ! grep -Fxq "$ALIAS_LINE" "$ZSH_RC"; then
    echo "$ALIAS_LINE" >> "$ZSH_RC"
    echo "JAVA_HOME configurado en ~/.zshrc"
  fi
else
  if ! grep -Fxq "$ALIAS_LINE" "$BASH_ALIASES"; then
    echo "$ALIAS_LINE" >> "$BASH_ALIASES"
    echo "JAVA_HOME configurado en ~/.bash_aliases"
  fi
fi

echo "JDK instalado en $INSTALL_PATH/$JDK_FOLDER. Reinicia tu shell para aplicar JAVA_HOME."
