{ pkgs, ... }:

{

  services.minecraft-server = {
    enable = true;
    openFirewall = true;
    eula = true;
    declarative = true;

    serverProperties = {
      allow-flight = true;
      difficulty = 2;
      online-mode = false;
      enable-rcon = true;
      "rcon.password" = "admin";
    };
  };
}
