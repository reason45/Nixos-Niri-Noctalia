{ ... }:
{
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";

      # Test the system configuration without switching.
      rebuild-check = "sudo nixos-rebuild dry-build";

      # Apply the system and Home Manager configuration.
      rebuild = "sudo nixos-rebuild switch";
    };

    initExtra = ''
      fastfetch
    '';
  };

  programs.bat.enable = true;
}
