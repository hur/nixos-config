{ config, pkgs, ... }: {
  imports = [
    ./hardware/vm-intel.nix
    ./vm-shared.nix
  ];

  virtualisation.vmware.guest.enable = true;
  services.xserver.videoDrivers = [ "vmware" ];
  
  # Interface is this on Intel Fusion
  networking.interfaces.ens33.useDHCP = true;

  # Shared folder to host works on Intel
  #fileSystems."/host" = {
  #  fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
  #  device = ".host:/";
  #  options = [
  #    "umask=22"
  #    "uid=1000"
  #    "gid=1000"
  #    "allow_other"
  #    "auto_unmount"
  #    "defaults"
  #  ];
  #};
}
