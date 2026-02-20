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
      packages =
        let
          tree = (inputs.import-tree.new.addPath ../packages).leafs.withLib lib;
        in
        lib.listToAttrs (
          map (file: {
            name = lib.removeSuffix ".nix" (baseNameOf file);
            value = pkgs.callPackage file { };
          }) tree.result
        );
      apps =
        lib.mapAttrs
          (name: pkg: {
            type = "app";
            program = lib.getExe pkg;
            meta = pkg.meta;
          })
          (
            lib.filterAttrs (
              name: pkg: (pkg ? meta.mainProgram) || (builtins.pathExists "${pkg}/bin")
            ) self'.packages
          );
    };
}
