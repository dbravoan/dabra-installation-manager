#!/bin/bash

# ~/dabra/scripts/plantuml/install.sh
# Instala la última versión de PlantUML manualmente con enlace simbólico

PLANTUML_DIR="$HOME/dabra/scripts/plantuml"
PLANTUML_JAR="$PLANTUML_DIR/plantuml.jar"
LINK_PATH="/usr/local/bin/plantuml"

echo "Desinstalando PlantUML de apt si está presente..."
sudo apt remove --purge -y plantuml 2>/dev/null

mkdir -p "$PLANTUML_DIR"

echo "Descargando última versión de PlantUML..."
wget -q https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar -O "$PLANTUML_JAR"

# Crear wrapper y symlink
echo "Creando ejecutable en /usr/local/bin..."
echo -e "#!/bin/bash\njava -jar $PLANTUML_JAR \"\$@\"" | sudo tee "$LINK_PATH" > /dev/null
sudo chmod +x "$LINK_PATH"

echo "PlantUML instalado como 'plantuml'. Ejecuta 'plantuml -version' para verificar."
