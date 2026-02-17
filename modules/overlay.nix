{ self, ... }:

{
  flake.overlays.default = final: prev: {
    substratum = self.packages.${final.system};
  };
}
