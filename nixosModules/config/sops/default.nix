let
  sshKey = rec {
    path = "/etc/ssh/ssh_sops_${ type }_key";
    type = "ed25519";
  };
in {
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    age.sshKeyPaths = [ sshKey.path ];
    secrets.github_pat = { };
  };
  services.openssh.hostKeys = [{ inherit (sshKey) path type; }];
  programs.sops.enable = true;
}
