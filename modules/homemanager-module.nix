{ self, ... }:

{
  flake.homeModules.default =
    { ... }:
    {
      nix.registry.substratum.flake = self;
    };
}
