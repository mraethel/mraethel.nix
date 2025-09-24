{
  config,
  initrd,
  lib,
  ...
}:
{
  boot.initrd = initrd;

  services.openssh.hostKeys = lib.mkIf config.boot.initrd.network.ssh.enable [
    {
      path = "/etc/ssh/ssh_initrd_ed25519_key";
      type = "ed25519";
    }
  ];
}
