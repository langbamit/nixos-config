{ config, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.utherpally = {
      news.display = "silent";

      # Start new or changed services automatically.
      # Stop obsolte services from the previous generation
      systemd.user.startServices = true;

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      home.stateVersion = "21.11";
    };
  };
}