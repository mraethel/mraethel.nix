{
  "/" = {
    device = "/dev/disk/by-uuid/74104af6-e987-4e20-8d43-37cfcd7d2325";
    fsType = "ext4";
  };
  "/boot" = {
    device = "/dev/disk/by-uuid/A4E4-40F1";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
}
