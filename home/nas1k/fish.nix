{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx SHELL ${pkgs.fish}/bin/fish
      set -U fish_greeting
      set -g fish_key_bindings fish_vi_key_bindings
      devenv hook fish | source
    '';
  };
}
