{
  grubDevice,
  ...
}:
{
  boot.loader = {
    grub = {
      enable = true;
      device = grubDevice;
    };
    timeout = 0;
  };
}
