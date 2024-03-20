{
  config,
  ...
}: let
  sshKey = rec {
    path = "/etc/ssh/ssh_sops_${ type }_key";
    type = "ed25519";
  };
in {
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    age.sshKeyPaths = [ sshKey.path ];
    secrets = {
      "nix/pat" = { };
      "nixos/pat" = { owner = config.users.users.nixos.name; };
    };
  };
  services.openssh.hostKeys = [{ inherit (sshKey) path type; }];
  programs.sops.enable = true;
}
