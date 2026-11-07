# System-wide bash configuration and convenient aliases.
# Options checked against NixOS programs.bash (nixpkgs).
{ ... }:
{
  programs.bash = {
    # Configure bash as an interactive shell for all users.
    enable = true;

    shellAliases = {
      ls   = "ls --color=auto";
      grep = "grep --color=auto";
      ll   = "ls -alFh --color=auto";
      la   = "ls -A --color=auto";
      ".." = "cd ..";
      "..." = "cd ../..";

      # Rebuilds — flake attribute matches networking.hostName ("sanzay").
      # Run from the flake directory, or pass an explicit path:
      #   nixos-rebuild switch --flake /etc/nixos#sanzay
      rebuild       = "sudo nixos-rebuild switch --flake .#sanzay";
      rebuild-boot  = "sudo nixos-rebuild boot --flake .#sanzay";
      rebuild-test  = "sudo nixos-rebuild test --flake .#sanzay";
      rebuild-check = "nixos-rebuild build --flake .#sanzay";

      # Garbage collection (no nh).
      # Gentle: delete generations older than 7 days.
      clean = "sudo nix-collect-garbage --delete-older-than 7d";
      # Deep: remove all unreachable store paths / old generations.
      clean-all = "sudo nix-collect-garbage -d";
    };

    # Fastfetch once per boot in the first interactive shell.
    interactiveShellInit = ''
      if [[ $- == *i* && -n "$XDG_RUNTIME_DIR" && ! -e "$XDG_RUNTIME_DIR/fastfetch-shown" ]]; then
        touch "$XDG_RUNTIME_DIR/fastfetch-shown"
        command -v fastfetch >/dev/null && fastfetch
      fi
    '';
  };
}
