[English](ZaneyOS-Upgrade.md) | [Español](ZaneyOS-Upgrade.es.md)

# 🚀 Procedimiento de Actualización de ZaneyOS

## ⚠️ DEPRECADO - Usa el nuevo sistema de actualización automatizado

> **IMPORTANTE:**
>
> Este procedimiento manual ha sido **reemplazado** por un sistema automatizado mucho más seguro y completo.
>
> **Usa el nuevo sistema:**
> - Revisa: `UPGRADE-2.3-to-2.4.md` (documentación completa)
> - Ejecuta: `./upgrade-2.3-to-2.4.sh` (actualización automatizada)
> - Incluye respaldos automáticos, migración de variables y reversión sencilla

---

## 🆕 Nuevo Sistema Automatizado

Proporciona:
- **Respaldo completo** antes de cambios
- **Migración automática** de variables 2.3 → 2.4 (15+ variables)
- **Manejo de terminales** crítico para 2.4
- **Build seguro** con `boot` para evitar problemas visuales
- **Reversión con un comando** si algo falla
- **Logs** completos para diagnóstico

### Inicio Rápido
```bash
# Obtén el script sin modificar tu repo
git -C ~/zaneyos fetch origin && \
  git -C ~/zaneyos show origin/main:upgrade-2.3-to-2.4.sh > ~/upgrade-2.3-to-2.4.sh && \
  chmod +x ~/upgrade-2.3-to-2.4.sh

# Ejecuta el script (crea respaldo completo antes de cambiar ramas)
~/upgrade-2.3-to-2.4.sh
```

Alternativa (curl):
```bash
curl -fsSL https://gitlab.com/zaney/zaneyos/-/raw/main/upgrade-2.3-to-2.4.sh -o ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
~/upgrade-2.3-to-2.4.sh
```

### Instrucciones Detalladas
```bash
less UPGRADE-2.3-to-2.4.md
```

---

## ⚠️ ¿Por qué usar el sistema nuevo?

El proceso manual es **incompleto y riesgoso** porque:
- ❌ Maneja pocas variables (2.4 añade 15+)
- ❌ No hay respaldo automático
- ❌ No maneja dependencias de terminal
- ❌ No hay opción de revertir si falla
- ❌ Faltan variables críticas como `doomEmacsEnable`, monitores, tema
- ❌ Referencias desactualizadas (`fr`, `fu` en vez de `zcli`)

---

# 📜 Procedimiento Manual Original (DEPRECADO)

> **⚠️ ADVERTENCIA:** Proceso manual desactualizado e incompleto.
> **Usa el sistema automatizado indicado arriba.**

---

### 1. 📝 Preparación

1. **Asegura que tu ZaneyOS actual esté al día:**
   - Ve a tu carpeta ZaneyOS:
     ```bash
     cd ~/zaneyos
     ```
   - Si tienes cambios sin commit, súbelos primero.
   - Trae los últimos cambios:
     ```bash
     git stash && git fetch && git pull
     ```
   - Verifica que host y GPU en `flake.nix` coincidan con tu sistema.
     - Puedes editarlos manualmente.
     - Dependiendo de tu build actual, quizá puedas ejecutar `zcli update-host`.
   - Si hay cambios, reconstruye y reinicia (`zcli rebuild`).

2. **Respalda tu directorio actual:**
   ```bash
   mv ~/zaneyos ~/zaneyos-backup
   ```

3. **Clona la rama v2.4:**
   ```bash
   git clone https://gitlab.com/zaney/zaneyos.git -b Stable-2.4 --depth=1
   cd ~/zaneyos
   ```

---

### 2. 🔄 Convertir hosts 2.3 a 2.4

- **Nuevas opciones en `hosts/<hostname>/variables.nix`:**
  ```nix
  displayManager = "sddm";
  tmuxEnable = false;
  alacrittyEnable = false;
  weztermEnable = false;
  ghosttyEnable = false;
  vscodeEnable = false;
  helixEnable = false;
  ```

- **Pasos de migración:**
  1. Copia la plantilla `hosts/default` a tu hostname
  2. Copia `hardware.nix` desde el respaldo
  3. `git add .`
  4. Integra tus personalizaciones manualmente en el nuevo layout (no sobrescribas archivos 2.4)

---

### 3. ✅ Probar la Configuración

1. Verifica `flake.nix` (hostname y GPU). Si tienes `zcli update-host`, úsalo.
2. Ejecuta:
   ```bash
   nix flake check
   ```

---

### 4. ⬆️ Ejecutar la Actualización

> ⚠️ **CRÍTICO:**
> - No uses `fr`, `fu` ni `zcli` para este paso final.
> - Podría provocar un crash de Hyprland al reiniciar el display manager.

1. Ejecuta desde `~/zaneyos`:
   ```bash
   sudo nixos-rebuild boot --flake .#PROFILE
   ```
2. Reinicia.

---

### 🎉 ¡Bienvenido a ZaneyOS v2.4!
