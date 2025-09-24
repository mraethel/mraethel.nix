{
  config,
  lib,
  self,
  system,
  ...
}:
let
  cfg = config.programs.pianoteq;
in
{
  options.programs.pianoteq = {
    enable = lib.mkEnableOption "pianoteq";
    package = lib.mkPackageOption self.packages.${system} "pianoteq" {
      extraDescription = ''
        This option expects you to define packages.<system>.pianoteq in your flake!
        To use this flake's package you can define:
          packages."x86_64-linux".pianoteq = mraethel.packages."x86_64-linux".pianoteq <src>;
        with <src> being a relative path to your pianoteq_stage_linux_<version>.7z archive.
      '';
    };
  };

  config.environment.systemPackages = lib.mkIf cfg.enable [ cfg.package ];
}
