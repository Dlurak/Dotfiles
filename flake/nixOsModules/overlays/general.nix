{ inputs }:
final: prev: {
  ani-cli = prev.ani-cli.override {
    withVlc = true;
    withMpv = true;
  };
  fortune = prev.fortune.override { withOffensive = true; };
  moxide = inputs.moxide.defaultPackage.${final.system};
  komikku = prev.komikku.overrideAttrs (prevKomikku: {
    src = final.fetchFromGitea {
      domain = "codeberg.org";
      owner = "valos";
      repo = "Komikku";
      rev = "d8162dd8009313c90a9a42fbe4e5115be63a3d92";
      hash = "sha256-tMFH1xKsiIAwLsvd+onAlqvvXNnVoopNeb0J3gpHfp4=";
    };
  });
}
