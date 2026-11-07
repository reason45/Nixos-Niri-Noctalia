{ ... }:
{
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      ll = "ls -alFh --color=auto"; # long list, hidden files, human sizes
      la = "ls -A --color=auto";    # all files except . and ..
      ".." = "cd ..";
      "..." = "cd ../..";

      # System (needs sudo; nh asks when required). Flake path comes from programs.nh.flake.
      rebuild = "nh os switch";
      rebuild-boot = "nh os boot";
      rebuild-test = "nh os test";
      rebuild-check = "nh os build"; # build only, activate nothing
      # Gentle: same policy as the weekly timer, keeps a week of rollback.
      clean = "home-manager expire-generations \"-7 days\" && nh clean all --keep-since 7d --keep 3 && nh os boot";
      # Deep: current generation only, no rollback.
      clean-all = "home-manager expire-generations now && nh clean all --keep 1 && nh os boot";

      # Home Manager only: no sudo, no full system rebuild.
      hms = "nh home switch -b backup -c sanzay";
    };

    historyControl = [ "ignoredups" "ignorespace" "erasedups" ]; # leading space = don't save
    historySize = 2000;
    historyFileSize = 2000;
    historyIgnore = [
      "ls" "ll" "cd" "cd *" "pwd" "clear" "exit" "reboot" "fastfetch"
      "history" "history *" "git status" "git add *" "free *" "df *"
    ];

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
