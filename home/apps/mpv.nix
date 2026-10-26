{ ... }:
{
  programs.mpv = {
    enable = true;

    config = {
      # Intel iHD VA-API (set in modules/hardware/graphics.nix).
      # Skips the failed Vulkan/CUDA probes that "auto-safe" tries first.
      hwdec = "vaapi";
    };
  };
}