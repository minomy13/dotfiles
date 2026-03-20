{ ... }:
{
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      openlinkhub = {
        image = "ghcr.io/jurkovic-nikola/openlinkhub:0.7.4";
        autoStart = true;
        privileged = true;
        volumes = [
          "/home/adrian/.config/openlinkhub.json:/opt/OpenLinkHub/config.json"
          "icue:/opt/OpenLinkHub/database"
        ];
        networks = [ "host" ];
      };
    };
  };

  hm.home.file.".config/openlinkhub.json".source = ./config.json;
}
