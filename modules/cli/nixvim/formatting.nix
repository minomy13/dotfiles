{ ... }:
{
  programs.nixvim.plugins.conform-nvim = {
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
}
