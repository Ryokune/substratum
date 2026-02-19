{ self, ... }:

{
  flake.overlays.default = final: prev: {
    substratum = self.packages.${final.stdenv.hostPlatform.system};
  };
}
