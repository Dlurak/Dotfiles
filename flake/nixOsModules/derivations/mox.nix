{
  pkgs,
  inputs,
  ...
}:
(pkgs.writeShellApplication {
  name = "mox";
  runtimeInputs = [
    inputs.moxide.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.fzf
  ];
  text = builtins.readFile ../customScripts/mox.sh;
})
