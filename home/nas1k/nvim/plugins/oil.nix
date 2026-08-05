{
  plugins.grug-far.enable = true;
  plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
      skip_confirm_for_simple_edits = true;
      view_options = {
        show_hidden = true;
        is_always_hidden.__raw = ''
          function(name)
            return name == ".git"
                or name == ".devenv"
                or name == ".."
          end
        '';
      };
      keymaps = {
        "gs" = {
          desc = "oil: Search in directory";
          callback.__raw = ''
            function()
              local oil = require("oil")
              local prefills = { paths = oil.get_current_dir() }
              local grug_far = require("grug-far")

              if not grug_far.has_instance("explorer") then
                grug_far.open({
                  instanceName = "explorer",
                  prefills = prefills,
                  staticTitle = "Find and Replace from Explorer",
                })
              else
                grug_far.open_instance("explorer")
                grug_far.update_instance_prefills("explorer", prefills, false)
              end
            end
          '';
        };
      };
    };
  };
}
