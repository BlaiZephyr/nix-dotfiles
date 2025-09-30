[English](FAQ.md) | [Español](FAQ.es.md)

# 💬 Preguntas frecuentes de ZaneyOS para v2.4

- **Revisión v1.26**
- **Fecha:** 1 de septiembre de 2025

> IMPORTANTE: ¿Actualizando de v2.3 a v2.4?
> - Altamente recomendado: Lee `ZaneyOS-Upgrade.md` completamente antes de intentar la actualización.
> - Explica la actualización automatizada, respaldo completo, migración de host y proceso de reversión.
> - NO uses los alias `fu` o `fr` para esta actualización.
> - Si has hecho modificaciones extensas, no ejecutes el script—revisa los documentos y migra manualmente.

**⌨ ¿Dónde puedo ver los atajos de teclado de Hyprland?**

- La tecla SUPER + K abre un menú searchable con los atajos
- El icono "keys" en el lado derecho de la waybar también abrirá este menú.

<details>
<summary>**✨🖥️  ZCLI:  ¿Qué es y cómo lo uso?**</summary>
<div style="margin-left: 20px;">

La utilidad `zcli` es una herramienta de línea de comandos diseñada para simplificar la gestión de tu entorno `zaneyos`. Proporciona un conjunto completo de comandos para realizar tareas comunes como actualizar tu sistema, gestionar hosts, limpiar generaciones antiguas y gestionar Doom Emacs.

Para usarlo, abre una terminal y escribe `zcli` seguido de uno de los comandos listados a continuación:

## Comandos del Sistema Core:
- `cleanup`: Limpia generaciones antiguas del sistema. Puedes especificar el número de generaciones a mantener. Incluye limpieza automatizada de logs de compilaciones antiguas.
- `diag`: Crea un reporte de diagnóstico completo del sistema usando `inxi --full`, guardado en `~/diag.txt`. Perfecto para solucionar problemas.
- `list-gens`: Lista tanto generaciones de usuario como de sistema con información detallada.
- `rebuild`: Recompila la configuración del sistema NixOS con verificaciones de seguridad mejoradas y manejo de archivos de respaldo.
- `rebuild-boot`: Recompila y establece como boot por defecto (se activa en el próximo reinicio). Más seguro para cambios importantes del sistema y actualizaciones del kernel.
- `trim`: Recorta sistemas de archivos para mejorar el rendimiento del SSD con prompts de confirmación del usuario.
- `update`: Actualiza el flake y recompila el sistema con manejo de errores completo.
- `update-host`: Establece automáticamente el host y perfil en `flake.nix`. Características detección inteligente de GPU y validación de hostname.
- `add-host`: Crea configuraciones de host nuevas con detección automática de GPU, generación de hardware.nix y integración con git.
- `del-host`: Elimina configuraciones de host de forma segura con prompts de confirmación para prevenir eliminación accidental.

**Uso:** `zcli add-host [hostname] [profile]`  
**Perfiles de GPU:** `amd`, `intel`, `nvidia`, `nvidia-hybrid`, y `vm`

## Opciones Avanzadas de Compilación:
Los comandos `rebuild`, `rebuild-boot` y `update` soportan opciones mejoradas para control granular:
- `--dry, -n`: Modo preview - muestra qué se haría sin ejecutar (dry run)
- `--ask, -a`: Prompts de confirmación interactiva para operaciones críticas de seguridad
- `--cores N`: Limita operaciones de compilación a N núcleos de CPU (esencial para VMs y sistemas con recursos limitados)
- `--verbose, -v`: Habilita logs detallados de operación y salida verbose para troubleshooting
- `--no-nom`: Deshabilita nix-output-monitor para salida tradicional de línea de comandos

**Múltiples opciones pueden combinarse** para control preciso sobre tu proceso de compilación.

## Gestión de Doom Emacs:
Gestión completa del ciclo de vida de Doom Emacs con características de seguridad:
- `doom install`: Instalación automatizada de Doom Emacs usando el script get-doom con todos los paquetes requeridos
- `doom status`: Verifica el estado de instalación y muestra información de versión para verificación
- `doom remove`: Remueve la instalación de Doom Emacs de forma segura con prompts de confirmación para prevenir eliminación accidental
- `doom update`: Actualiza paquetes de Doom Emacs y configuración vía `doom sync`

**Características:** Verificaciones de seguridad integradas, manejo de errores completo y gestión automática de dependencias.

```text
❯ zcli
Error: No command provided.
ZaneyOS CLI Utility -- version 1.0.2

Usage: zcli [command] [options]

Commands:
  cleanup         - Clean up old system generations. Can specify a number to keep.
  diag            - Create a system diagnostic report.
                    (Filename: homedir/diag.txt)
  list-gens       - List user and system generations.
  rebuild         - Rebuild the NixOS system configuration.
  rebuild-boot    - Rebuild and set as boot default (activates on next restart).
  trim            - Trim filesystems to improve SSD performance.
  update          - Update the flake and rebuild the system.
  update-host     - Auto set host and profile in flake.nix.
                    (Opt: zcli update-host [hostname] [profile])

Options for rebuild, rebuild-boot, and update commands:
  --dry, -n       - Show what would be done without doing it
  --ask, -a       - Ask for confirmation before proceeding
  --cores N       - Limit build to N cores (useful for VMs)
  --verbose, -v   - Show verbose output
  --no-nom        - Don't use nix-output-monitor

Doom Emacs:
  doom install    - Install Doom Emacs using get-doom script.
  doom status     - Check if Doom Emacs is installed.
  doom remove     - Remove Doom Emacs installation.
  doom update     - Update Doom Emacs (runs doom sync).

  help            - Show this help message.
```

**Ejemplos:**
```bash
# Gestión del sistema
zcli rebuild --dry                # Muestra qué se recompilaría
zcli update --cores 4             # Actualiza con máximo 4 núcleos de CPU
zcli rebuild-boot --ask           # Recompila para boot con confirmación

# Gestión de host
zcli add-host mihost amd          # Agrega nuevo host con GPU AMD
zcli update-host                  # Detecta y actualiza info de host automáticamente

# Doom Emacs
zcli doom install                 # Instala Doom Emacs
zcli doom status                  # Verifica estado de instalación
```

</div>
</details>

## Atajos Principales de Hyprland

A continuación se muestran los atajos de teclado para Hyprland, formateados para fácil referencia.

## Lanzamiento de Aplicaciones

