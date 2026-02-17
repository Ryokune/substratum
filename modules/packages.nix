{ self, inputs, ... }:

{
  perSystem =
    {
      pkgs,
      lib,
      system,
      self',
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      packages = lib.listToAttrs (
        (((inputs.import-tree.new.addPath ../packages).leafs.withLib lib).map (file: {
          name = lib.removeSuffix ".nix" (baseNameOf file);
          value = pkgs.callPackage file { };
        })).result
      );
      apps = builtins.mapAttrs (name: pkg: {
        type = "app";
        program = "${pkg}/bin/${name}";
        meta = pkg.meta;
      }) self'.packages;
    };
}
