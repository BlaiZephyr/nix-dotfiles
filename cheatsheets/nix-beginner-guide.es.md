# Guía para Principiantes de ZaneyOS: Personalización Básica

¡Bienvenido! Esta guía es para quienes son nuevos en Nix y quieren realizar personalizaciones comunes y seguras en su instalación de ZaneyOS. Mantendremos todo simple y al grano.

## Diseño del repositorio (dónde cambiar las cosas)

- `flake.nix`: Punto de entrada del sistema. Normalmente no necesitas editarlo para ajustes cotidianos.
- `hosts/`: Configuración por máquina.
  - `hosts/<tu-hostname>/`
    - `variables.nix`: Tu panel principal (activar/desactivar funciones, establecer opciones).
    - `host-packages.nix`: Paquetes extra solo para esta máquina.
- `modules/`: Bloques reutilizables para el sistema y Home Manager.
  - `modules/core/global-packages.nix`: Paquetes instalados en todas las máquinas.
  - `modules/home/hyprland/binds.nix`: Atajos de Hyprland.

## Instalar paquetes

Dos patrones comunes:

### 1) Solo en esta máquina
Edita `hosts/<tu-hostname>/host-packages.nix` y añade el nombre del paquete:

```nix
[
  brave
  (catppuccin-vsc.override {
    variant = "mocha";
  })
  cowsay
]
```

### 2) En todas las máquinas
Edita `modules/core/global-packages.nix` y añade el paquete a la lista.

## Ajustes de monitores (por host)

Edita `hosts/<tu-hostname>/variables.nix` y define la(s) línea(s) extra del monitor:

```nix
# Ejemplo: 1080p a 144 Hz en DP-1
extraMonitorSettings = "monitor=DP-1,1920x1080@144";
```

## Cambiar atajos de Hyprland

Edita `modules/home/hyprland/binds.nix`. Por ejemplo, cambiar la terminal de Super+Return a Super+T:

```nix
"SUPER, T, exec, ${terminal}"
```

## Aplicar y probar tus cambios

Preferido (específico de ZaneyOS):
- `zcli rebuild`
  - Nota: el alias `fr` está obsoleto.

Método manual de respaldo (funciona en cualquier instalación):
- Desde la raíz del repo, reemplaza PROFILE por tu perfil (intel, nvidia, nvidia-laptop, amd-hybrid, vm):
  - `sudo nixos-rebuild switch --flake .#PROFILE`

Consejos
- Si un rebuild falla, lee el error cerca del final: suele apuntar al archivo/línea exacta.
- Si un cambio rompe tu sesión tras reiniciar, elige una “generación” anterior en el menú de arranque.
- Usa Git para versionar tus cambios y poder revertir fácilmente.

