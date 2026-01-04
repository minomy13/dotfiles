{ lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
    };

    keymaps = [
      { action = "<cmd>echo \"cock\"<CR>"; key = "<leader>c"; options.desc = "Says cock!"; }
      { action = "<Esc>"; key = "jj"; mode = [ "i" "t" ]; options.desc = "Exit insert mode"; }
    ];

    plugins = {
      bufferline.enable = true;
      noice.enable = true;
      blink-cmp.enable = true;
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
    };
  };
}
