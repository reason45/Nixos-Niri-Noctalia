{
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";

      rebuild-switch = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      rebuild-boot = "sudo nixos-rebuild boot --flake /etc/nixos#nixos";
      rebuild-build = "sudo nixos-rebuild build --flake /etc/nixos#nixos";
    };

    initExtra = ''
      if [[ $- == *i* && -n "$XDG_RUNTIME_DIR" && ! -e "$XDG_RUNTIME_DIR/fastfetch-shown" ]]; then
        touch "$XDG_RUNTIME_DIR/fastfetch-shown"
        fastfetch
      fi
    '';
  };

  programs.bat.enable = true;
}