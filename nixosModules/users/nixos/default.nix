{
  imports = [
    ./git
    ./home-manager
  ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [
      "keys"
      "wheel"
    ];
  };
}
