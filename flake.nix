{
  inputs = {
    homeManager.url = "github:nix-community/home-manager";

    legacyNeovim.url = "github:jordanisaacs/neovim-flake";

    musnix.url = "github:musnix/musnix";

    neovim.url = "github:notashelf/neovim-flake";

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
    legacyNeovim,
    nixpkgs,
    self,
    supercollider,
    tidalcycles,
    flakeUtils,
    ...
  }: {
    systems = {
      tuxedo = {
        hostName = "tuxedo";
        system = "x86_64-linux";
        stateVersion = "23.11";
      };
      blackbox = {
        hostName = "blackbox";
        system = "x86_64-linux";
        stateVersion = "23.11";
      };
      epc = {
        hostname = "epc";
        system = "x86_64-linux";
        stateVersion = "22.11";
      };
    };
  } // {
    nixosModules = {
      options = {
        alacritty = import nixosModules/options/alacritty;
        glirc = import nixosModules/options/glirc;
        iamb = import nixosModules/options/iamb;
        neovim = import nixosModules/options/neovim;
        ploopy = import nixosModules/options/ploopy;
        sops = import nixosModules/options/sops;
        texlive = import nixosModules/options/texlive;
        ungoogled-chromium = import nixosModules/options/ungoogled-chromium;
      };
      config = {
        alacritty = import nixosModules/config/alacritty;
        git = import nixosModules/config/git;
        glirc = import nixosModules/config/glirc;
        iamb = import nixosModules/config/iamb;
        musnix = import nixosModules/config/musnix;
        home-manager = import nixosModules/config/home-manager;
        neovim = import nixosModules/config/neovim;
        networking = import nixosModules/config/networking;
        nitrokey = import nixosModules/config/nitrokey;
        nix = import nixosModules/config/nix;
        nix-serve = import nixosModules/config/nix-serve;
        openssh = import nixosModules/config/openssh;
        pipewire = import nixosModules/config/pipewire;
        ploopy = import nixosModules/config/ploopy;
        privoxy = import nixosModules/config/privoxy;
        sops = import nixosModules/config/sops;
        sudo = import nixosModules/config/sudo;
        system = import nixosModules/config/system;
        systemd-boot = import nixosModules/config/systemd-boot;
        texlive = import nixosModules/config/texlive;
        tor = import nixosModules/config/tor;
        ungoogled-chromium = import nixosModules/config/ungoogled-chromium;
      };
      tuxedo = import nixosModules/tuxedo;
      blackbox = import nixosModules/blackbox;
      epc = import nixosModules/epc;
    };
  } // {
    nixosConfigurations = {
      tuxedo = nixpkgs.lib.nixosSystem {
        inherit (self.systems.tuxedo) system;
        specialArgs = inputs // {
          inherit (self.systems.tuxedo) hostName system stateVersion;
          mraethel = self;
        };
        modules = (with self.nixosModules.options; [
          glirc
          iamb
          neovim
          ploopy
          sops
          texlive
          ungoogled-chromium
          alacritty
        ]) ++ (with self.nixosModules.config; [
          alacritty
          glirc
          iamb
          musnix
          neovim
          nitrokey
          nix-serve
          openssh
          pipewire
          ploopy
          privoxy
          sops
          sudo
          system
          systemd-boot
          texlive
          tor
          ungoogled-chromium
        ]) ++ (with nixpkgs.nixosModules; [
          notDetected
        ]) ++ (with inputs.musnix.nixosModules; [
          musnix
        ]) ++ (with inputs.sops.nixosModules; [
          sops
        ]) ++ (with inputs.nixServeNg.nixosModules; [
          default
        ]) ++ (with inputs.homeManager.nixosModules; [
          home-manager
        ]) ++ [ self.nixosModules.tuxedo ];
      };
      blackbox = nixpkgs.lib.nixosSystem {
        inherit (self.systems.blackbox) system;
        specialArgs = inputs // {
          inherit (self.systems.blackbox) hostName system stateVersion;
          mraethel = self;
        };
        modules = (with self.nixosModules.options; [
          alacritty
          glirc
          iamb
          neovim
          sops
          ungoogled-chromium
        ]) ++ (with self.nixosModules.config; [
          alacritty
          glirc
          iamb
          neovim
          nitrokey
          openssh
          pipewire
          privoxy
          sops
          sudo
          system
          tor
          ungoogled-chromium
        ]) ++ (with nixpkgs.nixosModules; [
          notDetected
        ]) ++ (with inputs.sops.nixosModules; [
          sops
        ]) ++ [ self.nixosModules.blackbox ];
      };
      epc = nixpkgs.lib.nixosSystem {
        inherit (self.systems.epc) system;
        specialArgs = inputs // {
          inherit (self.systems.epc) hostName system stateVersion;
          mraethel = self;
        };
        modules = (with self.nixosModules.options; [
          alacritty
          neovim
          sops
          ungoogled-chromium
        ]) ++ (with self.nixosModules.config; [
          alacritty
          neovim
          nitrokey
          openssh
          pipewire
          privoxy
          sops
          sudo
          system
          tor
          ungoogled-chromium
        ]) ++ (with nixpkgs.nixosModules; [
          notDetected
        ]) ++ (with inputs.sops.nixosModules; [
          sops
        ]) ++ [ self.nixosModules.epc ];
      };
    };
  } // {
    homeModules = {
      options = { };
      config = {
        home = import homeModules/config/home;
        sd-switch = import homeModules/config/sd-switch;
      };
      hbrs = import homeModules/hbrs;
      sbmr = import homeModules/hbrs;
      nixos = import homeModules/nixos;
    };
  } // {
    neovimModules = {
      config = {
        theme = import neovimModules/config/theme;
        lualine = import neovimModules/config/lualine;
        git = import neovimModules/config/git;
        tidal = import neovimModules/config/tidal;
        telescope = import neovimModules/config/telescope;
        treesitter = import neovimModules/config/treesitter;
        languages = import neovimModules/config/languages;
        nvimTree = import neovimModules/config/nvimTree;
        nvimBufferline = import neovimModules/config/nvimBufferline;
        nvimWebDevicons = import neovimModules/config/nvimWebDevicons; # TODO: enable if nvimBufferline is enabled
      };
      legacyConfig = {
        nvimTree = import neovimModules/config/nvimTree/legacy;
        languages = import neovimModules/config/languages/legacy;
      };
    };
  } // flakeUtils.lib.eachDefaultSystem (system: {
    neovimConfigurations = let
      pkgs = import nixpkgs {
        inherit system;
        overlays = (with tidalcycles.overlays; [ tidal ]);
      };
    in {
      default = inputs.neovim.lib.neovimConfiguration {
        inherit pkgs;
        modules = (with self.neovimModules.config; [
          nvimTree
          theme
          tidal
          lualine
          git
          telescope
          treesitter
          languages
        ]);
      };
      legacy = legacyNeovim.lib.neovimConfiguration {
        inherit pkgs;
        modules = (with self.neovimModules.config; [
          theme
          lualine
          git
          telescope
          treesitter
        ]) ++ (with self.neovimModules.legacyConfig; [
          nvimTree
          languages
        ]);
      };
    };
  }) // {
    overlays = {
      ungoogled-chromium = import overlays/ungoogled-chromium;
    };
  } // flakeUtils.lib.eachDefaultSystem (system: {
    packages = let
      pkgs = import nixpkgs {
        inherit system;
        overlays = (with self.overlays; [
          ungoogled-chromium
        ]);
      };
    in rec {
      inherit (pkgs) ungoogled-chromium;
      neovim = self.neovimConfigurations.${ system }.default.neovim;
      texlive = pkgs.callPackage packages/texlive { };
      ploopy-udev = pkgs.callPackage packages/ploopy-udev { };
      sclang-with-superdirt = supercollider.packages.${ system }.sclang-with-superdirt.override {
        startupFile = supercollider.lib.${ system }.supercolliderQuarks.superdirt.startupFile.override { numWireBufs = 2*64; };
      };
      supercollider-with-mraethel = supercollider.packages.${ system }.supercollider.override {
        plugins = (with pkgs.supercolliderPlugins; [ sc3-plugins ]);
        quarks = (with supercollider.lib.${ system }.supercolliderQuarks; [ mraethel ]);
      };
      sclang-with-mraethel = pkgs.callPackage packages/sclang-with-mraethel {
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
  }) // flakeUtils.lib.eachDefaultSystem (system: {
    legacyPackages = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in rec {
      pianoteq = src: pkgs.callPackage legacyPackages/pianoteq { inherit src; };
      haskellPackages-glirc = pkgs.callPackage legacyPackages/haskellPackages/glirc { };
      glirc = haskellPackages-glirc.glirc;
    };
  });
}
