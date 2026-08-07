{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    gopls
    lua-language-server
    nil
    yaml-language-server
  ];

  lsp = {
    inlayHints.enable = true;
    servers = {
      gopls = {
        enable = true;
        config = {
          cmd = [ "gopls" ];
          filetypes = [
            "go"
            "gomod"
            "gowork"
          ];
          root_markers = [
            "go.mod"
            "go.work"
          ];
          settings.gopls.analyses = {
            completeUnimported = true;
            usePlaceholders = true;
            unusedparams = true;
            unusedvariable = true;
            shadow = true;
          };
        };
      };
      luals = {
        enable = true;
        config = {
          cmd = [ "lua-language-server" ];
          filetypes = [ "lua" ];
          root_markers = [
            ".luarc.json"
            "luarc.jsonc"
          ];
          settings.Lua = {
            workspace.library = [
              "${pkgs.hyprland}/share/hypr/stubs"
            ];
            diagnostics.globals = [
              "vim"
              "hl"
            ];
          };
        };
      };
      nil = {
        enable = true;
        config = {
          cmd = [ "nil" ];
          filetypes = [ "nix" ];
          root_markers = [ "flake.nix" ];
        };
      };
      phpactor = {
        enable = true;
        config = {
          cmd = [ "phpactor" ];
          filetypes = [ "php" ];
          root_markers = [ "composer.json" ];
        };
      };
      ts_ls = {
        enable = true;
        config = {
          cmd = [
            "typescript-language-server"
            "--stdio"
          ];
          filetypes = [
            "typescript"
            "typescriptreact"
            "javascript"
            "javascriptreact"
          ];
          root_markers = [ "package.json" ];
        };
      };
      yamlls = {
        enable = true;
        config = {
          cmd = [
            "yaml-language-server"
            "--stdio"
          ];
          filetypes = [
            "yaml"
            "json"
          ];
          settings.yaml = {
            schemaDownload.enable = true;
            validates = true;
            format.enable = true;
            hover = true;
            completion = true;
          };
        };
      };
      rust_analyzer = {
        enable = true;
        config = {
          cmd = [ "rust-analyzer" ];
          filetypes = [ "rust" ];
          root_markers = [ "Cargo.toml" ];
          settings.rust_analizer = {
            cargo.allFeatures = true;
            completion.snippets = "add_parenthesis";
          };
        };
      };
    };
  };
}
