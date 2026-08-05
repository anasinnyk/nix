{ pkgs, ... }:

{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "default";
        snippets.preset = "luasnip";
        appearance.nerd_font_variant = "mono";
        signature.enabled = true;
        sources = {
          default = [ "lsp" "path" "snippets" "buffer" ];
          providers = {
            lsp = {
              module = "blink.cmp.sources.lsp";
              name = "LSP";
              score_offset = 100;
            };
            dadbod = {
              module = "vim_dadbod_completion.blink";
              name = "DadBoD";
              score_offset = 100;
            };
            lazydev = {
              module = "lazydev.integrations.blink";
              name = "LazyDev";
              score_offset = 100;
            };
          };
        };
      };
    };

    friendly-snippets.enable = true;
    lazydev.enable = true;
    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    haskell-snippets-nvim
    vim-dadbod-completion
  ];

  extraConfigLua = ''
    local ls = require("luasnip")
    local hs_snip = require("haskell-snippets").all

    ls.add_snippets("haskell", hs_snip, { key = "haskell" })
  '';
}
