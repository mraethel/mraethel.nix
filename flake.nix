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
      nixosConfigurations = {
        tuxedo = nixpkgs.lib.nixosSystem {
          modules =
            (with nixosModules; [
              systems.tuxedo
              users.builder
              users.nixos
              users.root
            ])
            ++ (with nixosModules.config; [
              arcan
              builder
              glirc
              harmonia
              home-manager
              iamb
              iwd
              musnix
              networking
              nitrokey
              nix
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
            ++ (with inputs; [
              arcan.nixosModules.config.default
              arcan.nixosModules.options.default
              homeManager.nixosModules.home-manager
              musnix.nixosModules.musnix
              nixpkgs.nixosModules.notDetected
              nixvim.nixosModules.nixvim
              sops.nixosModules.sops
            ]);
          specialArgs = inputs;
          system = "x86_64-linux";
        };
        blackbox = nixpkgs.lib.nixosSystem {
          modules =
            (with nixosModules; [
              systems.blackbox
              users.nixos
              users.root
            ])
            ++ (with nixosModules.config; [
              arcan
              builder
              glirc
              grub
              home-manager
              iamb
              musnix
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
            ++ (with nixosModules.options; [
              glirc
              iamb
              nix
              sops
              ungoogled-chromium
              zsh
            ])
            ++ (with inputs; [
              arcan.nixosModules.config.default
              arcan.nixosModules.options.default
              homeManager.nixosModules.home-manager
              musnix.nixosModules.musnix
              nixpkgs.nixosModules.notDetected
              nixvim.nixosModules.nixvim
              sops.nixosModules.sops
            ]);
          specialArgs = inputs;
          system = "x86_64-linux";
        };
        epc = nixpkgs.lib.nixosSystem {
          modules =
            (with nixosModules; [
              systems.epc
              users.nixos
              users.root
            ])
            ++ (with nixosModules.config; [
              arcan
              builder
              grub
              home-manager
              iwd
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
            ++ (with nixosModules.options; [
              nix
              sops
              ungoogled-chromium
              zsh
            ])
            ++ (with inputs; [
              arcan.nixosModules.config.default
              arcan.nixosModules.options.default
              nixpkgs.nixosModules.notDetected
              sops.nixosModules.sops
              homeManager.nixosModules.home-manager
              nixvim.nixosModules.nixvim
            ]);
          specialArgs = inputs;
          system = "x86_64-linux";
        };
        donet = nixpkgs.lib.nixosSystem {
          modules =
            (with nixosModules; [
              systems.donet
              users.nixos
              users.root
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
            ++ (with nixosModules.options; [
              conduit
              nix
              sops
              zsh
            ])
            ++ (with inputs; [
              homeManager.nixosModules.home-manager
              nixvim.nixosModules.nixvim
              simple-nixos-mailserver.nixosModules.mailserver
              sops.nixosModules.sops
            ]);
          specialArgs = inputs;
          system = "x86_64-linux";
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
          alacritty = import nixosModules/config/alacritty;
          arcan = import nixosModules/config/arcan;
          builder = import nixosModules/config/builder;
          cloneConfig = import nixosModules/config/cloneConfig;
          glirc = import nixosModules/config/glirc;
          grub = import nixosModules/config/grub;
          harmonia = import nixosModules/config/harmonia;
          home-manager = import nixosModules/config/home-manager;
          iamb = import nixosModules/config/iamb;
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
          glirc = haskellPackages-glirc.glirc;
          haskellPackages-glirc = callPackage legacyPackages/haskellPackages/glirc { };
          pianoteq = src: callPackage legacyPackages/pianoteq { inherit src; };
        };
    });
}
