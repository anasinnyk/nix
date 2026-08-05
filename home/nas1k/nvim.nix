{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins.lz-n.enable = true;

    imports = [
      ./nvim/options.nix
      ./nvim/keymaps.nix
      ./nvim/lsp.nix
      ./nvim/plugins
    ];
  };
}
