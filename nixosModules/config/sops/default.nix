{
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_sops_ed25519_key" ];
    secrets.github_pat = { };
  };
  services.openssh.hostKeys = [{
    path = "/etc/ssh/ssh_sops_ed25519_key";
    type = "ed25519";
  }];
  programs.sops.enable = true;
}
