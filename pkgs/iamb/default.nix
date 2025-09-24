{
  symlinkJoin,
  iamb,
  lib,
  confFile ? null,
  makeWrapper,
}:
symlinkJoin {
  name = "iamb-wrapped";
  paths = [ iamb ];
  buildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/iamb
      ${lib.optional (!builtins.isNull confFile) ''--add-flags "-c ${confFile}"''}
  '';
}
