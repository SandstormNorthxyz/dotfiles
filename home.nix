{ config, pkgs, ... }:
{
  imports = [
    ./modules/sway
    ./modules/waybar
    ./modules/theme
    ./modules/nushell
    ./modules/helix
    ./modules/zsh
    ./modules/firefox
    ./modules/rofi
    ./modules/ranger
    ./modules/discord
    ./modules/foot
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "silas";
  home.homeDirectory = "/home/silas";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # nixpkgs.overlays = [  (final: prev: {freecad = prev.freecad.overrideAttrs (old: {
  #     src = pkgs.fetchFromGitHub {
  #       owner = "FreeCad";
  #       repo = "FreeCad";
  #       rev = "59c1ccec3e6b70f56eeee8f94d361019b84bd850";
  #       hash = "sha256-SsC73QPBIRkqH/ZI43oPHhug6/hiypgdP0t8n2aaiiQ=";
  #     };
      
  #   });})
  # ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Command line apps
    git
    sshfs
    htop-vim
    neofetch
    killall
    sl
    lolcat
    eza
    tree
    man-pages
    man-pages-posix
    zip
    unzip
    gpclient
    gcc
    curl
    bc
    avrdude
    platformio
    cowsay
    figlet
    usbutils
    gdu
    imagemagick
    pcsclite
    fzf
    vesktop
    typst

    # Desktop
    xfce.thunar
    xfce.thunar-volman
    alacritty
    feh
    gimp
    freecad
    prusa-slicer
    obsidian
    vscode
    octaveFull
    libreoffice-still
    gparted
    peek
    vlc
    inkscape
    logisim
    kicad
    qgis
    pulseview
    zoom-us
    cloudcompare
    # armcord
    loupe
    wayvnc
    zotero
    nmap
    iperf
    
    # Services
    libnotify
    xdg-utils

    # Configuration
    networkmanagerapplet
    pavucontrol
    lxappearance
    glxinfo
    inxi
    acpi
    pciutils

    # Games
    jdk8
    prismlauncher
    alsa-oss

    # Windowsnn
    wine
    protontricks
    winetricks
    bottles
    samba
    ppp
    cabextract

    # Font
    nasin-nanpa
    texliveSmall
    texlab
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuraDtion will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  # Random Configs
  xdg.desktopEntries = {
    helix = {
      name = "Hx";
      icon = "helix";
      genericName = "Text Editor";
      exec = "foot -e hx";
      terminal = false;
      type = "Application";
    };

    ltspice = {
      name = "ltspice";
      genericName = "Circuit Simulator";
      exec = "wine \"home/silas/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx86.exe\"";
      terminal = false;
      type = "Application";
    };
  };


  programs.git = {
    enable = true;
    userName = "gagnonsilas";
    userEmail = "gagnon.silas@gmail.com";
    extraConfig = {
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/silas/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    PS1 = " %F{blue}%~%f %F{green}>%f ";
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
