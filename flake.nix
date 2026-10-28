{
  inputs = {
    arcan.url = "github:mraethel/arcan.nix";
    flakeUtils.inputs.systems.follows = "systems";
    flakeUtils.url = "github:numtide/flake-utils";
    homeManager.url = "github:nix-community/home-manager";
    musnix.url = "github:musnix/musnix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    simple-nixos-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver";
    sops.url = "github:Mic92/sops-nix";
    supercollider.url = "github:mraethel/supercollider.nix";
    systems.url = "github:nix-systems/x86_64-linux";
  };

  outputs =
    inputs@{
      flakeUtils,
      homeManager,
      nixpkgs,
      self,
      supercollider,
      ...
    }:
    rec {
      homeModules = {
        config = {
          home = import homeModules/config/home;
          sd-switch = import homeModules/config/sd-switch;
          git = import homeModules/config/git;
          fossil = import homeModules/config/fossil;
        };
        options.fossil = import homeModules/options/fossil;
        users.nixos = import homeModules/users/nixos;
      };
      nixosConfigurations = rec {
        default = nixpkgs.lib.nixosSystem {
          modules =
            (with nixosModules; [
              config.arcan
              config.builder
              config.harmonia
              config.home-manager
              config.networking
              config.nitrokey
              config.nix
              config.nixvim
              config.openssh
              config.pipewire
              config.sops
              config.sudo
              config.zsh

              options.nix
              options.sops
              options.zsh

              users.nixos
              users.root
            ])
            ++ (with inputs; [
              arcan.nixosModules.config.default
              arcan.nixosModules.options.default
              homeManager.nixosModules.home-manager
              nixpkgs.nixosModules.notDetected
              nixvim.nixosModules.nixvim
              sops.nixosModules.sops
            ]);
          specialArgs = inputs;
          system = "x86_64-linux";
        };
        tuxedo = default.extendModules {
          modules =
            (with nixosModules; [
              config.iwd
              config.musnix
              config.ntfs
              config.pianoteq
              config.ploopy
              config.privoxy
              config.ssh
              config.systemd-boot
              config.ungoogled-chromium
              config.users

              options.pianoteq
              options.ploopy
              options.ungoogled-chromium

              systems.tuxedo

              users.builder
              users.nixos
              users.root
            ])
            ++ (with inputs; [
              musnix.nixosModules.musnix
            ]);
        };
        blackbox = default.extendModules {
          modules =
            (with nixosModules; [
              config.grub
              config.musnix
              config.pixiecore
              config.privoxy
              config.ungoogled-chromium
              config.users

              options.ungoogled-chromium

              systems.blackbox
            ])
            ++ (with inputs; [
              musnix.nixosModules.musnix
            ]);
        };
        epc = default.extendModules {
          modules =
            (with nixosModules; [
              config.grub
              config.iwd
              config.privoxy
              config.ungoogled-chromium

              options.ungoogled-chromium

              systems.epc
            ]);
        };
        donet = default.extendModules {
          modules =
            (with nixosModules; [
              config.qemuGuest
              config.systemd-boot
              options.conduit
              systems.donet
            ])
            ++ (with inputs; [
              simple-nixos-mailserver.nixosModules.mailserver
            ]);
        };
        live = nixpkgs.lib.nixosSystem {
          modules =
            (with nixosModules; [
              config.cloneConfig
              config.iwd
              config.networking
              config.nix
              config.openssh
              config.sops
              config.users

              options.nix
              options.sops

              systems.live
            ])
            ++ (with inputs; [
              sops.nixosModules.sops
            ]);
          specialArgs = inputs;
        };
        builder = nixosConfigurations.live.extendModules {
          modules = with nixosModules; [
            config.harmonia
            systems.builder
            users.builder
          ];
          specialArgs.mraethel = self;
        };
      };
      nixosModules = {
        config = {
          arcan = import nixosModules/config/arcan;
          builder = import nixosModules/config/builder;
          cloneConfig = import nixosModules/config/cloneConfig;
          grub = import nixosModules/config/grub;
          harmonia = import nixosModules/config/harmonia;
          home-manager = import nixosModules/config/home-manager;
          iwd = import nixosModules/config/iwd;
          musnix = import nixosModules/config/musnix;
          networking = import nixosModules/config/networking;
          nginx = import nixosModules/config/nginx;
          nitrokey = import nixosModules/config/nitrokey;
          nix = import nixosModules/config/nix;
          nixvim = import nixosModules/config/nixvim;
          ntfs = import nixosModules/config/ntfs;
          openssh = import nixosModules/config/openssh;
          pianoteq = import nixosModules/config/pianoteq;
          pipewire = import nixosModules/config/pipewire;
          pixiecore = import nixosModules/config/pixiecore;
          ploopy = import nixosModules/config/ploopy;
          privoxy = import nixosModules/config/privoxy;
          qemuGuest = import nixosModules/config/qemuGuest;
          sops = import nixosModules/config/sops;
          ssh = import nixosModules/config/ssh;
          sudo = import nixosModules/config/sudo;
          systemd-boot = import nixosModules/config/systemd-boot;
          ungoogled-chromium = import nixosModules/config/ungoogled-chromium;
          users = import nixosModules/config/users;
          zsh = import nixosModules/config/zsh;
        };
        options = {
          conduit = import nixosModules/options/conduit;
          nix = import nixosModules/options/nix;
          pianoteq = import nixosModules/options/pianoteq;
          pipewire = import nixosModules/options/pipewire;
          ploopy = import nixosModules/options/ploopy;
          sops = import nixosModules/options/sops;
          ungoogled-chromium = import nixosModules/options/ungoogled-chromium;
          zsh = import nixosModules/options/zsh;
        };
        systems = {
          blackbox = import nixosModules/systems/blackbox;
          builder = import nixosModules/systems/builder;
          donet = import nixosModules/systems/donet;
          epc = import nixosModules/systems/epc;
          live = import nixosModules/systems/live;
          tuxedo = import nixosModules/systems/tuxedo;
        };
        users = {
          builder = import nixosModules/users/builder;
          nixos = import nixosModules/users/nixos;
          root = import nixosModules/users/root;
        };
      };
      nixvimConfigurations = rec {
        basic = system: inputs.nixvim.legacyPackages.${system}.makeNixvim nixvimModules.config.basic;
        extra = system: (basic system).extend nixvimModules.config.extra;
      };
      nixvimModules.config = {
        basic = import nixvimModules/config/basic;
        extra = import nixvimModules/config/extra;
      };
      overlays.ungoogled-chromium = import overlays/ungoogled-chromium;
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
            overlays = [ self.overlays.ungoogled-chromium ];
          };
        in
        rec {
          inherit (pkgs) ungoogled-chromium;
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
        };
    });
}
