{ ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = "reason45";
    settings.user.email = "340031061+reason45@users.noreply.github.com";
    settings.init.defaultBranch = "main";
    settings.push.autoSetupRemote = true;
  };
}
