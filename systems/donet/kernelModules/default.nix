{
  initrd = {
    kernelModules = [ "dm-snapshot" ];
    availableKernelModules = [
      "ata_piix"
      "uhci_hcd"
      "virtio_pci"
      "sr_mod"
      "virtio_blk"
    ];
  };
}
