{
  hostName = "donet";
  domain = "mraethel.de";
  useDHCP = false;
  interfaces.ens3 = {
    ipv4.addresses = [{
      address = "193.26.159.48";
      prefixLength = 22;
    }];
    ipv6.addresses = [{
      address = "2a03:4000:4c:f3::1";
      prefixLength = 64;
    }];
  };
  defaultGateway = {
    address = "193.26.156.1";
    interface = "ens3";
  };
  defaultGateway6 = {
    address = "fe80::1";
    interface = "ens3";
  };
}
