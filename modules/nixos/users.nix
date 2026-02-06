{ pkgs, ... }:
{
  
  config = {
    security.sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };

    users.users.rain = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
	"networkmanager"
      ];
      shell = pkgs.xonsh;
    };

    programs.xonsh.enable = true;
  };

}
