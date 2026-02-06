{ ... }:
{

  config = {
    services.pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      # jack.enable = false; # tbd if needed or not
    };
    
    security.rtkit.enable = true;
  };

}

