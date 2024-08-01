{
  kernelModules = [ "dm-snapshot" ];
  availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "virtio_pci"
    "virtio_net"
    "sr_mod"
    "virtio_blk"
  ];
}
