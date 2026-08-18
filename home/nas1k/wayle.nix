{
  services.wayle = {
    enable = true;
    autoInstallDependencies = true;
    settings = {
      bar = {
        bg = "transparent";
        button-rounding = "lg";
        exclusive = true;
        scale = 0.5;
        layout = [
          {
            left = [
              "niri-workspaces"
              "media"
            ];
            center = [ ];
            monitor = "*";
            right = [ "dashboard" ];
            show = true;
          }
        ];
        location = "bottom";
      };
      general = {
        font-mono = "Fira Code";
        font-sans = "Fira Code";
      };
      modules = {
        battery = {
          label-show = false;
        };
        bluetooth = {
          label-show = false;
        };
        clock = {
          label-show = false;
        };
        microphone = {
          label-show = false;
        };
        network = {
          label-show = false;
        };
        volume = {
          label-show = false;
        };
      };
      styling = {
        palette = {
          bg = "#282828";
          blue = "#8ec07c";
          elevated = "#504945";
          fg = "#ebdbb2";
          fg-muted = "#d5c4a1";
          green = "#b8bb26";
          primary = "#83a598";
          red = "#fb4934";
          surface = "#3c3836";
          yellow = "#fabd2f";
        };
      };
    };
  };
}
