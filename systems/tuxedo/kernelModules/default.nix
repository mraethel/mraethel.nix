{
  kernelModules = [ "kvm-amd" ];
  initrd.availableKernelModules = [
    "ahci"
    "nvme"
    "rtsx_usb_sdmmc"
    "sd_mod"
    "usb_storage"
    "xhci_pci"
  ];
}
