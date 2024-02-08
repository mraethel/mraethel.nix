{
  services.tor = {
    enable = true;
    client.enable = true;
    controlSocket.enable = true;
    settings = {
      EntryNodes = "{de}";
      ExitNodes = "{de}";
    };
  };
}