- `$modifier + Return` → Lanzar `Terminal`
- `$modifier + K` → Lista atajos
- `$modifier + Shift + Return` → Lanzar `rofi-launcher`
- `$modifier + Shift + W` → Abrir `web-search`
- `$modifier + Alt + W` → Abrir `wallsetter`
- `$modifier + Shift + N` → Ejecutar `swaync-client -rs`
- `$modifier + W` → Lanzar `Web Browser`
- `$modifier + Y` → Abrir `kitty` con `yazi`
- `$modifier + E` → Abrir `emopicker9000`
- `$modifier + S` → Tomar captura de pantalla
- `$modifier + D` → Abrir `Discord`
- `$modifier + O` → Lanzar `OBS Studio`
- `$modifier + C` → Ejecutar `hyprpicker -a`
- `$modifier + G` → Abrir `GIMP`
- `$modifier + V` → Mostrar historial de portapapeles vía `cliphist`
- `$modifier + T` → Alternar terminal con `pypr`
- `$modifier + M` → Abrir `pavucontrol`

## Gestión de Ventanas

- `$modifier + Q` → Matar ventana activa
- `$modifier + P` → Alternar tiling pseudo
- `$modifier + Shift + I` → Alternar modo split
- `$modifier + F` → Alternar fullscreen
- `$modifier + Shift + F` → Alternar modo flotante
- `$modifier + Alt + F` → Flotar todas las ventanas
- `$modifier + Shift + C` → Salir de Hyprland

## Movimiento de Ventanas

- `$modifier + Shift + ← / → / ↑ / ↓` → Mover ventana izquierda/derecha/arriba/abajo
- `$modifier + Shift + H / L / K / J` → Mover ventana izquierda/derecha/arriba/abajo
- `$modifier + Alt + ← / → / ↑ / ↓` → Intercambiar ventana izquierda/derecha/arriba/abajo
- `$modifier + Alt + 43 / 46 / 45 / 44` → Intercambiar ventana izquierda/derecha/arriba/abajo

## Movimiento de Foco

- `$modifier + ← / → / ↑ / ↓` → Mover foco izquierda/derecha/arriba/abajo
- `$modifier + H / L / K / J` → Mover foco izquierda/derecha/arriba/abajo

## Espacios de Trabajo

- `$modifier + 1-10` → Cambiar a espacio de trabajo 1-10
- `$modifier + Shift + Space` → Mover ventana a espacio de trabajo especial
- `$modifier + Space` → Alternar espacio de trabajo especial
- `$modifier + Shift + 1-10` → Mover ventana a espacio de trabajo 1-10
- `$modifier + Control + → / ←` → Cambiar espacio de trabajo adelante/atrás

## Ciclo de Ventanas

- `Alt + Tab` → Ciclar a siguiente ventana
- `Alt + Tab` → Traer ventana activa al frente

## Preguntas, configuraciones, actualización, misc...

<details>

<summary>**❄ ¿Por qué creaste ZaneyOS? **</summary>

<div style="margin-left: 20px;">

- Al principio, era simplemente mi configuración guardada en un repositorio GIT.
- Fue para promover NixOS y Hyprland.
- Proporcionando una configuración estable y funcional.
- Nunca fue intencionado como una distro completa de NixOS.
- El nombre `ZaneyOS` es un chiste interno entre amigos.
- La intención es que esta configuración pueda usarse como daily driver
- Desarrollar software, jugar juegos vía steam, etc.
- Mi esperanza es que sea útil, y lo modifiques para que se ajuste a tus necesidades.
- Ese es el punto clave. Hazlo tuyo.
- Crea un fork de ZaneyOS, luego modifícalo.
- Si encuentras un issue y lo arreglas, o proporcionas una nueva característica, por favor compártelo.
- ZaneyOS no es una distro. En este momento no hay planes para crear un ISO de instalación.

</div>
</details>

<details>
<summary>**🖼️ Configuraciones y configuración**</summary>

<div style="margin-left: 20px;">

<details>
<summary>**¿Cómo agrego flatpaks?**</summary>

- Edita `~/zaneyos/modules/core/flatpak.nix`
- Hay una lista de apps de ejemplo que puedes usar como plantilla

```nix
  services = {
    flatpak = {
      enable = true;

      # Lista las aplicaciones Flatpak que quieres instalar
      # Usa el ID oficial de aplicación Flatpak (ej. desde flathub.org)
      # Ejemplos:
      packages = [
        #"com.github.tchx84.Flatseal" #Gestiona permisos flatpak - siempre deberías tener esto
        #"com.rtosta.zapzap"              # Cliente de WhatsApp
        #"io.github.flattool.Warehouse"   # Gestiona flatpaks, limpia datos, remueve flatpaks y deps
        #"it.mijorus.gearlever"           # Gestiona y soporta AppImages
        #"io.github.freedoom.Phase1"      # Classic Doom FPS 1
        #"io.github.freedoom.Phase2"      # Classic Doom FPS 2
        #"io.github.dvlv.boxbuddyrs"      # Gestiona distroboxes

        # Agrega otros IDs de Flatpak aquí, ej. "org.mozilla.firefox"
      ];

      # Opcional: Actualiza Flatpaks automáticamente cuando ejecutes nixos-rebuild switch
      update.onActivation = true;
    };
  };
```

- Asegúrate de usar el nombre correcto del paquete
- Ve a `flathub.org` para verificar o usa `flatpak search PACKAGENAME`
- Guarda el archivo y haz un rebuild con el alias `fr`
- Después puedes ejecutar `flatpak list` para verificar la instalación
- Cuando ejecutas `fu` o `fr` los flatpaks también se actualizarán

</details>

<details>
<summary>**¿Cómo remuevo flatpaks?**</summary>

- Edita `~/zaneyos/modules/core/flatpak.nix`

```nix
  services = {
    flatpak = {
      enable = true;

      # Lista las aplicaciones Flatpak que quieres instalar
      # Usa el ID oficial de aplicación Flatpak (ej. desde flathub.org)
      # Ejemplos:
      packages = [
        #"com.github.tchx84.Flatseal" #Gestiona permisos flatpak - siempre deberías tener esto
        #"com.rtosta.zapzap"              # Cliente de WhatsApp
        #"io.github.flattool.Warehouse"   # Gestiona flatpaks, limpia datos, remueve flatpaks y deps
        #"it.mijorus.gearlever"           # Gestiona y soporta AppImages
        #"io.github.freedoom.Phase1"      # Classic Doom FPS 1
        #"io.github.freedoom.Phase2"      # Classic Doom FPS 2
        #"io.github.dvlv.boxbuddyrs"      # Gestiona distroboxes

        # Agrega otros IDs de Flatpak aquí, ej. "org.mozilla.firefox"
      ];

      # Opcional: Actualiza Flatpaks automáticamente cuando ejecutes nixos-rebuild switch
      update.onActivation = true;
    };
  };
```

- Remueve la línea con el paquete que quieres remover o coméntala
- Guarda el archivo y haz un rebuild con el alias `fr`
- Después puedes ejecutar `flatpak list` para verificar que los paquetes(s) estén removidos
- Nota: Las dependencias base para flatpaks permanecen una vez instaladas.

