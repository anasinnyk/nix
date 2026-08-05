{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      ai.n_lines = 500;
      surround = { };
      move = { };
      splitjoin = { };
      icons = { };
      statusline.use_icons.__raw = "vim.g.have_nerd_font";
    };
  };

  extraConfigLua = ''
    MiniIcons.tweak_lsp_kind("replace")

    require("mini.statusline").section_location = function()
      return "%2l:%-2v"
    end
  '';
}
