{ pkgs, lib, config, ... }:

{
  # links /libexec from derivations to /run/current-system/sw 
  environment.pathsToLink = [ "/libexec" ];
  # Support settings to be stored
  programs.dconf.enable = true;
  # Used for nautilus to work trash folder
  services.gvfs.enable = true;
  # i3 settings
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };
    
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ./config/custom;
    };
  };

  services.compton.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.xrandr       # display manager
    dmenu             # app launcher
    nitrogen          # wallpaper
    rofi              # app launcher
    dunst             # notification
    multilockscreen   # lockscreen
    i3lock-pixeled    # i3lock
    i3status          # status bar
    flameshot         # screenshot capture
    xautolock         # autolock inactivity
    # Under investigation, don't know if it solves the problem
    lxappearance
    gtkmm2            # for nitrogen
    gnome-icon-theme  # for nitrogen
  ];

  #services.cron = {
  #  enable = true;
  #  systemCronJobs = [
  #    "*/5 * * * *      utherpally    . /etc/profile; curl -s wttr.in/Reilingen?format=3 > ~/.weather.cache"
  #  ];
  #};

  home-manager.users.utherpally = {
    home.file = {
      ".compton.conf" = { source = ./compton.conf; };
      "dunst" = {
        source = ./dunst;
        target = ".config/dunst";
        recursive = true;
      };
      "rofi" = {
        source = ./rofi;
        target = ".config/rofi";
      };
      "i3status" = {
        source = ./i3status.conf;
        target = ".config/i3/i3status.conf";
      };
      "weather" = {
        source = ./weather.sh;
        target = ".config/i3/weather.sh";
      };
    };
  };
}
