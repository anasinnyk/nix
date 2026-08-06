{
  plugins.conform-nvim = {
    enable = true;

    autoInstall.enable = true;

    settings = {
      notify_on_error = false;

      formatters_by_ft = {
        lua = [ "stylua" ];
      };

      format_on_save = ''
        function(bufnr)
          if vim.g.disable_autoformat
              or vim.b[bufnr].disable_autoformat
          then
            return
          end

          return {
            timeout_ms = 300,
            lsp_format = "fallback",
          }
        end
      '';
    };
  };
}
