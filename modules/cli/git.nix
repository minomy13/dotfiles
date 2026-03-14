{ ... }:
{
  hm.programs.git = {
    enable = true;
    settings = {
      user = {
        name = "minomy13";
        email = "mail@minomy13.com";
      };
      init.defaultBranch = "main";
    };
  };
}
