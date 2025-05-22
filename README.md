# 📦 Dabra – Gestor personalizado de instalaciones

`dabra` es un gestor de instalación y actualización ligera basado en Bash, diseñado para administrar herramientas que no están en los repositorios oficiales de Ubuntu o requieren control personalizado.

---

## 🧱 Estructura del proyecto

```
~/dabra/
├── install.sh               # Script principal ejecutado como 'dabra'
└── scripts/
    ├── plantuml/
    │   └── install.sh       # Script específico para PlantUML
    └── ...                  # Otros programas personalizados
```

---

## 🚀 Instalación y configuración inicial

1. **Clona o crea la carpeta base**:

   ```bash
   mkdir -p ~/dabra/scripts
   ```

2. **Copia el contenido del script principal** en `~/dabra/install.sh` (ya creado).

3. **Haz ejecutable el script**:

   ```bash
   chmod +x ~/dabra/install.sh
   ```

4. **Crea alias `dabra`**:
   Añade a tu `~/.bash_aliases` o créalo si no existe:

   ```bash
   echo "alias dabra='bash ~/dabra/install.sh'" >> ~/.bash_aliases
   source ~/.bash_aliases
   ```

   Si usas Zsh:

   ```bash
   echo "alias dabra='bash ~/dabra/install.sh'" >> ~/.zshrc
   source ~/.zshrc
   ```

---

## 🛠️ Uso

### Instalar un paquete:

```bash
  dabra plantuml
```

### Actualizar un paquete:

```bash
  dabra plantuml update
```

> Cualquier nuevo script debe estar en `~/dabra/scripts/<nombre_app>/install.sh` o `update.sh`

---

## 🧩 Consejos

* Estructura modular: cada app gestiona su propia lógica.
* Puedes integrar configuraciones, alias, entornos, etc.
* Ideal para desarrolladores, makers, y administradores que reconfiguran máquinas frecuentemente.

---

¿Listo para controlar tu propio sistema de software? ✨
