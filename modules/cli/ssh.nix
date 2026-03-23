{ ... }:
let
  onePassPath = "~/.1password/agent.sock";
in
{
  hm.programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ${onePassPath}
    '';
  };
}
