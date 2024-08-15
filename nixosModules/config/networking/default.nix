{
  networking,
  ...
}: {
  inherit networking;
  services.resolved.enable = true;
}
