{
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "ehci_pci"
        "firewire_ohci"
        "nvme"
        "ohci_pci"
        "sd_mod"
        "sr_mod"
        "usb_hid"
        "usb_storage"
        "xhci_pci"
      ];
    };
    kernelModules = [ "kvm-amd" ];
  };
}
