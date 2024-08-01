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
  network = {
    enable = true;
    ssh = {
      enable = true;
      shell = "/bin/cryptsetup-askpass";
      authorizedKeyFiles = [ ./authorized_keys ];
      hostKeys = [ "/etc/ssh/ssh_initrd_ed25519_key" ];
    };
  };
}
