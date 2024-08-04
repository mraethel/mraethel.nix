{
  programs.ssh = {
    knownHosts = {
      mraethel.publicKeyFile = knownHosts/mraethel;
      mraetheluks.publicKeyFile = knownHosts/mraetheluks;
    };
    extraConfig = ''
      Host mraethel
        HostName mraethel.de
        HostKeyAlias mraethel
        User user
      Host mraetheluks
        HostName mraethel.de
        HostKeyAlias mraetheluks
        User root
      Host *
        IdentitiesOnly yes
    '';
  };
}
