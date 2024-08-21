{pkgs, inputs, ...}:
let
 spicePkgs = inputs.spicetify.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = false;
    #theme = spicePkgs.themes.catppuccin;
    #colorScheme = "mocha";
  };
}
