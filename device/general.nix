{pkgs, ...}:
{
  #bootloader
  networking.hostName = "nixos";

  #enable networking
  networking.networkmanager.enable = true;
  services.resolved.enable = true;
  

  #time zone
  time.timeZone = "Australia/Brisbane";

  #internationalisation properties
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode"];})
  ];

  #enable x11
  services.xserver.enable = true;

  #portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.xserver.desktopManager.xterm.enable = false;


  #x11 keymap
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  #services
  services.printing = {
    enable = true;
    drivers = [ pkgs.cups-brother-hl1110 ];
  }; 
}
