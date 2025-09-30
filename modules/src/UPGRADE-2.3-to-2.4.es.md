[English](UPGRADE-2.3-to-2.4.md) | [Español](UPGRADE-2.3-to-2.4.es.md)

# Guía de Actualización ZaneyOS 2.3 → 2.4

Esta guía proporciona scripts de actualización seguros para migrar de ZaneyOS 2.3 a 2.4, manejando cambios incompatibles y preservando tu configuración personalizada.

## 🔄 Cambios Importantes en 2.4

- **SDDM** ahora es el display manager predeterminado (antes tui-greetd)
- **Selección de terminal**: terminales habilitables por bandera
- **Nuevas variables**: añadidas en `variables.nix`
- **Breaking changes**: actualizaciones directas fallan por variables faltantes

## 📋 Qué hace el Script de Actualización

1. **Análisis previo** con reporte detallado
2. **Respaldo completo** de tu sistema actual
3. **Verificación de versión** (debes estar en 2.3)
4. **Actualización segura**: cambia a main (2.4) y migra
5. **Migración de variables** al nuevo formato
6. **Manejo de terminales**: habilita tu preferida en 2.4
7. **Build seguro** con `boot` para evitar problemas con SDDM
8. **Opción de revert** fácil si algo sale mal

## 🛡️ Características de Seguridad

- **Respaldo completo** de ~/zaneyos antes de cambios
- **Boot vs Switch**: usa build de arranque seguro
- **Revert** sencillo para restaurar 2.3
- **Validaciones** previas al proceso
- **Logging** exhaustivo para troubleshooting

## 🚀 Cómo Actualizar

### Paso 0: Obtén el script de forma segura (NO hagas git pull)

Para evitar sobrescribir tu configuración local antes de crear un respaldo, descarga solo el script sin modificar tu working tree.

Opción A — Usando tu remoto git (recomendado):
```bash
# Trae refs sin tocar tu working tree
git -C ~/zaneyos fetch origin

# Escribe el script desde origin/main a tu home
git -C ~/zaneyos show origin/main:upgrade-2.3-to-2.4.sh > ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```

Opción B — Usando curl:
```bash
curl -fsSL https://gitlab.com/zaney/zaneyos/-/raw/main/upgrade-2.3-to-2.4.sh -o ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```

Ambos métodos mantienen tu repo local intacto. El script creará un respaldo completo antes de cambiar ramas.

### Paso 1: Ejecuta el Script

```bash
# Puedes ejecutarlo desde cualquier ruta; opera sobre ~/zaneyos
~/upgrade-2.3-to-2.4.sh
```

### Paso 2: Revisa el Análisis Previo

El script realizará un análisis completo de tu configuración actual:
- **Analiza flake.nix** (inputs y perfil actual)
- **Escanea hosts** y detecta personalizaciones
- **Revisa paquetes globales** en modules/core/packages.nix
- **Detecta personalizaciones de shell** (zsh, bash, eza)
- **Identifica módulos personalizados** y archivos personales
- **Genera un informe detallado** en `~/zaneyos-upgrade-analysis-TIMESTAMP.txt`

**Verás claramente:**
- ✅ **Qué se migrará automáticamente** (variables, paquetes, configs)
- ⚠️ **Qué requiere atención manual** (inputs personalizados, archivos personales)
- 📋 **Resumen** de hosts y personalizaciones detectadas

### Paso 3: Sigue los Prompts

Luego de revisar el análisis, el script:
- Creará un respaldo (verás la ruta)
- Pedirá confirmación antes de continuar
- Descargarà 2.4 desde main
- Migrará automáticamente tu configuración
- Compilará el nuevo sistema
- Pedirá reinicio

### Paso 4: Reinicia el Sistema

Tras un build exitoso:
```bash
sudo reboot
```

Tu sistema iniciará con:
- SDDM como gestor de acceso
- Todos tus ajustes preservados
- Funcionalidades de 2.4 disponibles

## 🔧 Detalles de Migración

