{
  "/" = {
    device = "/dev/disk/by-uuid/37b5eb0a-aec1-4836-b3fd-0f27bdd010c8";
    fsType = "ext4";
  };
  "/boot" = {
    device = "/dev/disk/by-uuid/C6DC-F881";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
}
