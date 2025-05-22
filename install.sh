#!/bin/bash

# ~/dabra/install.sh
# Gestor principal de instalaciones personalizadas: "dabra"

# Asegurar alias en ~/.bash_aliases o ~/.zshrc automáticamente si no existe
ALIAS_LINE="alias dabra='bash $HOME/dabra/install.sh'"
BASH_ALIASES="$HOME/.bash_aliases"
ZSH_RC="$HOME/.zshrc"

mkdir -p "$HOME/dabra/scripts"

if [[ -n "$ZSH_VERSION" ]]; then
  # Usuario con Zsh
  if [[ ! -f "$ZSH_RC" ]]; then
    touch "$ZSH_RC"
  fi
  if ! grep -Fxq "$ALIAS_LINE" "$ZSH_RC"; then
    echo "$ALIAS_LINE" >> "$ZSH_RC"
    echo "Alias 'dabra' añadido a ~/.zshrc"
  fi
else
  # Usuario con Bash
  if [[ ! -f "$BASH_ALIASES" ]]; then
    touch "$BASH_ALIASES"
  fi
  if ! grep -Fxq "$ALIAS_LINE" "$BASH_ALIASES"; then
    echo "$ALIAS_LINE" >> "$BASH_ALIASES"
    echo "Alias 'dabra' añadido a ~/.bash_aliases"
  fi
fi

APP="$1"
ACTION="${2:-install}"

if [[ -z "$APP" ]]; then
  echo "Uso: dabra <nombre_app> [install|update]"
  exit 1
fi

SCRIPT_DIR="$HOME/dabra/scripts/$APP"
SCRIPT_PATH="$SCRIPT_DIR/$ACTION.sh"

if [[ ! -f "$SCRIPT_PATH" ]]; then
  echo "No existe el script $ACTION.sh para $APP"
  exit 1
fi

# Asegurar permisos de ejecución
chmod +x "$SCRIPT_PATH"

echo "Ejecutando $ACTION para $APP..."
bash "$SCRIPT_PATH"
