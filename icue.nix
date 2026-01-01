{
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      openlinkhub = {
	image = "ghcr.io/jurkovic-nikola/openlinkhub:0.7.4";
        autoStart = true;
	privileged = true;
	volumes = [ "/home/adrian/dotfiles/openlinkhub/config.json:/opt/OpenLinkHub/config.json" ];
	networks = [ "host" ];
      };
    };
  };
}
