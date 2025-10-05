{
  inputs = {
    arcan.url = "github:mraethel/arcan.nix";

    homeManager.url = "github:nix-community/home-manager";

    musnix.url = "github:musnix/musnix";

    nixvim.url = "github:nix-community/nixvim";

    nixServeNG.url = "github:aristanetworks/nix-serve-ng";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    sops.url = "github:Mic92/sops-nix";

    supercollider.url = "github:mraethel/supercollider.nix";

    simple-nixos-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver";

    flakeUtils.url = "github:numtide/flake-utils";
    flakeUtils.inputs.systems.follows = "systems";
    systems.url = "github:nix-systems/x86_64-linux";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      homeManager,
      supercollider,
      flakeUtils,
      ...
    }:
    rec {
      nixosModules = {
        options = {
          alacritty = import nixosModules/options/alacritty;
          conduit = import nixosModules/options/conduit;
          glirc = import nixosModules/options/glirc;
          iamb = import nixosModules/options/iamb;
          nix = import nixosModules/options/nix;
          pianoteq = import nixosModules/options/pianoteq;
          pipewire = import nixosModules/options/pipewire;
          ploopy = import nixosModules/options/ploopy;
          sops = import nixosModules/options/sops;
          ssh = import nixosModules/options/ssh;
          ungoogled-chromium = import nixosModules/options/ungoogled-chromium;
          zsh = import nixosModules/options/zsh;
        };
        config = {
          alacritty = import nixosModules/config/alacritty;
          arcan = import nixosModules/config/arcan;
          glirc = import nixosModules/config/glirc;
          grub = import nixosModules/config/grub;
          home-manager = import nixosModules/config/home-manager;
          iamb = import nixosModules/config/iamb;
          iwd = import nixosModules/config/iwd;
          musnix = import nixosModules/config/musnix;
          networking = import nixosModules/config/networking;
          nitrokey = import nixosModules/config/nitrokey;
          nix = import nixosModules/config/nix;
          nix-serve = import nixosModules/config/nix-serve;
          nixvim = import nixosModules/config/nixvim;
          ntfs = import nixosModules/config/ntfs;
          openssh = import nixosModules/config/openssh;
          pianoteq = import nixosModules/config/pianoteq;
          pipewire = import nixosModules/config/pipewire;
          ploopy = import nixosModules/config/ploopy;
          privoxy = import nixosModules/config/privoxy;
          qemuGuest = import nixosModules/config/qemuGuest;
          sops = import nixosModules/config/sops;
          ssh = import nixosModules/config/ssh;
          sudo = import nixosModules/config/sudo;
          systemd-boot = import nixosModules/config/systemd-boot;
          tor = import nixosModules/config/tor;
          ungoogled-chromium = import nixosModules/config/ungoogled-chromium;
          users = import nixosModules/config/users;
          zsh = import nixosModules/config/zsh;
        };
        systems = {
          tuxedo = import nixosModules/systems/tuxedo;
          blackbox = import nixosModules/systems/blackbox;
          epc = import nixosModules/systems/epc;
          donet = import nixosModules/systems/donet;
        };
        users = {
          nixos = import nixosModules/users/nixos;
          root = import nixosModules/users/root;
        };
      };
      nixosConfigurations = {
        tuxedo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = inputs;
          modules = [
            nixosModules.systems.tuxedo
          ]
          ++ (with nixosModules.options; [
            glirc
            iamb
            nix
            pianoteq
            ploopy
            sops
            ssh
            ungoogled-chromium
            zsh
          ])
          ++ (with nixosModules.config; [
            arcan
            glirc
            home-manager
            iamb
            iwd
            musnix
            networking
            nitrokey
            nix
            nix-serve
            nixvim
            ntfs
            openssh
            pianoteq
            pipewire
            ploopy
            privoxy
            sops
            ssh
            sudo
            systemd-boot
            tor
            ungoogled-chromium
            users
            zsh
          ])
          ++ (with nixosModules.users; [
            nixos
            root
          ])
          ++ (with inputs.arcan.nixosModules; [
            options.default
            config.default
          ])
          ++ [ nixpkgs.nixosModules.notDetected ]
          ++ [ inputs.musnix.nixosModules.musnix ]
          ++ [ inputs.sops.nixosModules.sops ]
          ++ [ inputs.nixServeNG.nixosModules.default ]
          ++ [ homeManager.nixosModules.home-manager ]
          ++ [ inputs.nixvim.nixosModules.nixvim ];
        };
        blackbox = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = inputs;
          modules = [
            nixosModules.systems.blackbox
          ]
          ++ (with nixosModules.options; [
            glirc
            iamb
            nix
            sops
            ungoogled-chromium
            zsh
          ])
          ++ (with nixosModules.config; [
            arcan
            glirc
            grub
            home-manager
            iamb
            networking
            nitrokey
            nix
            nixvim
            openssh
            pipewire
            privoxy
            sops
            sudo
            tor
            ungoogled-chromium
            users
            zsh
          ])
          ++ (with nixosModules.users; [
            root
            nixos
          ])
          ++ (with inputs.arcan.nixosModules; [
            options.default
            config.default
          ])
          ++ [ nixpkgs.nixosModules.notDetected ]
          ++ [ inputs.sops.nixosModules.sops ]
          ++ [ homeManager.nixosModules.home-manager ]
          ++ [ inputs.nixvim.nixosModules.nixvim ];
        };
        epc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = inputs;
          modules = [
            nixosModules.systems.epc
          ]
          ++ (with nixosModules.options; [
            alacritty
            nix
            sops
            ungoogled-chromium
            zsh
          ])
          ++ (with nixosModules.config; [
            alacritty
            home-manager
            networking
            nitrokey
            nix
            nixvim
            openssh
            pipewire
            privoxy
            sops
            sudo
            tor
            ungoogled-chromium
            zsh
          ])
          ++ (with nixosModules.users; [
            nixos
            root
          ])
          ++ [ nixpkgs.nixosModules.notDetected ]
          ++ [ inputs.sops.nixosModules.sops ]
          ++ [ homeManager.nixosModules.home-manager ]
          ++ [ inputs.nixvim.nixosModules.nixvim ];
        };
        donet = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = inputs;
          modules = [
            nixosModules.systems.donet
          ]
          ++ (with nixosModules.options; [
            alacritty # depOf nixosModules.config.zsh
            conduit
            nix
            sops
            zsh
          ])
          ++ (with nixosModules.config; [
            home-manager
            networking
            nix
            nixvim
            openssh
            qemuGuest
            sops
            sudo
            systemd-boot
            zsh
          ])
          ++ (with nixosModules.users; [
            nixos
            root
          ])
          ++ [ inputs.sops.nixosModules.sops ]
          ++ [ homeManager.nixosModules.home-manager ]
          ++ [ inputs.nixvim.nixosModules.nixvim ]
          ++ [ inputs.simple-nixos-mailserver.nixosModules.mailserver ];
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
      overlays.ungoogled-chromium = import overlays/ungoogled-chromium;
      nixvimModules.config = {
        basic = import nixvimModules/config/basic;
        extra = (import nixvimModules/config/extra) self;
      };
      nixvimConfigurations = system: rec {
        basic = inputs.nixvim.legacyPackages.${system}.makeNixvim nixvimModules.config.basic;
        extra = basic.extend (nixvimModules.config.extra system);
      };
    }
    // flakeUtils.lib.eachDefaultSystem (system: {
      formatter =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.nixfmt-tree;
      packages =
        let
          inherit (pkgs) callPackage;
          pkgs = import nixpkgs {
            inherit system;
            overlays = (
              with self.overlays;
              [
                ungoogled-chromium
              ]
            );
          };
        in
        rec {
          inherit (pkgs) ungoogled-chromium;
          iamb = callPackage pkgs/iamb { };
          texlive = callPackage pkgs/texlive { };
          ploopy-udev = callPackage pkgs/ploopy-udev { };
          sclang-with-superdirt = supercollider.packages.${system}.sclang-with-superdirt.override {
            startupFile = supercollider.lib.${system}.supercolliderQuarks.superdirt.startupFile.override {
              numWireBufs = 2 * 64;
            };
          };
          supercollider-with-mraethel = supercollider.packages.${system}.supercollider.override {
            plugins = (with pkgs.supercolliderPlugins; [ sc3-plugins ]);
            quarks = (with supercollider.lib.${system}.supercolliderQuarks; [ mraethel ]);
          };
          sclang-with-mraethel = callPackage pkgs/sclang-with-mraethel {
            supercollider = supercollider-with-mraethel;
            startupFile = supercollider.lib.${system}.supercolliderQuarks.superdirt.startupFile.override {
              numWireBufs = 2 * 64;
              customSoundFiles = [
                {
                  src = supercollider.lib.${system}.supercolliderQuarks.drumachines.src + "/machines/*/*";
                  namingFunction = "{ |x| x.basename.replace(\"-\",\"\") }";
                }
              ];
              customStartupFiles = [ supercollider.lib.${system}.supercolliderQuarks.mraethel.startupFile ];
            };
          };
        };
      legacyPackages =
        let
          inherit (pkgs) callPackage;
          pkgs = import nixpkgs { inherit system; };
        in
        rec {
          pianoteq = src: callPackage legacyPackages/pianoteq { inherit src; };
          haskellPackages-glirc = callPackage legacyPackages/haskellPackages/glirc { };
          glirc = haskellPackages-glirc.glirc;
        };
    });
}
