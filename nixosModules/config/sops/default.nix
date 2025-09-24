{
  config,
  ...
}:
let
  sshKey = rec {
    path = "/etc/ssh/ssh_sops_${type}_key";
    type = "ed25519";
  };
in
{
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    age.sshKeyPaths = [ sshKey.path ];
    secrets = {
      "nix/pat" = { };
      "nixos/pat" = {
        owner = config.users.users.nixos.name;
      };
      "aichat/config.yaml" = {
        group = config.users.groups.users.name;
      };
      "mailserver/mail@mraethel.de" = { };
      "mailserver/vault@mraethel.de" = { };
    };
  };
  services.openssh.hostKeys = [ sshKey ];
  programs.sops.enable = true;
}
