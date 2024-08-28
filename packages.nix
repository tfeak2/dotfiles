{ pkgs, ... }:
{
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
      #cli tools
      neovim
      git
      btop
      cava
      lazygit
      zsh
      kitty
      ranger
      catppuccinifier-cli
      wget
      pfetch
      ripgrep
      nodejs
      home-manager
      libsForQt5.qt5.qtwayland

      #wayland
      mako
      libnotify
      waybar
      wofi
      swww
      swaylock
      pavucontrol
      networkmanagerapplet

      #guis
      vesktop
      firefox
      vscodium
      gimp
      spotify
      obs-studio
      mpv
      imv
      obsidian
      stremio
    ];
  }
