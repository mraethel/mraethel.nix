{
  config,
  mailserver,
  ...
}:
{
  mailserver = mailserver { inherit config; };
}
