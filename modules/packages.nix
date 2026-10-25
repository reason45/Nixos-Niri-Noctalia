#All packages are configured at home this is just for system level future need boiler plate
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [];
}
