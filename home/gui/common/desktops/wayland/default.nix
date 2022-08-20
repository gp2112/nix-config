{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wf-recorder
    wl-clipboard
    wl-mirror
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = true;
    QT_QPA_PLATFORM = "wayland";
  };

}
