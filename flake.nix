{
  inputs = {
    homeManager.url = "github:nix-community/home-manager";

    musnix.url = "github:musnix/musnix";

    nixvim.url = "github:nix-community/nixvim";

    nixServeNG.url = "github:aristanetworks/nix-serve-ng";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    sops.url = "github:Mic92/sops-nix";

    supercollider.url = "github:mraethel/supercollider.nix";

    tidalcycles.url = "github:mitchmindtree/tidalcycles.nix";

    flakeUtils.url = "github:numtide/flake-utils";
    flakeUtils.inputs.systems.follows = "systems";
    systems.url = "github:nix-systems/x86_64-linux";
  };

  outputs = inputs @ {
    nixpkgs,
    self,
    homeManager,
    supercollider,
    tidalcycles,
    flakeUtils,
    ...
  }: rec {
    systems = {
      tuxedo = import systems/tuxedo;
      blackbox = import systems/blackbox;
      epc = import systems/epc;
    };
    nixosModules = {
      options = {
        alacritty = import nixosModules/options/alacritty;
        glirc = import nixosModules/options/glirc;
        iamb = import nixosModules/options/iamb;
        nix = import nixosModules/options/nix;
        pianoteq = import nixosModules/options/pianoteq;
        pipewire = import nixosModules/options/pipewire;
        ploopy = import nixosModules/options/ploopy;
        sops = import nixosModules/options/sops;
        ungoogled-chromium = import nixosModules/options/ungoogled-chromium;
        zsh = import nixosModules/options/zsh;
      };
      config = {
        alacritty = import nixosModules/config/alacritty;
        fileSystems = import nixosModules/config/fileSystems;
        glirc = import nixosModules/config/glirc;
        grub = import nixosModules/config/grub;
        home-manager = import nixosModules/config/home-manager;
        iamb = import nixosModules/config/iamb;
        kernelModules = import nixosModules/config/kernelModules;
        luksDevices = import nixosModules/config/luksDevices;
        musnix = import nixosModules/config/musnix;
        networking = import nixosModules/config/networking;
        nitrokey = import nixosModules/config/nitrokey;
        nix = import nixosModules/config/nix;
        nix-serve = import nixosModules/config/nix-serve;
        nixvim = import nixosModules/config/nixvim;
        openssh = import nixosModules/config/openssh;
        pianoteq = import nixosModules/config/pianoteq;
        pipewire = import nixosModules/config/pipewire;
        ploopy = import nixosModules/config/ploopy;
        privoxy = import nixosModules/config/privoxy;
        sops = import nixosModules/config/sops;
        stateVersion = import nixosModules/config/stateVersion;
        sudo = import nixosModules/config/sudo;
        swapDevices = import nixosModules/config/swapDevices;
        systemd-boot = import nixosModules/config/systemd-boot;
        timeZone = import nixosModules/config/timeZone;
        tor = import nixosModules/config/tor;
        ungoogled-chromium = import nixosModules/config/ungoogled-chromium;
        zsh = import nixosModules/config/zsh;
      };
      users = {
        nixos = import nixosModules/users/nixos;
        root = import nixosModules/users/root;
      };
    };
    nixosConfigurations = {
      tuxedo = nixpkgs.lib.nixosSystem {
        inherit (systems.tuxedo) system;
        specialArgs = inputs // systems.tuxedo;
        modules = (with nixosModules.options; [
          alacritty
          glirc
          iamb
          nix
          pianoteq
          pipewire
          ploopy
          sops
          ungoogled-chromium
          zsh
        ]) ++ (with nixosModules.config; [
          alacritty
          fileSystems
          glirc
          home-manager
          iamb
          kernelModules
          luksDevices
          musnix
          networking
          nitrokey
          nix
          nix-serve
          nixvim
          openssh
          pianoteq
          pipewire
          ploopy
          privoxy
          sops
          stateVersion
          sudo
          systemd-boot
          timeZone
          tor
          ungoogled-chromium
          zsh
        ]) ++ (with nixosModules.users; [
          nixos
          root
        ]) ++ (with nixpkgs.nixosModules; [
          notDetected
        ]) ++ (with inputs.musnix.nixosModules; [
          musnix
        ]) ++ (with inputs.sops.nixosModules; [
          sops
        ]) ++ (with inputs.nixServeNG.nixosModules; [
          default
        ]) ++ (with homeManager.nixosModules; [
          home-manager
        ]) ++ (with inputs.nixvim.nixosModules; [
          nixvim
        ]);
      };
      blackbox = nixpkgs.lib.nixosSystem {
        inherit (systems.blackbox) system;
        specialArgs = inputs // systems.blackbox;
        modules = (with nixosModules.options; [
          alacritty
          glirc
          iamb
          nix
          sops
          ungoogled-chromium
          zsh
        ]) ++ (with nixosModules.config; [
          alacritty
          fileSystems
          glirc
          grub
          home-manager
          iamb
          kernelModules
          networking
          nitrokey
          nix
          nixvim
          openssh
          pipewire
          privoxy
          sops
          stateVersion
          sudo
          timeZone
          tor
          ungoogled-chromium
          zsh
        ]) ++ (with nixosModules.users; [
          root
          nixos
        ]) ++ (with nixpkgs.nixosModules; [
          notDetected
        ]) ++ (with inputs.sops.nixosModules; [
          sops
        ]) ++ (with homeManager.nixosModules; [
          home-manager
        ]) ++ (with inputs.nixvim.nixosModules; [
          nixvim
        ]);
      };
      epc = nixpkgs.lib.nixosSystem {
        inherit (systems.epc) system;
        specialArgs = inputs // systems.epc;
        modules = (with nixosModules.options; [
          alacritty
          nix
          pipewire
          sops
          ungoogled-chromium
          zsh
        ]) ++ (with nixosModules.config; [
          alacritty
          fileSystems
          home-manager
          kernelModules
          networking
          nitrokey
          nix
          nixvim
          openssh
          pipewire
          privoxy
          sops
          stateVersion
          sudo
          swapDevices
          timeZone
          tor
          ungoogled-chromium
          zsh
        ]) ++ (with nixosModules.users; [
          nixos
          root
        ]) ++ (with nixpkgs.nixosModules; [
          notDetected
        ]) ++ (with inputs.sops.nixosModules; [
          sops
        ]) ++ (with homeManager.nixosModules; [
          home-manager
        ]) ++ (with inputs.nixvim.nixosModules; [
          nixvim
        ]);
      };
    };
    homeModules = {
      options = {
        fossil = import homeModules/options/fossil;
      };
      config = {
        home = import homeModules/config/home;
        sd-switch = import homeModules/config/sd-switch;
        git = import homeModules/config/git;
        fossil = import homeModules/config/fossil;
      };
      users.nixos = import homeModules/users/nixos;
    };
    overlays = {
      ungoogled-chromium = import overlays/ungoogled-chromium;
    };
  } // flakeUtils.lib.eachDefaultSystem (system: {
    packages = let
      inherit (pkgs) callPackage;
      pkgs = import nixpkgs {
        inherit system;
        overlays = (with self.overlays; [
          ungoogled-chromium
        ]);
      };
    in rec {
      inherit (pkgs) ungoogled-chromium;
      texlive = callPackage pkgs/texlive { };
      ploopy-udev = callPackage pkgs/ploopy-udev { };
      sclang-with-superdirt = supercollider.packages.${ system }.sclang-with-superdirt.override {
        startupFile = supercollider.lib.${ system }.supercolliderQuarks.superdirt.startupFile.override { numWireBufs = 2*64; };
      };
      supercollider-with-mraethel = supercollider.packages.${ system }.supercollider.override {
        plugins = (with pkgs.supercolliderPlugins; [ sc3-plugins ]);
        quarks = (with supercollider.lib.${ system }.supercolliderQuarks; [ mraethel ]);
      };
      sclang-with-mraethel = callPackage pkgs/sclang-with-mraethel {
        supercollider = supercollider-with-mraethel;
        startupFile = supercollider.lib.${ system }.supercolliderQuarks.superdirt.startupFile.override {
          numWireBufs = 2*64;
          customSoundFiles = [
            {
              src = supercollider.lib.${ system }.supercolliderQuarks.drumachines.src + "/machines/*/*";
              namingFunction = "{ |x| x.basename.replace(\"-\",\"\") }";
            }
          ];
          customStartupFiles = [ supercollider.lib.${ system }.supercolliderQuarks.mraethel.startupFile ];
        };
      };
    };
    legacyPackages = let
      inherit (pkgs) callPackage;
      pkgs = import nixpkgs { inherit system; };
    in rec {
      pianoteq = src: callPackage legacyPackages/pianoteq { inherit src; };
      haskellPackages-glirc = callPackage legacyPackages/haskellPackages/glirc { };
      glirc = haskellPackages-glirc.glirc;
    };
  });
}
