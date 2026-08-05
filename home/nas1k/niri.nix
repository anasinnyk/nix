{ ... }: {
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
      switch-events = {
        lid-close.spawn = [ "bash" "-c" "[[ $(niri msg outputs | grep -E \"^Output [^(]*\\(([^)]*)\\)$\" | wc -l) -gt 1 ]] && niri msg output off eDP-1" ];
        lid-open.spawn = [ "bash" "-c" "[[ $(niri msg outputs | grep -E \"^Output [^(]*\\(([^)]*)\\)$\" | wc -l) -gt 1 ]] && niri msg output on eDP-1" ];
      };
      binds = {
        "Mod+Return".spawn = [ "ghostty" ];
        "Mod+B".spawn = [ "firefox-beta" ];

        "Mod+Q".close-window = [ ];
        "Mod+Comma".consume-window-into-column = [ ];
        "Mod+Period".expel-window-from-column = [ ];

        "Mod+H".focus-column-left = [ ];
        "Mod+L".focus-column-right = [ ];
        "Mod+K".focus-window-or-monitor-up = [ ];
        "Mod+J".focus-window-or-monitor-down = [ ];

        "Mod+Ctrl+H".move-column-left = [ ];
        "Mod+Ctrl+L".move-column-right = [ ];
        "Mod+Ctrl+K".move-window-up = [ ];
        "Mod+Ctrl+J".move-window-down = [ ];

        "Mod+F".maximize-column = [ ];
        "Mod+Shift+F".fullscreen-window = [ ];

        "XF86AudioRaiseVolume".spawn = [ "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+" ];
        "XF86AudioLowerVolume".spawn = [ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-" ];
        "XF86AudioMute".spawn = [ "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ];
      };
    };
  };
}
