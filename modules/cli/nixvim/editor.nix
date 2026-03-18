{ ... }:
{
  programs.nixvim.plugins = {
    telescope.enable = true;

    which-key = {
      enable = true;
      settings = {
        preset = "helix";
        spec = [
          {
            __unkeyed-1 = "<leader><c>";
            group = "code";
          }
        ];
      };
    };

    # FIX doesn't work
    todo-comments.enable = true;

    neo-tree = {
      enable = true;
      settings = {
        sources = [
          "filesystem"
          "buffers"
          "git_status"
        ];
        open_files_do_not_replace_types = [
          "terminal"
          "Trouble"
          "trouble"
          "qf"
          "Outline"
        ];
        filesystem = {
          bind_to_cwd = false;
          follow_current_file = {
            enabled = true;
          };
          use_libuv_file_watcher = true;
        };
        window = {
          mappings = {
            "l" = "open";
            "h" = "close_node";
            "<space>" = "none";
          };
        };
        default_component_configs = {
          with_expanders = true;
          expander_collapsed = "";
          expander_expanded = "";
          expander_highlight = "NeoTreeExpander";
        };
        git_status = {
          symbols = {
            unstaged = "󰄱";
            staged = "󰱒";
          };
        };
      };
    };
  };
}
