{ ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = ["/dev/sdb"];
  boot.loader.grub.useOSProber = true;
  boot.supportedFilesystems = [ "ntfs" ];
}
