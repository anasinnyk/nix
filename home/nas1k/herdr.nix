{ ... }: {
  programs.herdr = {
    enable = true;
    settings = {
      terminal.default_shell = "fish";
      keys = {
        prefix = "ctrl+space";
      };
        theme.name = "gruvbox";
      };
  };
}
