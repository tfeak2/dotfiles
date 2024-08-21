{ pkgs, inputs, ... }:

{
  imports = [
    ./packages.nix

    inputs.homeManager.nixosModules.default
    inputs.catppuccin.nixosModules.catppuccin
    inputs.spicetify.nixosModules.default
  ];

  #define users
  users.users.tfeak2 = {
    isNormalUser = true;
    description = "Tyson Feakes";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    useDefaultShell = true;
  };

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #enviroment settings
  services.displayManager.sddm = { enable = true; catppuccin.enable = true; };
  services.desktopManager.plasma6.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  #catppuccin globals
  catppuccin.accent = "blue";
  catppuccin.flavor = "mocha";

  console.catppuccin.enable = true;

  #import homeManager
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    users.tfeak2 = {
      imports = [ inputs.catppuccin.homeManagerModules.catppuccin inputs.nixvim.homeManagerModules.nixvim inputs.spicetify.homeManagerModules.default ./home/home.nix ];
    };
  };

  system.stateVersion = "24.05";

}
