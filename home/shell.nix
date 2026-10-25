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
      fastfetch
    '';
  };

  programs.bat.enable = true;
}
