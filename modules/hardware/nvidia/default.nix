{ config, pkgs, username, ... }:
{
  # Environment variables
  # ---- I often have these enabled elsewhere but you may still want these if you are having issues ----
  # Force wayland when possible
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix disappearing cursor on Hyprland
  # environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  # Enable NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = false;
    # Video card specific - stable supports "newer" cards
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  
  users.users.${username} = {
    extraGroups = [ "video" "render" ];
  };
}
