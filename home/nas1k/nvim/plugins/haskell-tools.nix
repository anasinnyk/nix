{
  # plugins.nvim-ufo.enable = true;
  plugins.haskell-tools = {
    enable = true;

    autoLoad = true;

    settings = {
      hls = {
        on_attach.__raw = ''
          function(_, bufnr, ht)
            local function map(key, action, description)
              vim.keymap.set("n", key, action, {
                buffer = bufnr,
                desc = description,
                noremap = true,
                silent = true,
              })
            end

            map(
              "<space>cl",
              vim.lsp.codelens.run,
              "Code Lens"
            )

            map(
              "<leader>hs",
              ht.hoogle.hoogle_signature,
              "Hoogle Signature"
            )

            map(
              "<leader>ea",
              ht.lsp.buf_eval_all,
              "Evaluate All"
            )

            map(
              "<leader>rr",
              ht.repl.toggle,
              "Toggle Repl Package"
            )

            map(
              "<leader>rf",
              function()
                ht.repl.toggle(vim.api.nvim_buf_get_name(0))
              end,
              "Toggle Repl Buffer"
            )

            map(
              "<leader>rq",
              ht.repl.quit,
              "Quit Repl"
            )
          end
        '';
      };
    };
  };
}