### Ajustes preservados automáticamente:
- Usuario y email de Git
- Preferencia de navegador
- Elección de terminal (con habilitación automática)
- Layout de teclado y console keymap
- NFS, impresión y Thunar
- Formato de reloj (12h/24h)
- Ajustes de monitores
- Fondo (stylixImage)
- Tema de Waybar
- Animaciones
- Hardware
- **Paquetes globales** (modules/core/packages.nix)
- **Paquetes por host** (hosts/[hostname]/host-packages.nix)
- **Imports personalizados** (hosts/[hostname]/default.nix si aplica)

### Manejo de Terminales:
Si usabas una terminal específica en 2.3:
- **Kitty**: ya habilitada por defecto en 2.4
- **Alacritty**: se habilita `alacrittyEnable = true`
- **WezTerm**: se habilita `weztermEnable = true`
- **Ghostty**: se habilita `ghosttyEnable = true`

## ⚠️ Notas Importantes

### Display Manager SDDM
- 2.4 usa SDDM por defecto
- La actualización usa `boot` para evitar problemas visuales
- **Debes reiniciar** tras la actualización; no uses `switch`

### Ubicación del Respaldo
```
~/.config/zaneyos-backups/zaneyos-2.3-upgrade-backup-TIMESTAMP/
```

## 🔄 Cómo Revertir

Si algo falla, puedes revertir fácilmente:

### Opción 1: Script de revert
```bash
cd ~/zaneyos
./revert-to-2.3.sh
```

### Opción 2: Script principal
```bash
cd ~/zaneyos
./upgrade-2.3-to-2.4.sh --revert
```

### Opción 3: Reversión manual
1. Elimina `~/zaneyos`: `rm -rf ~/zaneyos`
2. Restaura desde el respaldo: `cp -r ~/.config/zaneyos-backups/[backup-name]/zaneyos ~/`
3. Rebuild: `nh os boot ~/zaneyos --hostname [profile]`
4. Reinicia

## 🔍 Troubleshooting

### Fallos de build
- Revisa el log (ruta mostrada por el script)
- Asegura espacio en disco suficiente
- Prueba revert y reporta

### Problemas de visualización tras reinicio
- Si ves pantalla en negro, espera unos segundos a que SDDM arranque
- Cambia a TTY (Ctrl+Alt+F2) si lo necesitas
- Inicia sesión y ejecuta `systemctl status display-manager`

### Aplicaciones faltantes
- Verifica tu terminal preferida en `~/zaneyos/hosts/[hostname]/variables.nix`
- Confirma que navegador y otras apps sigan disponibles

### Log de ejecución
Cada corrida genera un log en: `~/zaneyos-upgrade-TIMESTAMP.log`

## 📁 Estructura tras la actualización

```
~/zaneyos/hosts/[tu-hostname]/
├── hardware.nix          (preservado de 2.3)
└── variables.nix         (actualizado a 2.4 con tus ajustes)
```

## 🆘 Recuperación de Emergencia

Si algo sale mal:
1. Tu respaldo 2.3 está intacto
2. Arranca con un USB live de NixOS
3. Monta el sistema y restaura el respaldo
4. Tus datos y configuración están seguros

## ✅ Lista de Verificación Post‑Actualización

Tras actualizar y reiniciar:
- [ ] Aparece la pantalla de login de SDDM
- [ ] El escritorio carga correctamente
- [ ] Se abre tu terminal preferida
- [ ] El navegador funciona
- [ ] Se preservó fondo/tema
- [ ] Configuración de monitores correcta
- [ ] Aplicaciones necesarias disponibles

## 🤝 Ayuda

Si encuentras problemas:
1. Revisa el log de ejecución
2. Prueba la reversión a 2.3
3. Reporta con contenido del log
4. Tu respaldo permite recuperación manual

---

## Archivos de Script
- `upgrade-2.3-to-2.4.sh` — Script principal
- `revert-to-2.3.sh` — Wrapper de reversión
- `UPGRADE-2.3-to-2.4.md` — Esta documentación

Recuerda: se crea un respaldo completo antes de cualquier cambio, por lo que siempre puedes recuperarte.
