{ packageOverrides = pkgs: {
    haskellPackages = pkgs.haskellPackages.override {
      overrides = haskellPackagesNew: haskellPackagesOld: {
        laurus-nobilis = (import ./default.nix {}).laurus-nobilis.components.exes.laurus-nobilis;
        # laurus-nobilis = pkgs.haskell.lib.justStaticExecutables (
          #   (import ~/src/laurus-nobilis/stack2nix.nix {
        #             pkgs = (import <nixpkgs> {});
        #             compiler = pkgs.haskell.packages.ghc844;
        #           }).laurus-nobilis
        # );
      };
    };
    configuration-files-aanalyzer = pkgs.runCommand "staticFilesAanalyzer" { src = ./.; } ''
      mkdir -p $out/config
      mkdir -p $out/static
      cp -R $src/config $out/
      cp -R $src/static $out/
    '';
    # msmtp-etc = pkgs.runCommand "msmtpFiles" { src = ./.; } ''
    #   mkdir -p $out
    #   mkdir -p /etc/msmtp
    #   cp $src/laurus-msmtp /etc/msmtp/laurus-msmtp
    #   chmod 600 /etc/msmtp/laurus-msmtp
    #   echo "msmtp-etc succesful!"
    # '';
  };
}
