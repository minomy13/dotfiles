{ lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catpuccin.enable = true;

    globals = {
      mapleader = " ";
    };

    keymaps = [
      { action = "<cmd>echo \"cock\"<CR>"; key = "<leader>cc"; options.desc = "Says cock!"; }
      { action = "<Esc>"; key = "jj"; mode = [ "i" "t" ]; options.desc = "Exit insert mode"; }
    ];

    plugins = {
      bufferline.enable = true;
      noice.enable = true;
      web-devicons.enable = true;

      blink-cmp = {
        enable = true;
	setupLspCapabilities = true;
	settings = {
          keymap.preset = "default";
	  signature.enabled = true;
	  sources.default = [ "buffer" "lsp" "path" "snippets" ];
	};
      };

      neo-tree.enable = true;

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
      };

      snacks = {
        enable = true;
      };

      lsp-format.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;

	servers = {
	  nixd.enable = true;

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
