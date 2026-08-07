{ pkgs, ... }: {

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins.lz-n.enable = true;

    extraPackages = with pkgs; [
      ripgrep
      delta
      haskellPackages.hoogle
    ];

    extraPlugins = with pkgs.vimPlugins; [
      telescope_hoogle
    ];

    imports = [
      ./nvim/options.nix
      ./nvim/colorschemes.nix
      ./nvim/keymaps.nix
      ./nvim/lsp.nix
      ./nvim/plugins
    ];
  };
}