</details>

<details>
<summary>**¿Cómo cambio la waybar?**</summary>

- Ve al directorio `~/zaneyos/host/HOSTNAME`
- Edita el archivo `variables.nix`
- Encuentra la línea que comienza con `waybarChoice`
- Cambia el nombre a uno de los archivos disponibles
- `waybar-simple.nix`, `waybar-curved.nix`, o `waybar-ddubs.nix`
- Guarda el archivo y sal
- Necesitas hacer un rebuild para que el cambio sea efectivo
- Ejecuta `fr` "flake rebuild" para iniciar el proceso de rebuild

```json
# Establecer Waybar
# Incluye alternativas como waybar-simple.nix, waybar-curved.nix & waybar-ddubs.nix
waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
```

</details>

<details>
<summary>** ¿Cómo cambio la zona horaria? **</summary>

1. En el archivo, `~/zaneyos/modules/core/system.nix`
2. Edita la línea: time.timeZone = "America/New_York";
3. Guarda el archivo y rebuild usando el alias `fr`.

</details>

<details>
<summary>**¿Cómo cambio la configuración del monitor? **</summary>

La configuración del monitor está en el archivo: `~/zaneyos/hosts/<HOSTNAME>/variables.nix`

Dentro de las comillas la sintaxis es "monitor=adaptador de video,resolución@refresh rate, auto,escala" El monitor debe estar en minúsculas. Si no estás seguro de tus dispositivos de video ejecuta `hyprctl monitors` en una CLI de terminal. La salida se verá similar a esto:

```text
hyprctl monitors
Monitor HDMI-A-1 (ID 0):
	2560x1440@143.91200 at 0x0
	description: Dell Inc. DELL S3222DGM F45WJK3
	make: Dell Inc.
	model: DELL S3222DGM
	serial: F45WJK3
	active workspace: 1 (1)
	special workspace: 0 ()
	reserved: 0 52 0 0
	scale: 1.00
	transform: 0
	focused: yes
	dpmsStatus: 1
	vrr: false
	solitary: 0
	activelyTearing: false
	directScanoutTo: 0
	disabled: false
	currentFormat: XRGB8888
	mirrorOf: none
	availableModes: 2560x1440@59.95Hz 2560x1440@143.91Hz 2560x1440@120.00Hz 1920x1200@59.95Hz 1920x1080@143.86Hz 1920x1080@120.00Hz 1920x1080@119.88Hz 1920x1080@60.00Hz 1920x1080@60.00Hz 1920x1080@59.94Hz 1920x1080@50.00Hz 1600x1200@60.00Hz 1680x1050@59.88Hz 1280x1024@75.03Hz 1280x1024@60.02Hz 1440x900@59.95Hz 1280x800@59.91Hz 1152x864@75.00Hz 1280x720@120.00Hz 1280x720@119.88Hz 1280x720@60.00Hz 1280x720@59.94Hz 1280x720@50.00Hz 1024x768@75.03Hz 1024x768@60.00Hz 800x600@75.00Hz 800x600@60.32Hz 720x576@50.00Hz 720x576@50.00Hz 720x480@60.00Hz 720x480@60.00Hz 720x480@59.94Hz 720x480@59.94Hz 640x480@75.00Hz 640x480@60.00Hz 640x480@59.94Hz 640x480@59.94Hz 720x400@70.08Hz
```

Edita la línea `extraMonitorSettings`. **Ejemplos:**

- Monitor Único: `extraMonitorSettings = "monitor=eDP-1,1920x1080@60,auto,1";`
- Monitores Múltiples:
  `extraMonitorSettings = "
            monitor=eDP-1,1920x1080@60,auto,auto
            monitor=HDMI-A-1,2560x1440@75,auto,auto
            ";`

- Para configuraciones multi-monitor más complejas, puedes usar la aplicación GUI, `nwg-displays` Esta mostrará tus monitores conectados actualmente permitiéndote usar el mouse para coincidir cómo están arreglados físicamente. Ej. qué monitor está a la izquierda, derecha, arriba o abajo. Es muy similar a la herramienta X11 basada, `arandr` Creará entonces un archivo de configuración compatible con Hyprland en `~/.config/hypr/monitors.conf`

<img align="center" width="90%" src="https://gitlab.com/Zaney/zaneyos/-/raw/main/img/nwg-displays.png" />

Después de configurar los monitores como deseas, presiona `Apply` para guardar los cambios en `~/.config/hypr/monitors.conf`\
El contenido se verá algo como esto:

```text
# Generado por nwg-displays el 2025-03-20 a las 13:13:49. No editar manualmente.
monitor=HDMI-A-1,1920x1080@74.97,2136x268,1.0
monitor=eDP-1,1920x1080@144.0,216x268,1.0
```

Solo necesitas copiar las líneas `monitor=` y pegarlas en el archivo `variables.nix` como se describe en el proceso arriba.

Una vez hecho eso. Ejecuta el comando alias `fr` para construir una nueva generación para hacer efectivos los cambios.

