{
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "rtsx_usb_sdmmc"
        "sd_mod"
        "usb_storage"
        "xhci_pci"
      ];
      luks.devices.cryptroot.device = "/dev/disk/by-uuid/33f12d05-280b-4e5e-93d8-0ecc63b7f99c";
    };
    kernelModules = [ "kvm-amd" ];
  };
}
