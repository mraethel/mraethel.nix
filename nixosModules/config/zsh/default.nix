{
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    completion.specialDirs = true;
    p10k.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;
}
