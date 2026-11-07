# Git identity and sensible defaults (system-wide).
{ ... }:
{
  programs.git = {
    enable = true;
    config = {
      user = {
        name  = "Reason45";
        # GitHub noreply address — commits link to the account without
        # publishing a real e-mail.
        email = "40031061+reason45@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
