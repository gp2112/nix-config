{ config, pkgs, ... }:


{
  users = {
    mutableUsers = false;

    users = {
      gui = {
        isNormalUser = true;
        hashedPassword = "$6$0pkRqHNzwEluhMz/$WVb0iiLiYz6avBxS0RgwrpTVsHTfsPEVPM17JjUvTQDFf3o3Q3FUrsGfLhLOMEEItR.Ph2ky56rPZVjpgBxWX0";

        extraGroups = [ "wheel" "dialout" ];
        openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdOHcubB0bj8deVZ6P2KmuaqD9Le1mLykg1os69q5LLvmbBDtftVIcm7i/EROWU7/GyySW7rzTyGthhviHnKWbHJKyfgKcoOHc7Bxze4g2/72pxwi/bnG9xIf0GWeBx7Of+0JYGHEvEF1VcgIZKti22ENI+h3Oi/zTpY4Z+CSexU4Vz/T7uxZyd7TgLT3uxWdIAU26UfakEMUvewG1FKIPsYEHjNVTvHNx9kNq6KigNAUy1qClGKQybSSbr30KN/q82/kaYp2QjhUgGaPMs9mPriszVvxsCb5t6LXtPjTYTCcUYvLsZIVOhXqmKLD2Eku0kmU+26tVISjhmwVF2CwjB3EdLVlXEbvrBAxRQWa63ZMu85OZMCKQAgA43LYKX4pWgVcGVZQBqQyCR8sw5jrNn48ngJO1AKFQpHQjcEgKpbYdegm5vN/xq8M1a2rnklECb378pemXMi8sevjVwGkU0E+D8NO62zO3L98n8DDn3cF14aWObl3zqLF+bM3UPhM= gui@host" ];
        shell = pkgs.fish;
      };
      zzz = {
        isNormalUser = true;
        hashedPassword = "$6$6Iocx8Ah1h6A7GBP$eCWx4tIZpxNJh5jwM17ly0CrTLyJNYMZtI3.D3P52PlR4RewYP.QwSAITRGAG74cB7ffHQ6l8qUsW8Hmp9J0K/";
        extraGroups = [ "dialout" ];
        shell = pkgs.fish;
      };
    };
  };

}

