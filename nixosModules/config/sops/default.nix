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
  };
  services.openssh.hostKeys = [ sshKey ];
  programs.sops.enable = true;
}
