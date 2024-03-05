{
  imports = [
    ./home-manager
    ./sops
  ];

  users.users.sbmr = {
    isNormalUser = true;
    extraGroups = [ "keys" ];
  };
}
