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
      unzip
      kitty
      ranger
      catppuccinifier-cli
      wget
      pfetch
      ripgrep
      nodejs
      home-manager
      texliveFull


      libsForQt5.kwallet
      libsForQt5.ksshaskpass
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
      hyprshot

      #guis
      vesktop
      firefox
      ungoogled-chromium
      vscodium
      gimp
      spotify
      obs-studio
      mpv
      imv
      obsidian
      stremio

      # arduino
      arduino-ide
      arduino-cli
    ];
  }
