{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = import ./catppuccin-mocha;
    };
  };
}
