{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wf-recorder
    wl-clipboard
    wl-mirror
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
  };


}
