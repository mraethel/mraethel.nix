{
  config,
  ...
}: {
  sops.secrets."sbmr/pem" = {
    sopsFile = ../../../../secrets/users/sbmr.yaml;
    owner = config.users.users.sbmr.name;
  };
}
