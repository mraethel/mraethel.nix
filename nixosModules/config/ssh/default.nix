{
  programs.ssh = {
    hosts = {
      mraethel = {
        order = 300;
        HostName = "mraethel.de";
        HostKeyAlias = "mraethel";
        User = "user";
      };
      mraetheluks = {
        order = 200;
        AddressFamily = "inet";
        HostName = "mraethel.de";
        HostKeyAlias = "mraetheluks";
        User = "root";
      };
      "*" = {
        order = 100;
        IdentitiesOnly = true;
      };
    };
    knownHosts = {
      mraethel.publicKeyFile = knownHosts/mraethel;
      mraetheluks.publicKeyFile = knownHosts/mraetheluks;
    };
  };
}
