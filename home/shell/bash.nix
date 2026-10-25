{ ... }:
{
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";

      # System (needs sudo; nh asks when required). Flake path comes from programs.nh.flake.
      rebuild = "nh os switch";
      rebuild-boot = "nh os boot";
      rebuild-test = "nh os test";

      # Home Manager only: no sudo, no full system rebuild.
      hm = "nh home switch -b backup -c sanzay";
    };

    # Show fastfetch once per boot, in the first interactive shell.
    initExtra = ''
      if [[ $- == *i* && -n "$XDG_RUNTIME_DIR" && ! -e "$XDG_RUNTIME_DIR/fastfetch-shown" ]]; then
        touch "$XDG_RUNTIME_DIR/fastfetch-shown"
        fastfetch
      fi
    '';
  };

  programs.bat.enable = true;
}
