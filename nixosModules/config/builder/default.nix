{
  nix.settings.trusted-public-keys = [ "builder:ZdbLN5qApRGS8qtb0lKyp3wwv/8/Leeo7ZYcF0nEBq4=" ];
  sops.secrets = {
    "builder/ssh_sops_ed25519_key".sopsFile = ./secrets.yaml;
    "builder/ssh_builder_ed25519_key".sopsFile = ./secrets.yaml;
    "builder/ssh_nixos_ed25519_key".sopsFile = ./secrets.yaml;
  };
  users.groups."builder" = { };
}
