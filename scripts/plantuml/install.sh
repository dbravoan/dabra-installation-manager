#!/bin/bash

# ~/dabra/scripts/plantuml/install.sh
# Instala la última versión de PlantUML manualmente con alias

PLANTUML_DIR="$HOME/dabra/scripts/plantuml"
PLANTUML_JAR="$PLANTUML_DIR/plantuml.jar"

echo "Desinstalando PlantUML de apt si está presente..."
sudo apt remove --purge -y plantuml 2>/dev/null

mkdir -p "$PLANTUML_DIR"

echo "Descargando última versión de PlantUML..."
wget -q https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar -O "$PLANTUML_JAR"

# Crear alias en el entorno local
ALIAS_LINE="alias plantuml='java -jar $PLANTUML_JAR'"
BASH_ALIASES="$HOME/.bash_aliases"
ZSH_RC="$HOME/.zshrc"

if [[ -n "$ZSH_VERSION" ]]; then
  if ! grep -Fxq "$ALIAS_LINE" "$ZSH_RC"; then
    echo "$ALIAS_LINE" >> "$ZSH_RC"
    echo "Alias 'plantuml' añadido a ~/.zshrc"
  fi
else
  if ! grep -Fxq "$ALIAS_LINE" "$BASH_ALIASES"; then
    echo "$ALIAS_LINE" >> "$BASH_ALIASES"
    echo "Alias 'plantuml' añadido a ~/.bash_aliases"
  fi
fi

echo "Instalación de PlantUML completada. Recarga tu shell o ejecuta 'source ~/.bash_aliases'"
