{
  grubDevice,
  ...
}: {
  boot.loader.grub = {
    enable = true;
    device = grubDevice;
  };
}
