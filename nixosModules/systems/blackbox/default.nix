{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e98fa073-4ade-4a81-94f0-ba8961288f99";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/38cddcc8-2e37-4e56-a613-20e907658d94";
      fsType = "ext4";
    };
  };
  boot.loader.grub.device = "/dev/sda";
  networking.hostName = "blackbox";
  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "ehci_pci"
      "firewire_ohci"
      "nvme"
      "ohci_pci"
      "sd_mod"
      "sr_mod"
      "usb_storage"
      "usbhid"
      "xhci_pci"
    ];
    kernelModules = [ "kvm-amd" ];
  };
  system.stateVersion = "23.11";
  time.timeZone = "Europe/Berlin";
}
