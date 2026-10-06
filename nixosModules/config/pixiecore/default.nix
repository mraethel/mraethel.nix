{
  mraethel,
  ...
}:
let
  builderConfig =
    mraethel.nixosConfigurations.builder.config.system.build.images.netboot.passthru.config.system.build;
  builderTarget =
    mraethel.nixosConfigurations.builder.config.system.build.images.netboot.stdenv.hostPlatform.linux-kernel.target;
in
{
  services.pixiecore = {
    cmdLine = "init=${builderConfig.toplevel}/init";
    dhcpNoBind = true;
    enable = true;
    initrd = "${builderConfig.netbootRamdisk}/initrd";
    kernel = "${builderConfig.kernel}/${builderTarget}";
    openFirewall = true;
  };
}
