{
  imports = [
    ./ghostty.nix
    ./starship.nix
    ./font.nix
    ./git.nix
    ./nvim.nix
    ./firefox.nix
    ./opencode.nix
    ./walker.nix
    ./niri.nix
    ./wayle.nix
    ./herdr.nix
    ./fish.nix
    ./pi.nix
    ./swaylock.nix
    ./utils.nix
    ./vicinae.nix
  ];

  home = {
    username = "nas1k";
    homeDirectory = "/home/nas1k";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
}
