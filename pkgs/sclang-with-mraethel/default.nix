{
  supercollider,
  startupFile,
  writeShellApplication,
}:
writeShellApplication {
  name = "sclang-with-mraethel";
  runtimeInputs = [ supercollider ];
  text = "sclang ${startupFile}";
}
