{ pkgs, ... }:
{
  
  config = {
    nixpkgs.config.allowUnfree = true;

    programs.chromium.enable = true;
    
    environment.systemPackages = with pkgs; [
      vim
      git
      curl
      wget
      brave
    ];
  };



}
