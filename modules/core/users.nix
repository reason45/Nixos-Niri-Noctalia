{ ... }:
{
  users.users.sanzay = {
    isNormalUser = true;
    description = "Sanjaya";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
