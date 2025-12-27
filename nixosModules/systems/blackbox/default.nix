{
  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "ehci_pci"
      "firewire_ohci"
      "nvme"
      "ohci_pci"
      "sd_mod"
      "sr_mod"
      "usb_storage"
      "usbhid"
      "xhci_pci"
    ];
    kernelModules = [ "kvm-amd" ];
    loader.grub.device = "/dev/sda";
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e98fa073-4ade-4a81-94f0-ba8961288f99";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/38cddcc8-2e37-4e56-a613-20e907658d94";
      fsType = "ext4";
    };
  };
  networking.hostName = "blackbox";
  programs.arcan.durden.autorun.extra = ''
    display_add_listener(function(action,name,tiler,id)
      if (action == "added" and name == "L15CM/CHGM02304027") then
        dispatch_symbol("/global/display/displays/disp_" .. string.hexenc(name) .. "/focus");
      end
    end);
  '';
  system.stateVersion = "23.11";
  systemd.network.networks.enp3s0 = {
    name = "enp3s0";
    DHCP = "yes";
  };
  time.timeZone = "Europe/Berlin";
}
