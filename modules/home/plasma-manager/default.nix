{
  inputs,
  lib,
  config,
  ...
}:
{
  options.hm = {
    plasma-manager.enable = lib.mkEnableOption "enables plasma-manager";
  };

  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

  config = lib.mkIf config.hm.plasma-manager.enable {
    programs.plasma = {
      enable = true;
      shortcuts = {
        "ActivityManager"."switch-to-activity-6dc27aa9-c054-46e3-9510-cef8b0c32fa8" = [ ];
        "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
        "kaccess"."Toggle Screen Reader On and Off" = "Meta+Alt+S";
        "kcm_touchpad"."Disable Touchpad" = "Touchpad Off";
        "kcm_touchpad"."Enable Touchpad" = "Touchpad On";
        "kcm_touchpad"."Toggle Touchpad" = [
          "Touchpad Toggle"
          "Meta+Ctrl+Zenkaku Hankaku,Touchpad Toggle"
          "Meta+Ctrl+Zenkaku Hankaku"
        ];
        "kmix"."decrease_microphone_volume" = "Microphone Volume Down";
        "kmix"."decrease_volume" = "Volume Down";
        "kmix"."decrease_volume_small" = "Shift+Volume Down";
        "kmix"."increase_microphone_volume" = "Microphone Volume Up";
        "kmix"."increase_volume" = "Volume Up";
        "kmix"."increase_volume_small" = "Shift+Volume Up";
        "kmix"."mic_mute" = [
          "Microphone Mute"
          "Meta+Volume Mute,Microphone Mute"
          "Meta+Volume Mute,Mute Microphone"
        ];
        "kmix"."mute" = "Volume Mute";
        "ksmserver"."Halt Without Confirmation" = [ ];
        "ksmserver"."Lock Session" = [
          "Meta+L"
          "Screensaver,Meta+L"
          "Screensaver,Sitzung sperren"
        ];
        "ksmserver"."Log Out" = "Ctrl+Alt+Del";
        "ksmserver"."Log Out Without Confirmation" = [ ];
        "ksmserver"."LogOut" = [ ];
        "ksmserver"."Reboot" = [ ];
        "ksmserver"."Reboot Without Confirmation" = [ ];
        "ksmserver"."Shut Down" = [ ];
        "kwin"."Activate Window Demanding Attention" =
          "Meta+Ctrl+A,Meta+Ctrl+A,Fenster aktivieren\\, das Aufmerksamkeit erfordert";
        "kwin"."Cycle Overview" = [ ];
        "kwin"."Cycle Overview Opposite" = [ ];
        "kwin"."Decrease Opacity" = [ ];
        "kwin"."Edit Tiles" = "Meta+T";
        "kwin"."Expose" = "Ctrl+F9";
        "kwin"."Window Maximize" = [
          "Meta+F"
          "Meta+F,Meta+PgUp,Fenster Maximieren"
        ];
        "kwin"."ExposeAll" = [
          "Ctrl+F10"
          "Launch (C),Ctrl+F10"
          "Launch (C),Fenster aller Arbeitsflächen anzeigen"
        ];
        "kwin"."ExposeClass" = "Ctrl+F7";
        "kwin"."ExposeClassCurrentDesktop" = [ ];
        "kwin"."Grid View" = "Meta+G";
        "kwin"."Increase Opacity" = [ ];
        "kwin"."Kill Window" = "Meta+Ctrl+Esc";
        "kwin"."Move Tablet to Next Output" = [ ];
        "kwin"."MoveMouseToCenter" = "Meta+F6";
        "kwin"."MoveMouseToFocus" = "Meta+F5";
        "kwin"."MoveZoomDown" = [ ];
        "kwin"."MoveZoomLeft" = [ ];
        "kwin"."MoveZoomRight" = [ ];
        "kwin"."MoveZoomUp" = [ ];
        "kwin"."Overview" = "Meta+W";
        "kwin"."Setup Window Shortcut" = [ ];
        "kwin"."Show Desktop" = "Meta+D";
        "kwin"."Switch One Desktop Down" = "Meta+Ctrl+Down";
        "kwin"."Switch One Desktop Up" = "Meta+Ctrl+Up";
        "kwin"."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "kwin"."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "kwin"."Switch Window Down" = "Meta+Alt+Down";
        "kwin"."Switch Window Left" = "Meta+Alt+Left";
        "kwin"."Switch Window Right" = "Meta+Alt+Right";
        "kwin"."Switch Window Up" = "Meta+Alt+Up";
        "kwin"."Switch to Desktop 1" = "Ctrl+F1";
        "kwin"."Switch to Desktop 10" = [ ];
        "kwin"."Switch to Desktop 11" = [ ];
        "kwin"."Switch to Desktop 12" = [ ];
        "kwin"."Switch to Desktop 13" = [ ];
        "kwin"."Switch to Desktop 14" = [ ];
        "kwin"."Switch to Desktop 15" = [ ];
        "kwin"."Switch to Desktop 16" = [ ];
        "kwin"."Switch to Desktop 17" = [ ];
        "kwin"."Switch to Desktop 18" = [ ];
        "kwin"."Switch to Desktop 19" = [ ];
        "kwin"."Switch to Desktop 2" = "Ctrl+F2";
        "kwin"."Switch to Desktop 20" = [ ];
        "kwin"."Switch to Desktop 3" = "Ctrl+F3";
        "kwin"."Switch to Desktop 4" = "Ctrl+F4";
        "kwin"."Switch to Desktop 5" = [ ];
        "kwin"."Switch to Desktop 6" = [ ];
        "kwin"."Switch to Desktop 7" = [ ];
        "kwin"."Switch to Desktop 8" = [ ];
        "kwin"."Switch to Desktop 9" = [ ];
        "kwin"."Switch to Next Desktop" = [ ];
        "kwin"."Switch to Next Screen" = [ ];
        "kwin"."Switch to Previous Desktop" = [ ];
        "kwin"."Switch to Previous Screen" = [ ];
        "kwin"."Switch to Screen 0" = [ ];
        "kwin"."Switch to Screen 1" = [ ];
        "kwin"."Switch to Screen 2" = [ ];
        "kwin"."Switch to Screen 3" = [ ];
        "kwin"."Switch to Screen 4" = [ ];
        "kwin"."Switch to Screen 5" = [ ];
        "kwin"."Switch to Screen 6" = [ ];
        "kwin"."Switch to Screen 7" = [ ];
        "kwin"."Switch to Screen Above" = [ ];
        "kwin"."Switch to Screen Below" = [ ];
        "kwin"."Switch to Screen to the Left" = [ ];
        "kwin"."Switch to Screen to the Right" = [ ];
        "kwin"."Toggle Night Color" = [ ];
        "kwin"."Toggle Window Raise/Lower" = [ ];
        "kwin"."Walk Through Windows" = "Alt+Tab";
        "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "kwin"."Walk Through Windows Alternative" = [ ];
        "kwin"."Walk Through Windows Alternative (Reverse)" = [ ];
        "kwin"."Walk Through Windows of Current Application" = "Alt+`";
        "kwin"."Walk Through Windows of Current Application (Reverse)" = "Alt+~";
        "kwin"."Walk Through Windows of Current Application Alternative" = [ ];
        "kwin"."Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
        "kwin"."Window Above Other Windows" = [ ];
        "kwin"."Window Below Other Windows" = [ ];
        "kwin"."Window Close" = "Alt+F4";
        "kwin"."Window Fullscreen" = [ ];
        "kwin"."Window Grow Horizontal" = [ ];
        "kwin"."Window Grow Vertical" = [ ];
        "kwin"."Window Lower" = [ ];
        "kwin"."Window Maximize Horizontal" = [ ];
        "kwin"."Window Maximize Vertical" = [ ];
        "kwin"."Window Minimize" = "Meta+PgDown";
        "kwin"."Window Move" = [ ];
        "kwin"."Window Move Center" = [ ];
        "kwin"."Window No Border" = [ ];
        "kwin"."Window On All Desktops" = [ ];
        "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "kwin"."Window One Screen Down" = [ ];
        "kwin"."Window One Screen Up" = [ ];
        "kwin"."Window One Screen to the Left" = [ ];
        "kwin"."Window One Screen to the Right" = [ ];
        "kwin"."Window Operations Menu" = "Alt+F3";
        "kwin"."Window Pack Down" = [ ];
        "kwin"."Window Pack Left" = [ ];
        "kwin"."Window Pack Right" = [ ];
        "kwin"."Window Pack Up" = [ ];
        "kwin"."Window Quick Tile Bottom" = "Meta+Down";
        "kwin"."Window Quick Tile Bottom Left" = [ ];
        "kwin"."Window Quick Tile Bottom Right" = [ ];
        "kwin"."Window Quick Tile Left" = "Meta+Left";
        "kwin"."Window Quick Tile Right" = "Meta+Right";
        "kwin"."Window Quick Tile Top" = "Meta+Up";
        "kwin"."Window Quick Tile Top Left" = [ ];
        "kwin"."Window Quick Tile Top Right" = [ ];
        "kwin"."Window Raise" = [ ];
        "kwin"."Window Resize" = [ ];
        "kwin"."Window Shade" = [ ];
        "kwin"."Window Shrink Horizontal" = [ ];
        "kwin"."Window Shrink Vertical" = [ ];
        "kwin"."Window to Desktop 1" = [ ];
        "kwin"."Window to Desktop 10" = [ ];
        "kwin"."Window to Desktop 11" = [ ];
        "kwin"."Window to Desktop 12" = [ ];
        "kwin"."Window to Desktop 13" = [ ];
        "kwin"."Window to Desktop 14" = [ ];
        "kwin"."Window to Desktop 15" = [ ];
        "kwin"."Window to Desktop 16" = [ ];
        "kwin"."Window to Desktop 17" = [ ];
        "kwin"."Window to Desktop 18" = [ ];
        "kwin"."Window to Desktop 19" = [ ];
        "kwin"."Window to Desktop 2" = [ ];
        "kwin"."Window to Desktop 20" = [ ];
        "kwin"."Window to Desktop 3" = [ ];
        "kwin"."Window to Desktop 4" = [ ];
        "kwin"."Window to Desktop 5" = [ ];
        "kwin"."Window to Desktop 6" = [ ];
        "kwin"."Window to Desktop 7" = [ ];
        "kwin"."Window to Desktop 8" = [ ];
        "kwin"."Window to Desktop 9" = [ ];
        "kwin"."Window to Next Desktop" = [ ];
        "kwin"."Window to Next Screen" = "Meta+Shift+Right";
        "kwin"."Window to Previous Desktop" = [ ];
        "kwin"."Window to Previous Screen" = "Meta+Shift+Left";
        "kwin"."Window to Screen 0" = [ ];
        "kwin"."Window to Screen 1" = [ ];
        "kwin"."Window to Screen 2" = [ ];
        "kwin"."Window to Screen 3" = [ ];
        "kwin"."Window to Screen 4" = [ ];
        "kwin"."Window to Screen 5" = [ ];
        "kwin"."Window to Screen 6" = [ ];
        "kwin"."Window to Screen 7" = [ ];
        "kwin"."view_actual_size" = "Meta+0";
        "kwin"."view_zoom_in" = [
          "Meta++"
          "Meta+=,Meta++"
          "Meta+=,Vergrößern"
        ];
        "kwin"."view_zoom_out" = "Meta+-";
        "mediacontrol"."mediavolumedown" = [ ];
        "mediacontrol"."mediavolumeup" = [ ];
        "mediacontrol"."nextmedia" = "Media Next";
        "mediacontrol"."pausemedia" = "Media Pause";
        "mediacontrol"."playmedia" = [ ];
        "mediacontrol"."playpausemedia" = "Media Play";
        "mediacontrol"."previousmedia" = "Media Previous";
        "mediacontrol"."stopmedia" = "Media Stop";
        "org_kde_powerdevil"."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        "org_kde_powerdevil"."Decrease Screen Brightness" = "Monitor Brightness Down";
        "org_kde_powerdevil"."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        "org_kde_powerdevil"."Hibernate" = "Hibernate";
        "org_kde_powerdevil"."Increase Keyboard Brightness" = "Keyboard Brightness Up";
        "org_kde_powerdevil"."Increase Screen Brightness" = "Monitor Brightness Up";
        "org_kde_powerdevil"."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        "org_kde_powerdevil"."PowerDown" = "Power Down";
        "org_kde_powerdevil"."PowerOff" = "Power Off";
        "org_kde_powerdevil"."Sleep" = "Sleep";
        "org_kde_powerdevil"."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        "org_kde_powerdevil"."Turn Off Screen" = [ ];
        "org_kde_powerdevil"."powerProfile" = [
          "Battery"
          "Meta+B,Battery"
          "Meta+B,Energieprofil wechseln"
        ];
        "plasmashell"."activate application launcher" = [
          "Meta"
          "Alt+F1,Meta"
          "Alt+F1,Anwendungsstarter aktivieren"
        ];
        "plasmashell"."activate task manager entry 1" = "Meta+1";
        "plasmashell"."activate task manager entry 10" = ",Meta+0,Fensterleisteneintrag 10 aktivieren";
        "plasmashell"."activate task manager entry 2" = "Meta+2";
        "plasmashell"."activate task manager entry 3" = "Meta+3";
        "plasmashell"."activate task manager entry 4" = "Meta+4";
        "plasmashell"."activate task manager entry 5" = "Meta+5";
        "plasmashell"."activate task manager entry 6" = "Meta+6";
        "plasmashell"."activate task manager entry 7" = "Meta+7";
        "plasmashell"."activate task manager entry 8" = "Meta+8";
        "plasmashell"."activate task manager entry 9" = "Meta+9";
        "plasmashell"."clear-history" = [ ];
        "plasmashell"."clipboard_action" = "Meta+Ctrl+X";
        "plasmashell"."cycle-panels" = "Meta+Alt+P";
        "plasmashell"."cycleNextAction" = [ ];
        "plasmashell"."cyclePrevAction" = [ ];
        "plasmashell"."manage activities" = "Meta+Q";
        "plasmashell"."next activity" = "Meta+A,none,Zwischen Aktivitäten wechseln";
        "plasmashell"."previous activity" =
          "Meta+Shift+A,none,Zwischen Aktivitäten wechseln (Gegenrichtung)";
        "plasmashell"."repeat_action" =
          ",Meta+Ctrl+R,Aktionen der aktuellen Zwischenablage manuell aufrufen";
        "plasmashell"."show dashboard" = "Ctrl+F12";
        "plasmashell"."show-barcode" = [ ];
        "plasmashell"."show-on-mouse-pos" = "Meta+V";
        "plasmashell"."stop current activity" = "Meta+S";
        "plasmashell"."switch to next activity" = [ ];
        "plasmashell"."switch to previous activity" = [ ];
        "plasmashell"."toggle do not disturb" = [ ];
      };
      configFile = {
        "baloofilerc"."General"."dbVersion" = 2;
        "baloofilerc"."General"."exclude filters" =
          "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
        "baloofilerc"."General"."exclude filters version" = 9;
        "kactivitymanagerdrc"."activities"."6dc27aa9-c054-46e3-9510-cef8b0c32fa8" = "Standard";
        "kactivitymanagerdrc"."main"."currentActivity" = "6dc27aa9-c054-46e3-9510-cef8b0c32fa8";
        "kded5rc"."Module-device_automounter"."autoload" = false;
        "kdeglobals"."WM"."activeBackground" = "49,54,59";
        "kdeglobals"."WM"."activeBlend" = "252,252,252";
        "kdeglobals"."WM"."activeForeground" = "252,252,252";
        "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
        "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
        "kdeglobals"."WM"."inactiveForeground" = "161,169,177";
        "kwinrc"."Desktops"."Id_1" = "c3144ff6-511c-4e04-ae6c-494b4c3febc8";
        "kwinrc"."Desktops"."Number" = 1;
        "kwinrc"."Desktops"."Rows" = 1;
        "kwinrc"."Tiling"."padding" = 4;
        "kwinrc"."Tiling/6262e2af-a121-5f09-acb1-224e080390c9"."tiles" =
          "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "kwinrc"."Tiling/74b6fc48-4c72-5847-909e-5d1ee8af2a76"."tiles" =
          "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "kwinrc"."Xwayland"."Scale" = 1;
        "plasma-localerc"."Formats"."LANG" = "de_DE.UTF-8";
        "plasmarc"."Theme"."name" = "breeze-dark";
        "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Bildschirmfotos";
        "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Bildschirmaufnahmen";
      };
      dataFile = {
      };
    };
  };
}
