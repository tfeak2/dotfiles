{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    lutris
  ];
  environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATH = "~/.steam/root/compatibilitytools.d";
}
