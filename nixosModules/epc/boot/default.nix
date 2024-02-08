{
  boot = {
    initrd = {
      availableKernelModules = [
      ];
      luks.devices.cryptroot.device = "";
    };
    kernelModules = [ ];
  };
}
