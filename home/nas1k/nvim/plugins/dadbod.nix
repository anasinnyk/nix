{
  plugins = {
    vim-dadbod.enable = true;
    vim-dadbod-ui.enable = true;
    vim-dadbod-completion.enable = true;
  };

  globals.db_ui_use_nerd_fonts = 1;

  keymaps = [
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>DBUIToggle<cr>";
      options.desc = "[T]oggle [D]atabases";
    }
  ];
}
