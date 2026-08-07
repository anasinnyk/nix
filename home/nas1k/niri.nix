{ pkgs, lib, ... }: {
  home.packages = [ pkgs.pulseaudio ];
  services.awww.enable = true;
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      input = {
        keyboard = {
          xkb = {
            layout = "us,ua";
            options = "grp:caps_toggle";
          };
        };
      };
      _children = [
        {
          output = {
            _args = [ "DP-2" ];
            scale = 1.5;
            position._props = {
              x = 0;
              y = 0;
            };
          };
        }
        {
          output = {
            _args = [ "DP-1" ];
            scale = 1.5;
            position._props = {
              x = 2560;
              y = 0;
            };
          };
        }
        {
          output = {
            _args = [ "eDP-1" ];
            scale = 1.0;
            position._props = {
              x = 5120;
              y = 0;
            };
          };
        }
      ];
      switch-events = {
        lid-close.spawn = [
          "bash"
          "-c"
          "[[ $(niri msg outputs | grep -E \"^Output [^(]*\\(([^)]*)\\)$\" | wc -l) -gt 1 ]] && niri msg output off eDP-1"
        ];
        lid-open.spawn = [
          "bash"
          "-c"
          "[[ $(niri msg outputs | grep -E \"^Output [^(]*\\(([^)]*)\\)$\" | wc -l) -gt 1 ]] && niri msg output on eDP-1"
        ];
      };
      binds = {
        "Mod+Return".spawn = [ "ghostty" ];
        "Mod+B".spawn = [ "firefox-beta" ];

        "Mod+Space".spawn = [
          "vicinae"
          "vicinae://toggle"
        ];

        "Mod+V".spawn = [
          "vicinae"
          "vicinae://launch/clipboard/history?toggle=true"
        ];

        "Mod+Shift+Q".spawn = [
          (lib.getExe pkgs.swaylock)
          "-f"
          "-i"
          "${./resources/wp.jpg}"
        ];

        "Mod+Q".close-window = [ ];

        "Mod+Comma".consume-window-into-column = [ ];
        "Mod+Period".expel-window-from-column = [ ];
        "Mod+W".toggle-column-tabbed-display = [ ];

        "Mod+H".focus-column-left = [ ];
        "Mod+L".focus-column-right = [ ];
        "Mod+K".focus-window-up = [ ];
        "Mod+J".focus-window-down = [ ];
        "Mod+U".focus-workspace-down = [ ];
        "Mod+I".focus-workspace-up = [ ];
        "Mod+M".focus-monitor-next = [ ];
        "Mod+Shift+M".focus-monitor-previous = [ ];

        "Mod+Ctrl+H".move-column-left = [ ];
        "Mod+Ctrl+L".move-column-right = [ ];
        "Mod+Ctrl+K".move-window-up = [ ];
        "Mod+Ctrl+J".move-window-down = [ ];
        "Mod+Ctrl+U".move-window-to-workspace-down = [ ];
        "Mod+Ctrl+I".move-window-to-workspace-up = [ ];
        "Mod+Shift+U".move-workspace-down = [ ];
        "Mod+Shift+I".move-workspace-up = [ ];
        "Mod+Ctrl+M".move-window-to-monitor-next = [ ];
        "Mod+Ctrl+Shift+M".move-window-to-monitor-previous = [ ];

        "Mod+1".focus-workspace = 1;
        "Mod+2".focus-workspace = 2;
        "Mod+3".focus-workspace = 3;
        "Mod+4".focus-workspace = 4;
        "Mod+5".focus-workspace = 5;
        "Mod+6".focus-workspace = 6;
        "Mod+7".focus-workspace = 7;
        "Mod+8".focus-workspace = 8;
        "Mod+9".focus-workspace = 9;

        "Mod+Ctrl+1".move-window-to-workspace = 1;
        "Mod+Ctrl+2".move-window-to-workspace = 2;
        "Mod+Ctrl+3".move-window-to-workspace = 3;
        "Mod+Ctrl+4".move-window-to-workspace = 4;
        "Mod+Ctrl+5".move-window-to-workspace = 5;
        "Mod+Ctrl+6".move-window-to-workspace = 6;
        "Mod+Ctrl+7".move-window-to-workspace = 7;
        "Mod+Ctrl+8".move-window-to-workspace = 8;
        "Mod+Ctrl+9".move-window-to-workspace = 9;

        "Mod+F".maximize-column = [ ];
        "Mod+Shift+F".fullscreen-window = [ ];

        "Mod+S".screenshot = [ ];
        "Mod+Shift+S".screenshot-window = [ ];

        "XF86AudioRaiseVolume".spawn = [
          "wpctl"
          "set-volume"
          "-l"
          "1.0"
          "@DEFAULT_AUDIO_SINK@"
          "5%+"
        ];
        "XF86AudioLowerVolume".spawn = [
          "wpctl"
          "set-volume"
          "-l"
          "1.0"
          "@DEFAULT_AUDIO_SINK@"
          "5%-"
        ];
        "XF86AudioMute".spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];

      };
    };
  };
}
