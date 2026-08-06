{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      indicator-radius = 100;
      indicator-thickness = 8;
      show-failed-attempts = true;
      ignore-empty-password = true;
      image = ./resources/wp.jpg;
      scaling = "fill";
    };
  };

  services.swayidle = {
    enable = true;

    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 310;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
    ];

    events = {
      "before-sleep" = "${pkgs.swaylock}/bin/swaylock -f";
      "lock" = "${pkgs.swaylock}/bin/swaylock -f";
    };
  };
}
