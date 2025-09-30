# Guía de Personalización de Hyprland en ZaneyOS

Esta guía ofrece una visión práctica para personalizar tu experiencia con Hyprland en ZaneyOS. Veremos los archivos más relevantes, qué hacen y pequeños cambios seguros que puedes aplicar.

Nota: Estos archivos están escritos en Nix. Un pequeño error de sintaxis puede romper las compilaciones. Realiza un cambio a la vez y mantén tus ediciones bajo control de versiones.

## Aplicar tus cambios

Preferido (específico de ZaneyOS):
- `zcli rebuild`
  - Nota: el alias `fr` está obsoleto.

Método manual de respaldo (funciona en cualquier instalación):
- Desde la raíz del repo, reemplaza PROFILE por tu perfil (intel, nvidia, nvidia-laptop, amd-hybrid, vm):
  - `sudo nixos-rebuild switch --flake .#PROFILE`

---

### `binds.nix` — Atajos de teclado

Controla atajos de teclado y ratón.

Ubicación: `modules/home/hyprland/binds.nix`

Formato: `MODIFICADOR, TECLA, DISPATCHER, VALOR`

Ejemplo: Cambiar la terminal de Super+Return a Super+T

```nix
# ...
  bind = [
    # ...
    "$modifier,T,exec, ${terminal}"
    # ...
  ];
# ...
```

---

### `exec-once.nix` — Aplicaciones al iniciar

Comandos que se ejecutan automáticamente con Hyprland.

Ubicación: `modules/home/hyprland/exec-once.nix`

Ejemplo: Añadir copyq al inicio

```nix
# ...
  exec-once = [
    # ...
    "pypr &"
    "copyq"
  ];
# ...
```

---

### `decoration.nix` — Bordes, sombras, desenfoque

Ubicación: `modules/home/hyprland/decoration.nix`

Ejemplo: Esquinas redondeadas

```nix
# ...
  decoration = {
    rounding = 10;
  };
# ...
```

---

### `env.nix` — Variables de entorno

Ubicación: `modules/home/hyprland/env.nix`

Ejemplo: Habilitar Wayland para Firefox

```nix
# ...
  env = [
    "SDL_VIDEODRIVER, wayland"
    "MOZ_ENABLE_WAYLAND, 1"
  ];
# ...
```

---

### `gestures.nix` — Gestos del touchpad

Ubicación: `modules/home/hyprland/gestures.nix`

Ejemplo: Desactivar deslizamiento entre espacios

```nix
# ...
  gestures = {
    workspace_swipe = 0;
  };
# ...
```

---

### `misc.nix` — Ajustes varios

Ubicación: `modules/home/hyprland/misc.nix`

Ejemplo: Activar Frecuencia de Actualización Variable (VRR)

```nix
# ...
  misc = {
    vrr = 1;
  };
# ...
```

---

### `hyprland.nix` — Configuración principal

Ubicación: `modules/home/hyprland/hyprland.nix`

Ejemplo: Distribución del teclado

```nix
# ...
  input = {
    kb_layout = "us";
  };
# ...
```

---

### `windowrules.nix` — Reglas de ventanas

Ubicación: `modules/home/hyprland/windowrules.nix`

Ejemplo: Hacer que Thunar flote siempre

```nix
# ...
  windowrule = [
    "float, class:^(foot-floating)$"
    "float, class:^(Thunar)$"
  ];
# ...
```

---

## Consejos útiles

- Realiza un cambio a la vez y recompila para validar.
- Mantén una terminal abierta mientras experimentas por si cambias el atajo del lanzador.
- Si algo se rompe, reinicia y elige una generación anterior en el menú de arranque.

