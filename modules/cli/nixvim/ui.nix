{ ... }:
{
  programs.nixvim.plugins = {
    web-devicons.enable = true;

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

    programs.nixvim.plugins.snacks = {
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
  };
}
