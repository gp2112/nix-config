{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    extraConfig = {
      init.defaultBranch = "main";

      commit.gpgsign = true;

      user = {
        signingkey = "43827E2886E5C34F38D577538C814D625FBD99D1";
        name = "gp2112";
        email = "me@guip.dev";
      };
    };

  };
}
