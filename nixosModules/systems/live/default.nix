{
  lib,
  nixpkgs,
  ...
}:
{
  image.modules = rec {
    default = {
      imports = [ "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-base.nix" ];
      installer.cloneConfig = false;
      isoImage.appendToMenuLabel = " Live System";
    };
    "aarch64-linux" = default // {
      nixpkgs.hostPlatform = "aarch64-linux";
    };
    "x86_64-linux" = default // {
      nixpkgs.hostPlatform = "x86_64-linux";
    };
  };
  networking.networkmanager.enable = lib.mkForce false;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  systemd.network.networks = {
    "ether" = {
      matchConfig.Type = "ether";
      networkConfig.DHCP = true;
    };
    "wlan" = {
      matchConfig.Type = "wlan";
      networkConfig.DHCP = true;
    };
  };
  users.users.nixos.openssh.authorizedKeys.keyFiles = [ "${./ssh_nixos_ed25519_key.pub}" ];
}
