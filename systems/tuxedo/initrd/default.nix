{
  availableKernelModules = [
    "ahci"
    "nvme"
    "rtsx_usb_sdmmc"
    "sd_mod"
    "usb_storage"
    "xhci_pci"
  ];
  luks.devices.cryptroot.crypttabExtraOpts = [ "fido2_device=auto" ];
  systemd.enable = true;
}
