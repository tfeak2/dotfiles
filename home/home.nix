{ lib, pkgs, ... }:

{
  imports = [ ./neovim.nix ./spotify.nix ];
  home.username = "tfeak2";
  home.homeDirectory = "/home/tfeak2";

  home.stateVersion = "23.11";
  home.packages = [
  
  ];

  home.file = {
    ".config/hypr" = { source = ./hypr; recursive = true; };
    ".config/waybar" = { source = ./waybar; recursive = true; };
    ".config/wofi" = { source = ./wofi; recursive = true; };
    ".config/ranger" = { source = ./ranger; recursive = true; };
  };

  home.sessionVariables = {
	  EDITOR = "nvim";
    SSH_ASKPASS = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
    GIT_ASKPASS = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
  };

  catppuccin.accent = "blue";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      flake = "sudo nixos-rebuild switch --flake";
      nix-shell = "nix-shell --run zsh";
    };

  };

  programs.starship = {
    enable = true;
    catppuccin.enable = true;
    settings = lib.mkMerge [(builtins.fromTOML (builtins.readFile ./starshipNerdFonts.toml))
    {
      add_newline = true;
      format = "$all";
      username = {
        style_user = "bright-white bold";
        style_root = "red bold";
	      show_always = true;
	      format = "[$user]($style)[@](green bold)";
      };
      hostname = {
        ssh_only = false;
	      style = "sky bold";
      };

    }];

  };

  programs.git = {
    enable = true;
    userName = "tfeak2";
    userEmail = "tfeak2@outlook.com";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

#  programs.firefox = {
#    enable = true;
#    profiles.main = {
#      extensions = with inputs.firefox-addons.packages.x86_64-linux; [
#        ublock-origin
#      ];
#    };
#  };

#  catppuccin.pointerCursor.enable = true;
  gtk = {enable = true; catppuccin.enable = true;};
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
    style.catppuccin.enable = true;
    style.catppuccin.apply = true;
  };

  services.mako = {
    enable = true;
    catppuccin.enable = true;
    borderRadius = 10;
    borderSize = 2;
    width = 400;
    height = 150;
  };

  programs.kitty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };
  programs.imv = {enable = true; catppuccin.enable = true;};
  programs.mpv = {enable = true; catppuccin.enable = true;};
  programs.swaylock = {enable = true; catppuccin.enable = true;};
  programs.zathura = {enable = true; catppuccin.enable = true;};
  programs.btop = {enable = true; catppuccin.enable = true;};
  programs.lazygit = {enable = true; catppuccin.enable = true;};
  programs.cava = {enable = true; catppuccin.enable = true;};


  programs.home-manager.enable = true;
}
