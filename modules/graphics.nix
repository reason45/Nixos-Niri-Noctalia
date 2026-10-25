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
}
