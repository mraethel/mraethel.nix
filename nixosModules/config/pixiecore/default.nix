{
  mraethel,
  ...
}:
let
  builderConfig =
    mraethel.nixosConfigurations.builder.config.system.build.images.netboot.passthru.config.system.build;
in
{
  services.pixiecore = {
    cmdLine = "init=${builderConfig.toplevel}/init";
    dhcpNoBind = true;
    enable = true;
    initrd = "${builderConfig.netbootRamdisk}/initrd";
    kernel = "${builderConfig.kernel}/${builderConfig.kernel.target}";
    openFirewall = true;
  };
}
