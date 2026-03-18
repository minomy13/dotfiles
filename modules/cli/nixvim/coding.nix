{ ... }:
{
  programs.nixvim.plugins = {
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
  };
}
