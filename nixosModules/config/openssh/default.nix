{ lib, config, ... }:
{
  services.openssh = {
    enable = true;
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
      (lib.mkIf config.boot.initrd.network.ssh.enable {
        path = "/etc/ssh/ssh_initrd_ed25519_key";
        type = "ed25519";
      })
    ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
