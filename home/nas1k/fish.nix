{ ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting
      set -g fish_key_bindings fish_vi_key_bindings
    '';
  };
}