Más información sobre configurar monitores está disponible en el [Wiki de Hyprland](https://wiki.hyprland.org/Configuring/Monitors/)

</details>

<details>
<summary>**¿Cómo agrego aplicaciones a ZaneyOS? **</summary>

### Hay dos opciones. Una para todos los hosts que tienes, otra para un host específico.

1. Para aplicaciones que se incluirán en todos los hosts definidos edita el archivo `~/zaneyos/modules/core/packages.nix` file.

Hay una sección que comienza con: `environment.systemPackages = with pkgs;`

Seguida de una lista de paquetes. Estos son requeridos para ZaneyOS.

Te sugerimos agregar un comentario al final de los nombres de paquetes. Luego agrega tus paquetes.

```text
    ...
    virt-viewer
    wget
    ###  Mis Apps ###
    bottom
    dua
    emacs-nox
    fd
    gping
    lazygit
    lunarvim
    luarocks
    mission-center
    ncdu
    nvtopPackages.full
    oh-my-posh
    pyprland
    shellcheck
    multimarkdown
    nodejs_23
    ugrep
    zoxide
  ];
}
```

2. Para aplicaciones que serán solo en hosts específicos.

Edita el `host-packages.nix` asociado con ese host.
`~/zaneyos/hosts/<HOSTNAME>/host-packages.nix`

La parte del archivo que necesitas editar se ve como esto:

```nix
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
  ];
}
```

Puedes agregar paquetes adicionales, o por ejemplo cambiar `discord` a `discord-canary` para obtener la versión beta de Discord pero solo en este host.

</details>

<details>

<summary>** Agregué los nombres de paquetes, ahora ¿cómo los instalo ? **</summary>

- Usa la utilidad `zcli`. `zcli rebuild`
- El alias legacy `fr`, Flake Rebuild está depreciado pero aún disponible

Si el rebuild se completa exitosamente, se creará una nueva generación con tus paquetes agregados.

</details>

<details>
<summary>** ¿Cómo actualizo los paquetes que ya instalé? **</summary>

- Usa la utilidad `zcli`. `zcli update`
- El `fu`, Flake Update alias está depreciado pero aún disponible
- Cualquiera de estos verificará paquetes actualizados, descargará e instalará.

</details>

<details>
<summary>** Hice un cambio a mi configuración de ZaneyOS, ¿cómo lo activo? **</summary>

- Usa la utilidad `zcli`. `zcli rebuild`
- El alias legacy `fr`, Flake Rebuild está depreciado pero aún disponible **
  NOTA: Si **creaste un nuevo archivo**
- necesitarás ejecutar un comando `git add .` en la carpeta `zaneyos`
- Si es exitoso se generará una nueva generación con tus cambios
- Un logout o reboot podría ser requerido dependiendo de qué cambiaste

</details>

<details>
<summary>** ¿Cómo puedo configurar un kernel diferente en un host específico? **</summary>

1. Tienes que editar el archivo `hardware.nix` para ese host en `~/zaneyos/hosts/HOSTNAME/hardware.nix` y override el default.
2. Cerca del top encontrarás esta sección del archivo `hardware.nix`.

```nix
boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc"];
boot.initrd.kernelModules = [];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [];
```

3. Agrega el override. Ej. para establecer el kernel a 6.12.

- `boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;`

4. El código actualizado se verá como esto:

```nix
boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc"];
boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;
boot.initrd.kernelModules = [];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [];
```

5. Usa el comando `zcli rebuild` o alias `fr` para crear una nueva generación y reboot para que tome efecto.

</details>

<details>

<summary>** ¿Cuáles son las principales opciones de Kernel en NixOS? **</summary>
NixOS ofrece varios tipos principales de kernel para adaptarse a diferentes necesidades y preferencias. A continuación están las opciones disponibles, excluyendo versiones específicas de kernel:

1. **`linuxPackages`**
   - El kernel estable default, típicamente una versión LTS (Long-Term Support).
     LTS en 25.05 (warbler) es 6.12.x Versiones más viejas, 6.6.x, 6.8.x no están soportadas.

2. **`linuxPackages_latest`**
   - El kernel mainline más reciente, que puede incluir nuevas características pero podría ser menos estable.

3. **`linuxPackages_zen`**
   - Un kernel optimizado para rendimiento con parches dirigidos a mejorar la responsividad e interactividad. Comúnmente usado por gamers y usuarios de desktop.

4. **`linuxPackages_hardened`**
   - Un kernel enfocado en seguridad con parches adicionales de hardening para protección mejorada.

5. **`linuxPackages_rt`**
   - Un kernel en tiempo real diseñado para baja latencia y aplicaciones sensibles al tiempo, como producción de audio o robótica.

6. **`linuxPackages_libre`**
   - Un kernel stripped de firmware y drivers propietarios, adhiriéndose a principios de software libre.

7. **`linuxPackages_xen_dom0`**
   - Un kernel adaptado para correr como host (dom0) en entornos de virtualización Xen.

8. **`linuxPackages_mptcp`**
   - Un kernel con soporte para Multipath TCP, útil para escenarios avanzados de networking.

</details>

<details>

<summary>** Tengo generaciones viejas que quiero borrar, ¿cómo puedo hacerlo? **</summary>

- El alias NixOS Clean Generations `ncg` removerá **TODAS** menos la más actual generación. Asegúrate de haber booted desde esa generación antes de usar este alias. También hay un schedule que removerá generaciones viejas automáticamente con el tiempo.

</details>

<details>

<summary>**¿Cómo cambio el hostname? **</summary>

Para cambiar el hostname, hay varios pasos y tendrás que reboot para hacer el cambio efectivo.

1. Copia el directorio del host que quieres renombrar a un directorio con el nuevo nombre.

- `cp -rpv ~/zaneyos/hosts/OLD-HOSTNAME ~/zaneyos/hosts/NEW-HOSTNAME`

2. Edita el archivo `~/zaneyos/flake.nix`. Cambia la línea:

- `host = "NEW-HOSTNAME"`

3. En el directorio `~/zaneyos` ejecuta `git add .` _El rebuild fallará con un error 'file not found' si olvidas este paso._

4. Usa el comando `zcli rebuild` o `fr` alias para crear una nueva generación con el nuevo hostname. Debes reboot para hacer el cambio efectivo.

</details>
<details>
<summary>** ¿Cómo deshabilito el copo de nieve giratorio al inicio? **</summary>

1. Edita el archivo `~/zaneyos/modules/core/boot.nix` file.
2. Busca:

```nix
};
  plymouth.enable = true;
};
```

3. Cámbialo a `false`
4. Ejecuta el comando `zcli rebuild` o alias `fr` para crear una nueva generación.

</details>

<details>
  <summary>** ¿Cómo configuro mi laptop híbrida con GPUs Intel/NVIDIA?  **</summary>

1. Ejecuta el script `install-zaneyos.sh` y selecciona el template `nvidia-laptop` o si configurando manualmente, establece el template en el `flake.nix` a `nvidia-prime`

2. En el archivo `~/zaneyos/hosts/HYBRID-HOST/variables.nix` necesitarás establecer los PCI IDs para las GPUs Intel y NVIDIA. Refiérete a [esta página](https://nixos.wiki/wiki/Nvidia) para ayudar a determinar esos valores.

3. Una vez que todo esté configurado apropiadamente, usa el alias Flake Rebuild `fr` para crear una nueva generación.

4. En el archivo `~/zaneyos/modules/home/hyprland/config.nix` hay un ENV setting`"AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1:/dev/dri/card2"` Esto establece la GPU primaria y secundaria. Usando la info del weblink arriba podrías tener que cambiar el orden de estos valores.

</details>

</div>

</details>

<details>
<summary>**🎨 Stylix**</summary>

<div style="margin-left: 20px;">

<details>
<summary>¿Cómo habilito o deshabilito Stylix? </summary>

- Para Habilitar:

1. Edita el archivo `~/zaneyos/modules/core/stylix.nix` file.
2. Comenta desde `base16Scheme` hasta el `};` después de `base0F`

```nix
# Opciones de Styling
  stylix = {
    enable = true;
    image = ../../wallpapers/Anime-girl-sitting-night-sky_1952x1120.jpg;
    #image = ../../wallpapers/Rainnight.jpg;
    #image = ../../wallpapers/zaney-wallpaper.jpg;
    #  base16Scheme = {
    #  base00 = "282936";
    #  base01 = "3a3c4e";
    #  base02 = "4d4f68";
    #  base03 = "626483";
    #  base04 = "62d6e8";
    #  base05 = "e9e9f4";
    #  base06 = "f1f2f8";
    #  base07 = "f7f7fb";
    #  base08 = "ea51b2";
    #  base09 = "b45bcf";
    #  base0A = "00f769";
    #  base0B = "ebff87";
    #  base0C = "a1efe4";
    #  base0D = "62d6e8";
    #  base0E = "b45bcf";
    #  base0F = "00f769";
    #};
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
```

3. Selecciona la imagen que quieres que `stylix` use para la paleta de colores.
4. Ejecuta el comando `zcli rebuild` o `fr` alias para crear una nueva generación con este esquema de colores.

- Para deshabilitar descomenta

1. Edita el archivo `~/zaneyos/modules/core/stylix.nix` file.
2. Descomenta desde `base16Scheme` hasta el `};` después de `base0F`

```nix
  base16Scheme = {
   base00 = "282936";
   base01 = "3a3c4e";
   base02 = "4d4f68";
   base03 = "626483";
   base04 = "62d6e8";
   base05 = "e9e9f4";
   base06 = "f1f2f8";
   base07 = "f7f7fb";
   base08 = "ea51b2";
   base09 = "b45bcf";
   base0A = "00f769";
   base0B = "ebff87";
   base0C = "a1efe4";
   base0D = "62d6e8";
   base0E = "b45bcf";
   base0F = "00f769";
 };
```

3. Ejecuta el comando `zcli rebuild` o `fr` alias para construir una nueva generación con el dracula default o establece tus propios colores custom

</details>

<details>
  <summary>¿Cómo cambio la imagen que Stylix usa para tematizar?</summary>

1. Edita el archivo `~/zaneyos/hosts/HOSTNAME/varibles.nix`
2. Cambia el `stylixImage =` al nombre del archivo que quieres usar. Los wallpapers están en `~/zaneyos/wallpapers`

```nix
# Establecer Imagen Stylix
stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;
```

</details>

</div>

</details>

<details>
<summary>**🌃 Wallpapers**</summary>

<div style="margin-left: 20px;">

<details>
<summary>**  ¿Cómo agrego más wallpapers? **</summary>

- Los wallpapers se almacenan en el directorio `~/zaneyos/wallpapers`.
- Simplemente copia los nuevos a ese directorio.
- Debes hacer un rebuild después de agregar nuevos wallpapers.
- Ejecuta el comando `zcli rebuild` o alias `fr` en la CLI.

</details>

<details>

<summary>** ¿Cómo cambio el fondo? **</summary>

- SUPER + ALT + W seleccionará un nuevo fondo

</details>

<details>

<summary>**  ¿Cómo puedo establecer un temporizador para cambiar el wallpaper automáticamente?  **</summary>

1. Edita el archivo `~/zaneyos/modules/home/hyprland/config.nix` file.
2. Comenta la línea `sleep 1.5 && swww img ...`
3. Agrega nueva línea después de eso con `sleep 1 && wallsetter`

```json
settings = {
      exec-once = [
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "killall -q swww;sleep .5 && swww init"
        "killall -q waybar;sleep .5 && waybar"
        "killall -q swaync;sleep .5 && swaync"
        "nm-applet --indicator"
        "lxqt-policykit-agent"
        "pypr &"
        #"sleep 1.5 && swww img /home/${username}/Pictures/Wallpapers/zaney-wallpaper.jpg"
        "sleep 1 && wallsetter"
      ];
```

4. Ejecuta el comando `zcli rebuild` o alias `fr` para crear una nueva generación.
5. Necesitarás logout o reboot para que el cambio sea efectivo.

</details>

<details>

<summary>**¿Cómo cambio el intervalo en que cambia el wallpaper?  **</summary>

1. Edita el archivo `~/zaneyos/modules/home/scripts/wallsetter`
2. Cambia el valor `TIMEOUT =` . Está en segundos.
3. Ejecuta el comando `zcli rebuild` o alias `fr`, para crear una nueva generación.
4. Necesitarás logout o reboot para que el cambio sea efectivo.

</details>

</div>

</details>

<details>
<summary>**⬆ ¿Cómo actualizo ZaneyOS?  **</summary>

<div style="margin-left: 20px;">

<details>
<summary> Para versión v2.3 </summary>

Altamente recomendado: Lee `ZaneyOS-Upgrade.md` antes de proceder. Detalla el upgrade automatizado seguro, respaldo, y proceso de revert.

Usa el upgrade automatizado v2.3 → v2.4. Ve `ZaneyOS-Upgrade.md` y `UPGRADE-2.3-to-2.4.md`. Para evitar sobrescribir tu config antes de crear un respaldo, fetch solo el script sin modificar tu working tree:

- Git (recomendado):
```bash
git -C ~/zaneyos fetch origin
git -C ~/zaneyos show origin/main:upgrade-2.3-to-2.4.sh > ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```
- Curl:
```bash
curl -fsSL https://gitlab.com/zaney/zaneyos/-/raw/main/upgrade-2.3-to-2.4.sh -o ~/upgrade-2.3-to-2.4.sh
chmod +x ~/upgrade-2.3-to-2.4.sh
```
Luego ejecuta el script: `~/upgrade-2.3-to-2.4.sh`. Creará un respaldo completo antes de cambiar branches y migrará tus hosts de forma segura desde el respaldo.

**IMPORTANTE:**
- NO uses los alias `fu` o `fr` para este upgrade; el script usa un boot build seguro.
- Si has hecho modificaciones extensas, no ejecutes el script. Lee los docs arriba y migra manualmente en su lugar.

</details>

<details>
  <summary> Para versiones v2.0->2.2 </summary>

1. Primero respaldo tu directorio `zaneyos` existente. ej.
   `cp -r ~/zaneyos ~/zaneyos-backup`

2. No hay update directo. Cuando clones la nueva config los archivos de config y layout han cambiado.

3. Necesitas instalar zaneyos como una nueva install. `./install-zaneyos.sh`

4. Una vez que el build se complete y hayas rebooted puedes revisar el nuevo layout y decidir si algún cambio que hiciste en la versión anterior puede ser migrado a v2.3.

</details>

<details>
  <summary> Para versión v1.x </summary>

1. El layout y configuración son completamente diferentes. Virtualmente nada de 1.x es aplicable a v2.3.

2. Respalda tu directorio `zaneyos` ej. `cp -r ~/zaneyos ~/zaneyos-backup`

3. Ejecuta el script `./install-zaneyos.sh` y sigue las nuevas instrucciones de install.

</details>

<details>
<summary> ¿Cómo sé cuándo se lanza una nueva versión de ZaneyOS? </summary>

Será anunciado en el servidor Discord de Zaney [Discord](https://discord.gg/W7efsSDS).

</details>

</div>

</details>

</div>

<details><summary>**📂 Layout de ZaneyOS v2.3**</summary>

<div style="margin-left: 25px;">

** 📂 ~/zaneyos **

```text
~/zaneyos/
    ├── hosts/                      # Carpeta donde se guardan configs de host
    │   ├── default                 # Template de host default
    │   └── nixstation              # Host de Zaney 
    ├── img/                        # Imágenes para README.md
    ├── modules/                    # Archivos de config Core, HomeMgr, drivers
    │   └── drivers/                # Configs AMD,NVIDA,Intel,VM
    │   └── core/                   # Servicios, paquetes, fonts, etc
    │   └── home/                   # Archivos de config Home Manager
    │    ├── fastfetch/             # Config Fastfetch 
    │    ├── hyprland/              # Configs Hyrprland
    │    ├── rofi/                  # Configs de menú rofi
    │    ├── scripts/               # screenshots, wallpaper, etc.
    │    ├── waybar/                # Configs waybar en formato NIX
    │    ├── wlogout/               # Tema, config para menú logout
    │    ├── yazi/                  # Archivo config de filemgr TUI
    │    └── zsh/                   # Tema y settings para ZSH
    ├── profiles/                   # Templates de hardware video
    │    ├── amd/                   # Configs video AMD
    │    ├── intel/                 # Configs video Intel
    │    ├── nvidia/                # Configs video NVIDIA discrete
    │    ├── nvidia-laptop/         # Configs video NVIDIA Hybrid
    │    └── vm/                    # Configs Virtual Machine
    ├── wallpapers/                 # Agrega tus wallpapers aquí 
    ├── CHANGELOG.md                # Lista de cambios
    ├── CONTRIBUTING.md             # Cómo puedes ayudar 
    ├── FAQ.md                      # Preguntas Frecuentes
    ├── flake.lock                  # Guarda info de versión de todos los paquetes instalados
    ├── flake.nix                   # flake que controla config ZaneyOS
    ├── install-zaneyos.sh          # Script de install para ZaneyOS
    ├── LICENSE                     # Licencia MIT que usa ZaneyOS
    └── README.md                   # Documento introductorio para ZaneyOS
```

</div>

</details>

**---> 🧰 Misceláneo**

<details>

<summary>**🪧 Rebuild o update falla con error de Home Manager no puede backup un archivo**</summary>

<div style="margin-left: 20px;">
<br>

**Update**
<br>

- Usando el comando `zcli rebuild` o `zcli upgrade` buscará este archivo causando fallos de rebuild
- Si encuentras otros archivos que causan esto puedes agregarlos en el `zaneyos/modules/home/scripts/default.nix`
  <br>

```text
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: Please do one of the following:
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - Move or remove the above files and try again.
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - In standalone mode, use 'home-manager switch -b backup' to back up
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:   files automatically.
May 08 18:33:57 explorer hm-activate-dwilliams[92420]: - When used as a NixOS or nix-darwin module, set
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:     'home-manager.backupFileExtension'
May 08 18:33:57 explorer hm-activate-dwilliams[92420]:   to, for example, 'backup' and rebuild.
May 08 18:33:57 explorer systemd[1]: home-manager-dwilliams.service: Main process exited, code=exited, status=1/FAILURE
May 08 18:33:57 explorer systemd[1]: home-manager-dwilliams.service: Failed with result 'exit-code'.
May 08 18:33:57 explorer systemd[1]: Failed to start Home Manager environment for dwilliams.
```

- Hay un script `hm-find` Que buscará en el journal y si lo encuentra,
- Te promptará para borrar estos backups
- También crea un log
- Nota: El script no es perfecto
- Si obtienes este msg pero `hm-find` no reporta ninguno tendrás que buscar manualmente ej `journalctl | grep hm-activate`
- Puedes entonces redo tu rebuild
- Usa el comando `zcli rebuild` o `fr` para `flake rebuild`
- El flake ya ha sido actualizado

</div>
</details>

<details>

<summary>**📚 ¿Cuál es la diferencia entre layouts Master y Dwindle**</summary>

<div style="margin-left: 20px;">
<br>

**1. Layout Master**

- El layout **Master** divide el workspace en dos áreas principales:
  - Un **área master** para la ventana primaria, que toma una porción más grande de la pantalla.
  - Un **área stack** para todas las otras ventanas, que están tiled en el espacio restante.
- Este layout es ideal para workflows donde quieres enfocarte en una ventana main mientras mantienes otras accesibles.

**2. Layout Dwindle**

- El layout **Dwindle** es un layout de tiling basado en árbol binario:
  - Cada nueva ventana split el espacio disponible dinámicamente, alternando entre splits horizontales y verticales.
  - Los splits son determinados por el aspect ratio del contenedor padre (ej. splits más anchos horizontalmente, más altos verticalmente).
- Este layout es más dinámico y distribuye espacio equitativamente entre todas las ventanas.

---

**Cómo Verificar el Layout Actual**

Para verificar cuál layout está activo actualmente, usa el comando `hyprctl`:

`hyprctl getoption general:layout`

</details>
</div>

</details>

<details>
<summary>**📦 ¿Cuáles son los keybindings de Yazi y cómo puedo cambiarlos? **</summary>

<div style="margin-left: 20px;"> <br>

El archivo de configuración de Yazi está localizado en `~/zaneyos/modules/home/yazi.nix`

Yazi está configurado como VIM y motions VIM

El keymap está en el archivo `~/zaneyos/modules/home/yazi/keymap.toml` file

</div>
</details>

<details>

<summary>** ¿Qué fonts están disponibles en NixOS**</summary>

```nix
{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome
      hackgen-nf-font
      ibm-plex
      inter
      jetbrains-mono
      material-icons
      maple-mono.NF
      minecraftia
      nerd-fonts.im-writing
      nerd-fonts.blex-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-monochrome-emoji
      powerline-fonts
      roboto
      roboto-mono
      symbola
      terminus_font
      # NERD fonts 
      nerd-fonts.0xproto
      nerd-fonts._3270
      nerd-fonts.agave
      nerd-fonts.anonymice
      nerd-fonts.arimo
      nerd-fonts.aurulent-sans-mono
      nerd-fonts.bigblue-terminal
      nerd-fonts.bitstream-vera-sans-mono
      nerd-fonts.blex-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.caskaydia-mono
      nerd-fonts.code-new-roman
      nerd-fonts.comic-shanns-mono
      nerd-fonts.commit-mono
      nerd-fonts.cousine
      nerd-fonts.d2coding
      nerd-fonts.daddy-time-mono
      nerd-fonts.departure-mono
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.droid-sans-mono
      nerd-fonts.envy-code-r
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.geist-mono
      nerd-fonts.go-mono
      nerd-fonts.gohufont
      nerd-fonts.hack
      nerd-fonts.hasklug
      nerd-fonts.heavy-data
      nerd-fonts.hurmit
      nerd-fonts.im-writing
      nerd-fonts.inconsolata
      nerd-fonts.inconsolata-go
      nerd-fonts.inconsolata-lgc
      nerd-fonts.intone-mono
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.iosevka-term-slab
      nerd-fonts.jetbrains-mono
      nerd-fonts.lekton
      nerd-fonts.liberation
      nerd-fonts.lilex
      nerd-fonts.martian-mono
      nerd-fonts.meslo-lg
      nerd-fonts.monaspace
      nerd-fonts.monofur
      nerd-fonts.monoid
      nerd-fonts.mononoki
      nerd-fonts.mplus
      nerd-fonts.noto
      nerd-fonts.open-dyslexic
      nerd-fonts.overpass
      nerd-fonts.profont
      nerd-fonts.proggy-clean-tt
      nerd-fonts.recursive-mono
      nerd-fonts.roboto-mono
      nerd-fonts.shure-tech-mono
      nerd-fonts.sauce-code-pro
      nerd-fonts.space-mono
      nerd-fonts.symbols-only
      nerd-fonts.terminess-ttf
      nerd-fonts.tinos
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.ubuntu-sans
      nerd-fonts.victor-mono
      nerd-fonts.zed-mono

    ];
  };
}
```

</details>

**---> 🖥️ Terminales **

<details>
<summary>**🐱  Kitty**</summary>

<details>

<summary>Mi cursor en Kitty es "janky" y salta alrededor. ¿Cómo lo arreglo?</summary>

- Esa característica se llama "cursor_trail" en el archivo `~/zaneyos/modules/home/kitty.nix`.

1. Edita ese archivo y cambia el `cursor_trail 1` a `cursor_trail 0` o comenta esa línea.
2. Usa el alias `zcli rebuild` o `fr` para crear una nueva generación con el cambio.

</details>

<details>
  <summary>¿Cuáles son los keybindings de Kitty y cómo puedo cambiarlos?</summary>

Los bindings de kitty están configurados en `~/zaneyos/modules/home/kitty.nix`

Los defaults son:

```text
    # Clipboard
    map ctrl+shift+v        paste_from_selection
    map shift+insert        paste_from_selection

    # Scrolling
    map ctrl+shift+up        scroll_line_up
    map ctrl+shift+down      scroll_line_down
    map ctrl+shift+k         scroll_line_up
    map ctrl+shift+j         scroll_line_down
    map ctrl+shift+page_up   scroll_page_up
    map ctrl+shift+page_down scroll_page_down
    map ctrl+shift+home      scroll_home
    map ctrl+shift+end       scroll_end
    map ctrl+shift+h         show_scrollback

    # Gestión de ventana
    map alt+n               new_window_with_cwd      #Abre nueva ventana en directorio actual
    #map alt+n               new_os_window           #Abre nueva ventana en $HOME dir
    map alt+w               close_window
    map ctrl+shift+enter    launch --location=hsplit
    map ctrl+shift+s        launch --location=vsplit
    map ctrl+shift+]        next_window
    map ctrl+shift+[        previous_window
    map ctrl+shift+f        move_window_forward
    map ctrl+shift+b        move_window_backward
    map ctrl+shift+`        move_window_to_top
    map ctrl+shift+1        first_window
    map ctrl+shift+2        second_window
    map ctrl+shift+3        third_window
    map ctrl+shift+4        fourth_window
    map ctrl+shift+5        fifth_window
    map ctrl+shift+6        sixth_window
    map ctrl+shift+7        seventh_window
    map ctrl+shift+8        eighth_window
    map ctrl+shift+9        ninth_window
    map ctrl+shift+0        tenth_window

    # Gestión de tab
    map ctrl+shift+right    next_tab
    map ctrl+shift+left     previous_tab
    map ctrl+shift+t        new_tab
    map ctrl+shift+q        close_tab
    map ctrl+shift+l        next_layout
    map ctrl+shift+.        move_tab_forward
    map ctrl+shift+,        move_tab_backward

    # Misceláneo
    map ctrl+shift+up      increase_font_size
    map ctrl+shift+down    decrease_font_size
    map ctrl+shift+backspace restore_font_size
```

</details>
</details>

<details>

<summary>**🇼  WezTerm**</summary>

<div style="margin-left: 20px;">

<details>

<summary>¿Cómo habilito WezTerm?</summary>

Edita el `/zaneyos/modules/home/wezterm.nix` Cambia `enable = false` a `enable = true;`\
Guarda el archivo y rebuild zaneyos con el comando `zcli rebild` o el alias `fr`

```
{pkgs, ...}: {
  programs.wezterm = {
    enable = false;
    package = pkgs.wezterm;
  };
```

</details>

<details>
  <summary>¿Cuáles son los keybindings de WezTerm y cómo puedo cambiarlos?</summary>

Los bindings de kitty están configurados en `~/zaneyos/modules/home/wezterm.nix`

Los defaults son:

```text
ALT es la tecla META definida para WezTerm
  -- Gestión de tab
ALT + t                 Abrir nuevo Tab
ALT + w                 Cerrar Tab actual
ALT + n                 Mover a siguiente Tab
ALT + p                 Mover a Tab anterior 
  -- Gestión de pane
ALT + v                 Crear Split Vertical
ALT + h                 Crear Split Horizontal
ALT + q                 Cerrar Pane Actual
   -- Navegación de pane (mover entre panes con ALT + Arrows)
ALT + Left Arrow        Mover a pane -- Izquierda
ALT + Right Arrow       Mover a pane -- Derecha
ALT + Down Arrow        Mover a pane -- Abajo
ALT + Up Arrow          Mover a pane -- Arriba
```

</details>
</div>
</details>

<details>
<summary>**👻 Ghostty **</summary>

<div style="margin-left: 20px;">

<details>
<summary> ¿Cómo habilito el terminal ghostty? </summary>

1. Edita el archivo `~/zaneyos/modules/home/ghostty.nix` file.
2. Cambia `enable = true;`
3. Ejecuta el alias `fr` para crear una nueva generación.

</details>

<details>

<summary> ¿Cómo cambio el tema de ghostty?   </summary>

1. Edita el archivo `~/zaneyos/modules/home/ghostty.nix` file.
2. Hay varios temas de ejemplo incluidos pero comentados.

```text
#theme = Aura
theme = Dracula
#theme = Aardvark Blue
#theme = GruvboxDarkHard
```

3. Comenta `Dracula` y descomenta uno de los otros o agrega uno de los muchos temas de ghostty.

</details>

<details>
<summary> ¿Cuáles son los keybindings default de ghostty?  </summary>

```text
 # keybindings
    keybind = alt+s>r=reload_config
    keybind = alt+s>x=close_surface

    keybind = alt+s>n=new_window

    # tabs
    keybind = alt+s>c=new_tab
    keybind = alt+s>shift+l=next_tab
    keybind = alt+s>shift+h=previous_tab
    keybind = alt+s>comma=move_tab:-1
    keybind = alt+s>period=move_tab:1

    # quick tab switch
    keybind = alt+s>1=goto_tab:1
    keybind = alt+s>2=goto_tab:2
    keybind = alt+s>3=goto_tab:3
    keybind = alt+s>4=goto_tab:4
    keybind = alt+s>5=goto_tab:5
    keybind = alt+s>6=goto_tab:6
    keybind = alt+s>7=goto_tab:7
    keybind = alt+s>8=goto_tab:8
    keybind = alt+s>9=goto_tab:9

    # split
    keybind = alt+s>\=new_split:right
    keybind = alt+s>-=new_split:down

    keybind = alt+s>j=goto_split:bottom
    keybind = alt+s>k=goto_split:top
    keybind = alt+s>h=goto_split:left
    keybind = alt+s>l=goto_split:right

    keybind = alt+s>z=toggle_split_zoom

    keybind = alt+s>e=equalize_splits
```

</details>
</div>
</details>

**
--> 🪧  Temas relacionados con NixOS general
**

<details>
<summary>**❄  ¿Qué son los Flakes en NixOS? **</summary>

<div style="margin-left: 20px;">

**Flakes** son una característica del package manager Nix que simplifica y estandariza cómo se gestionan configuraciones, dependencias y paquetes. Si estás familiarizado con herramientas como `package.json` en JavaScript o `Cargo.toml` en Rust, flakes sirven un propósito similar en el ecosistema Nix.

** Características Clave de Flakes: **

1. **Pin Dependencias**:
   - Flakes lock las versiones de dependencias en un archivo `flake.lock`, asegurando reproducibilidad entre sistemas.

2. **Estandarizar Configuraciones**:
   - Usan un archivo `flake.nix` para definir cómo build, run o deploy un proyecto o sistema, haciendo setups más predecibles.

3. **Mejorar Usabilidad**:
   - Flakes simplifican compartir y reusar configuraciones entre diferentes sistemas o proyectos proporcionando una estructura consistente.

En esencia, flakes ayudan a gestionar setups de NixOS o proyectos basados en Nix de una manera más portable y confiable.

</div>

</details>

<details>
<summary>**🏡  ¿Qué es NixOS Home Manager? **</summary>

**Home Manager** es una herramienta poderosa en el ecosistema Nix que te permite gestionar configuraciones y entornos específicos de usuario de manera declarativa. Con Home Manager, puedes simplificar el setup de dotfiles, settings de shell, aplicaciones y paquetes de sistema para tu perfil de usuario.

### Características Clave de Home Manager:

1. **Configuración Declarativa**:
   - Define todos tus settings y preferencias en un solo archivo `home.nix`, haciendo fácil trackear, compartir y replicar tu setup.

2. **Soporte Cross-Distribution**:
   - Home Manager funciona no solo en NixOS sino también en otras distribuciones Linux y macOS, permitiéndote estandarizar configuraciones entre dispositivos.

3. **Gestión de Entorno de Usuario**:
   - Gestiona aplicaciones, variables de entorno, configuraciones de shell y más—todo aislado a tu perfil de usuario.

### ¿Por Qué Usar Home Manager?

Home Manager simplifica la gestión de sistema ofreciendo consistencia, reproducibilidad y portabilidad. Ya sea que estés customizando tu entorno de desarrollo o compartiendo configuraciones entre máquinas, proporciona una manera eficiente de adaptar tu experiencia de usuario.

</details>

<details>
<summary>**🏭  ¿Qué son los Builds Atómicos?**</summary>

**Builds atómicos** en NixOS aseguran que cualquier cambio de sistema (como instalar software o actualizar la configuración) se aplique de manera segura y fail-proof. Esto significa que una actualización de sistema es completamente exitosa o no tiene efecto alguno, eliminando el riesgo de un estado de sistema parcialmente aplicado o roto.

### Cómo Funcionan los Builds Atómicos:

1. **Generación de Sistema Inmutable**:
   - Cada cambio de configuración crea una nueva "generación" del sistema, mientras las previas permanecen intactas. Puedes fácilmente rollback a una generación anterior si algo sale mal.

2. **Comportamiento Transaccional**:
   - Similar a transacciones de database, los cambios se aplican atómicamente: o tienen éxito y se convierten en el nuevo sistema activo, o fallan y dejan el sistema actual sin cambios.

3. **Rollbacks Sin Problemas**:
   - En caso de errores o issues, puedes reboot y seleccionar una generación previa de sistema desde el menú de boot para retornar a un estado funcional.

### Beneficios de Builds Atómicos:

- **Confiabilidad**: Tu sistema está siempre en un estado consistente, incluso si un cambio de configuración falla.
- **Reproducibilidad**: La misma configuración siempre producirá el mismo estado de sistema, haciendo fácil debuggear o replicar.
- **Facilidad de Rollback**: Revertir a una configuración funcional es tan simple como reboot y seleccionar la generación previa.

### ¿Por Qué NixOS Usa Builds Atómicos?

Esta característica es un cornerstone de la filosofía de diseño declarativo y reproducible de NixOS, asegurando que la gestión de sistema sea predecible y sin estrés.

</details>

<details>
<summary>**❓ Soy nuevo en NIXOS ¿dónde puedo ir para obtener más info? **</summary>

- [NIXOS Config Guide](https://www.youtube.com/watch?v=AGVXJ-TIv3Y&t=34s)
- [VIMJOYER YouTube Channel](https://www.youtube.com/@vimjoyer/videos)
- [Librephoenix YouTube Channel](https://www.youtube.com/@librephoenix)
- [8 Part Video Series on NIXOS](https://www.youtube.com/watch?v=QKoQ1gKJY5A&list=PL-saUBvIJzOkjAw_vOac75v-x6EzNzZq-)
- [Great guide for NixOS and Flakes](https://nixos-and-flakes.thiscute.world/preface)

</details>

<details>
<summary>**🏤 ¿Dónde puedo obtener info sobre usar repositorios GIT  **</summary>

- [Managing NIXOS config with GIT](https://www.youtube.com/watch?v=20BN4gqHwaQ)
- [GIT for dummies](https://www.youtube.com/watch?v=K6Q31YkorUE)
- [How GIT works](https://www.youtube.com/watch?v=e9lnsKot_SQ)
- [In depth 1hr video on GIT](https://www.youtube.com/watch?v=S7XpTAnSDL4&t=123s)

</details>

</div>

</details>