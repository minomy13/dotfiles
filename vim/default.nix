{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    extraPackages = with pkgs; [
      nixfmt
      rustfmt
      prettier
    ];

    colorschemes.dracula.enable = true;

    globals = {
      mapleader = " ";
    };

    keymaps = [
      # todo-comments
      {
        key = "]t";
        action = ''<cmd>lua require("todo-comments").jump_next()<CR>'';
        options.desc = "Next Todo Comment";
      }
      {
        key = "[t";
        action = ''<cmd>lua require("todo-comments").jump_prev()<CR>'';
        options.desc = "Previous Todo Comment";
      }

      # easteregg
      {
        key = "<leader>cc";
        action = "<cmd>echo \"cock\"<CR>";
        options.desc = "Says cock!";
      }

      # buffers
      {
        mode = [ "n" ];
        key = "<S-h>";
        action = "<cmd>bprevious<cr>";
        options.desc = "Prev Buffer";
      }
      {
        mode = [ "n" ];
        key = "<S-l>";
        action = "<cmd>bnext<cr>";
        options.desc = "Next buffer";
      }
      {
        mode = [ "n" ];
        key = "<leader>bb";
        action = "<cmd>e #<cr>";
        options.desc = "Switch to Other Buffer";
      }
      {
        mode = [ "n" ];
        key = "<leader>bd";
        action = "<cmd>lua Snacks.bufdelete()<cr>";
        options.desc = "Delete Buffer";
      }
      {
        mode = [ "n" ];
        key = "<leader>bo";
        action = "<cmd>lua Snacks.bufdelete.other()<cr>";
        options.desc = "Delete Other Buffers";
      }
      {
        mode = [ "n" ];
        key = "<leader>bD";
        action = "<cmd>:bd<cr>";
        options.desc = "Delete Buffer and Window";
      }

      # navigation
      {
        mode = [ "n" ];
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Go to Left Window";
          remap = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Go to Lower Window";
          remap = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Go to Upper Window";
          remap = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Go to Right Window";
          remap = true;
        };
      }

      # util
      {
        mode = [
          "i"
          "t"
        ];
        key = "jj";
        action = "<Esc>";
        options.desc = "Exit insert mode";
      }
    ];

    plugins = {
      web-devicons.enable = true;
      telescope.enable = true;
      # FIX doesn't work
      todo-comments.enable = true;

      bufferline = {
        enable = true;
        settings = {
          options = {
            always_show_bufferline = false;
            offsets = [
              {
                filetype = "neo-tree";
                text = "Neo-tree";
                highlight = "Directory";
                text_align = "left";
              }
              { filetype = "snacks_layout_box"; }
            ];
          };
        };
      };

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

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
            timeoutMs = 500;
          };
          notify_on_error = true;
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            rust = [ "rustfmt" ];
            html = [ "prettier" ];
            css = [ "prettier" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
          };
        };
      };

      noice = {
        enable = true;
        settings = {
          routes = [
            {
              filter = {
                event = "msg_show";
                any = [
                  { find = "%d+L, %d+B"; }
                  { find = "; after #%d+"; }
                  { find = "; before #%d+"; }
                ];
              };
              view = "mini";
            }
          ];
          presets = {
            "bottom_search" = true;
            "command_palette" = true;
            # FIX throws error if enabled
            #"long_message_split" = true;
          };
        };
      };

      blink-cmp = {
        enable = true;
        setupLspCapabilities = true;
        settings = {
          snippets.preset = "default";

          appearance = {
            use_nvim_cmp_as_default = false;
            nerd_font_variant = "mono";
          };

          completion = {
            accept.auto_brackets.enabled = true;
            menu.draw.treesitter = [ "lsp" ];
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 200;
            };
            ghost_text.enabled = true;
          };

          sources.default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];

          keymap = {
            preset = "enter";
            "<C-y>" = [ "select_and_accept" ];
          };
        };
      };

      mini-pairs = {
        enable = true;
        settings = {
          modes = {
            insert = true;
            command = true;
            terminal = true;
          };
          "skip_next" = ''[%w%%%'%[%"%.%`%$]'';
          "skip_ts" = [ "string" ];
          "skip_unbalanced" = true;
          markdown = true;
        };
      };

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

      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "auto";
            globalstatus = true;
            disabled_filetypes.statusline = [
              "dashboard"
              "alpha"
              "ministarter"
              "snacks_dashboard"
            ];
          };
          extensions = [ "neo-tree" ];
        };
      };

      snacks = {
        enable = true;
        settings = {
          notifier.enabled = true;
          dashboard = {
            enabled = true;
            preset = {
              header = ''
                	  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ 
                	  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ 
                	 ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ 
                	 ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  
                	 ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ 
                	 ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ 
                	 ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ 
                	    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    
                	          ░    ░  ░    ░ ░        ░   ░         ░    
                	                                 ░                   
                	      '';
            };
            sections = [
              { section = "header"; }
            ];
          };
        };
      };

      lsp-format.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;

        servers = {
          nixd.enable = true;
          svelte.enable = true;
          html.enable = true;
          tailwindcss.enable = true;
          ts_ls.enable = true;

          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };
    };
  };
}
