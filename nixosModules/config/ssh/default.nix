{
  programs.ssh = {
    knownHosts = {
      mraethel.publicKeyFile = knownHosts/mraethel;
      mraetheluks.publicKeyFile = knownHosts/mraetheluks;
    };
    hosts = {
      mraethel = {
        HostName = "mraethel.de";
        HostKeyAlias = "mraethel";
        User = "user";
      };
      mraetheluks = {
        HostName = "mraethel.de";
        HostKeyAlias = "mraetheluks";
        User = "root";
      };
      "*".IdentitiesOnly = true;
    };
  };
}
