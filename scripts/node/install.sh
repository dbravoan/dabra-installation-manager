#!/bin/bash

# ~/dabra/scripts/node/install.sh
# Instala Node.js usando 'n' y crea enlaces simbólicos

NODE_DIR="$HOME/dabra/scripts/node"
mkdir -p "$NODE_DIR"

# Instalar 'n' si no está presente
if ! command -v n >/dev/null 2>&1; then
  echo "Instalando 'n' (gestor de versiones Node)..."
  sudo npm install -g n
fi

# Instalar la última versión estable de Node.js
sudo n stable

# Crear enlaces simbólicos a node y npm
for bin in node npm; do
  TARGET_PATH="$(which $bin)"
  LINK_PATH="/usr/local/bin/$bin"
  if [[ -x "$TARGET_PATH" ]]; then
    sudo ln -sf "$TARGET_PATH" "$LINK_PATH"
    echo "Enlace simbólico creado: $bin -> $TARGET_PATH"
  fi
done

echo "Node.js y npm actualizados. Ejecuta 'node -v' y 'npm -v' para verificar."
