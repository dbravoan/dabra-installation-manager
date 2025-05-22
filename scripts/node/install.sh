#!/bin/bash

# ~/dabra/scripts/node/install.sh
# Instala Node.js usando 'n' y asegura el entorno

NODE_DIR="$HOME/dabra/scripts/node"
mkdir -p "$NODE_DIR"

# Instala 'n' si no está presente
if ! command -v n >/dev/null 2>&1; then
  echo "Instalando 'n' (gestor de versiones Node)..."
  sudo npm install -g n
fi

# Instala la última versión estable de Node.js
sudo n stable

# Asegura alias si no existe
ALIAS_LINE="alias node-update='sudo n latest'"
BASH_ALIASES="$HOME/.bash_aliases"
ZSH_RC="$HOME/.zshrc"

if [[ -n "$ZSH_VERSION" ]]; then
  if ! grep -Fxq "$ALIAS_LINE" "$ZSH_RC"; then
    echo "$ALIAS_LINE" >> "$ZSH_RC"
    echo "Alias 'node-update' añadido a ~/.zshrc"
  fi
else
  if ! grep -Fxq "$ALIAS_LINE" "$BASH_ALIASES"; then
    echo "$ALIAS_LINE" >> "$BASH_ALIASES"
    echo "Alias 'node-update' añadido a ~/.bash_aliases"
  fi
fi

echo "Node.js actualizado con 'n'. Usa 'node-update' para futuras actualizaciones."
