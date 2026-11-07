# mpv with Intel iHD VA-API hardware decode.
{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      # Intel iHD VA-API (set in modules/system-hardware/graphics.nix).
      # Skips the failed Vulkan/CUDA probes that "auto-safe" tries first.
      hwdec = "vaapi";
    };
  };
}
