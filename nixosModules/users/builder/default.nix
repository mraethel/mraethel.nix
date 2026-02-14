{
  config,
  ...
}:
{
  nix.settings.trusted-users = [ "${config.users.users.builder.name}" ];
  users.users.builder = {
    isNormalUser = true;
    openssh.authorizedKeys.keyFiles = [ "${./ssh_builder_ed25519_key.pub}" ];
  };
}
