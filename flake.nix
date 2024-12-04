{
  description = "System config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    homeManager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    catppuccin = { url = "github:catppuccin/nix"; };
    nixvim = { url = "github:nix-community/nixvim"; inputs.nixpkgs.follows = "nixpkgs"; };
    spicetify = { url = "github:the-argus/spicetify-nix"; inputs.nixpkgs.follows = "nixpkgs"; };
    #firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    system = "x86_64-linux";
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [./configuration.nix ./hardware/pc.nix ./device/nvidia.nix ./device/general.nix ./device/audio.nix ./device/pc.nix ./modules/games.nix ];
    };
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [./configuration.nix ./hardware/laptop.nix ./device/general.nix ./device/audio.nix ./device/laptop.nix];
    };

  };
}
