{ ... }:
{
  programs.nixvim.keymaps = [
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

    # lsp
    {
      mode = [ "n" ];
      key = "<leader>cd";
      action = "<cmd>lua vim.diagnostic.open_float()<cr>";
      options.desc = "Show Line Diagnostics";
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
      mode = [ "i" ];
      key = "jj";
      action = "<Esc>";
      options.desc = "Exit insert mode";
    }
    {
      mode = [ "t" ];
      key = "jj";
      action = ''<C-\><C-n>'';
      options.desc = "Exit terminal mode";
    }
    {
      mode = [ "n" ];
      key = "<leader>t";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Toggle file tree";
        remap = true;
      };
    }
  ];

}
