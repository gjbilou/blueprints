{ ... }:
{
  imports = [
    ../../modules/home/packages.nix
    ../../modules/home/programs.nix
    ../../modules/home/services.nix
  ];

  config = {
    home = {
      username = "rain";
      homeDirectory = "/home/rain";

      stateVersion = "25.11";
    };
  };

}
