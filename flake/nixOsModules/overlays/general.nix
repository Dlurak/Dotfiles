{ inputs }:
final: prev: {
  ani-cli = prev.ani-cli.override {
    withVlc = true;
    withMpv = true;
  };
  fortune = prev.fortune.override { withOffensive = true; };
  moxide = inputs.moxide.packages.${final.system}.default;
}
