{
  services.elephant.enable = true;

  services.walker = {
    enable = true;
    systemd.enable = true;
    theme.name = "gruvbox";
    enableElephantIntegration = true;
  };
}
