{ self, ... }:

{
  flake.nixosModules.default =
    { ... }:
    {
      nix.registry.substratum.flake = self;
    };
}
