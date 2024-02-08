{
  hostName,
  ...
}: {
  networking.hostName = hostName;
  services.resolved.enable = true;
}
