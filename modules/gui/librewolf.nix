{ ... }:
{
  hm.programs.librewolf = {
    enable = true;

    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };

    policies = {
      BlockAboutConfig = true;
      ExtensionSettings = {
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
  };
}
