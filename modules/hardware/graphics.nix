# Intel UHD (Comet Lake) graphics and hardware video decode.
{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    # iHD VA-API driver: hardware video decode/encode on Comet Lake.
    extraPackages = with pkgs; [ intel-media-driver ];
  };

  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

  hardware.enableRedistributableFirmware = true;

  # Carried over from the GNOME config: load i915 early, and turn off panel
  # self refresh, a known cause of dim or flickering laptop panels.
  boot.initrd.kernelModules = [ "i915" ];
  boot.kernelParams = [ "i915.enable_psr=0" ];
}
