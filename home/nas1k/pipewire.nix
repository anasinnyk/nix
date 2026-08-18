{ pkgs, ... }: {
  home.packages = with pkgs; [
    pwvucontrol
  ];
  services.pipewire = {
    wireplumber.configs = {
      "99-amd-pro-audio" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                "device.name" = "alsa_card.pci-0000_03_00.1";
              }
            ];
            actions = {
              "update-props" = {
                "device.profile" = "pro-audio";
              };
            };
          }
        ];
      };
      "95-audio-priotiry" = {
        "monitor.bluez.rules" = [
          {
            matches = [ { "device.name" = "~bluez_card.*"; } ];
            actions = {
              "update-props" = {
                "priority.session" = 1800;
                "device.profile" = "a2dp-sink";
                "bluez5.auto-connect" = [
                  "a2dp_sink"
                ];
              };
            };
          }
        ];
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                "device.model" = "Insta360 Link";
              }
            ];
            actions = {
              "update-props" = {
                "priority.session" = 1500;
              };
            };
          }
        ];
        "monitor.v4l2.rules" = [
          {
            matches = [
              {
                "device.model" = "Insta360 Link";
              }
            ];
            actions = {
              "update-props" = {
                "priority.session" = 2000;
              };
            };
          }
        ];
      };
    };
  };
}
