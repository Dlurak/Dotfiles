{
  pkgs,
  inputs,
  ...
}:
(pkgs.writeShellApplication {
  name = "mox";
  runtimeInputs = [
    inputs.moxide.packages.${pkgs.system}.default
    pkgs.fzf
  ];
  text = builtins.readFile ../customScripts/mox.sh;
})
