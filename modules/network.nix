{
  networking = {
      hostName = "nixos-utherpally";
      networkmanager = {
          enable = true;
      };
      # The global useDHCP flag is deprecated, therefore explicitly set to false here.
      # Per-interface useDHCP will be mandatory in the future, so this generated config
      # replicates the default behaviour.
      useDHCP = false;
      interfaces = {
          enp2s0f0.useDHCP = true;
          enp5s0.useDHCP = true;
      };
  };
}