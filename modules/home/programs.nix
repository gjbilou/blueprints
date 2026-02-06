{ ... }:
{

  config = {
      programs = {
        starship = {
	      enable = true;
	    };

        fuzzel = { 
          enable = true; 
        };
  
        zellij = {
          enable = true;
        };
  
        git = {
          enable = true;
  
  	  settings = {
  	    user = {
  	      name = "G. Jbilou";
  	      email = "gjbilou.dev@gmail.com";
  	    };
  
  	    init.defaultBranch = "main";
  	    core.editor = "nvim";
  	  };
        };
  
        hyprlock = {
          enable = true;
        };
  
        waybar = {
          enable = true;
        };

      };
  };


}
