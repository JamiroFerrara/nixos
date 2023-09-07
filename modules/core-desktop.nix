{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  ###################################################################################
  #
  #  NixOS's core configuration suitable for my desktop computer
  #
  ###################################################################################

  imports = [
    ./core-server.nix
  ];

  # to install chrome, you need to enable unfree packages
  nixpkgs.config.allowUnfree = lib.mkForce true;

  nixpkgs.config.system = "x86_64-linux";
  services.getty.autologinUser = "jferrara";

  system.stateVersion = "23.05"; # Did you read the comment?
  boot.loader.grub.enable = false;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = false;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    psmisc  # killall/pstree/prtstat/fuser/...
    pulseaudio  # provides `pactl`, which is required by some apps(e.g. sonic-pi)
  ];

  programs = {
    # android development tools, this will install adb/fastboot and other android tools and udev rules
    # see https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/programs/adb.nix
    adb.enable = true;
    # The OpenSSH agent remembers private keys for you
    # so that you don’t have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent.
    ssh.startAgent = true;
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };
  # PipeWire is a new low-level multimedia framework.
  # It aims to offer capture and playback for both audio and video with minimal latency.
  # It support for PulseAudio-, JACK-, ALSA- and GStreamer-based applications.
  # PipeWire has a great bluetooth support, it can be a good alternative to PulseAudio.
  #     https://nixos.wiki/wiki/PipeWire
  services.pipewire = {
    enable = false;
    package = pkgs-unstable.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber.enable = true;
  };
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
  sound.enable = true;
  # Disable pulseaudio, it conflicts with pipewire too.
  hardware.pulseaudio.enable = true;

  # enable bluetooth & gui paring tools - blueman
  # or you can use cli:
  # $ bluetoothctl
  # [bluetooth] # power on
  # [bluetooth] # agent on
  # [bluetooth] # default-agent
  # [bluetooth] # scan on
  # ...put device in pairing mode and wait [hex-address] to appear here...
  # [bluetooth] # pair [hex-address]
  # [bluetooth] # connect [hex-address]
  # Bluetooth devices automatically connect with bluetoothctl as well:
  # [bluetooth] # trust [hex-address]
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # security with polkit
  services.power-profiles-daemon = {
    enable = true;
  };
  security.polkit.enable = true;
  # security with gnome-kering
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # https://flatpak.org/setup/NixOS
    flatpak.enable = true;

    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;

    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
      platformio # udev rules for platformio
      openocd # required by paltformio, see https://github.com/NixOS/nixpkgs/issues/224895
      android-udev-rules
    ];
  };


  xdg.portal = {
    enable = true;
    # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1
    # This will make xdg-open use the portal to open programs,
    # which resolves bugs involving programs opening inside FHS envs or with unexpected env vars set from wrappers.
    # xdg-open is used by almost all programs to open a unknown file/uri
    # alacritty as an example, it use xdg-open as default, but you can also custom this behavior
    # and vscode has open like `External Uri Openers`
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # for gtk
      # xdg-desktop-portal-kde  # for kde
    ];
  };
}
