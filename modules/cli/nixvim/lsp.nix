{ ... }:
{
  programs.nixvim.plugins = {
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
        qmlls.enable = true;
        astro.enable = true;

        hls = {
          enable = true;
          installGhc = true;
        };

        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
    };
  };
}
