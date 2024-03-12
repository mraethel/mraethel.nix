{ writeTextDir }: writeTextDir "etc/udev/rules.d/100-ploopy-headphones.rules" ''
  SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="fedd", MODE="666"
''
