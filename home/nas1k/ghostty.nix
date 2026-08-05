{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installVimSyntax = true;
    settings = {
      font-family = "Fira Code";
      theme = "Gruvbox Dark";
      command = "${pkgs.fish}/bin/fish";
      mouse-hide-while-typing = true;
    };
  };
}
