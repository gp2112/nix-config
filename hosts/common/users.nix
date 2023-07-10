{ config, pkgs, ... }:


{
  programs.fish.enable = true;
  users = {
    mutableUsers = false;

    users = {
      gui = {
        isNormalUser = true;
        hashedPassword = "$6$0pkRqHNzwEluhMz/$WVb0iiLiYz6avBxS0RgwrpTVsHTfsPEVPM17JjUvTQDFf3o3Q3FUrsGfLhLOMEEItR.Ph2ky56rPZVjpgBxWX0";

        extraGroups = [ "wheel" "dialout" ];
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdOHcubB0bj8deVZ6P2KmuaqD9Le1mLykg1os69q5LLvmbBDtftVIcm7i/EROWU7/GyySW7rzTyGthhviHnKWbHJKyfgKcoOHc7Bxze4g2/72pxwi/bnG9xIf0GWeBx7Of+0JYGHEvEF1VcgIZKti22ENI+h3Oi/zTpY4Z+CSexU4Vz/T7uxZyd7TgLT3uxWdIAU26UfakEMUvewG1FKIPsYEHjNVTvHNx9kNq6KigNAUy1qClGKQybSSbr30KN/q82/kaYp2QjhUgGaPMs9mPriszVvxsCb5t6LXtPjTYTCcUYvLsZIVOhXqmKLD2Eku0kmU+26tVISjhmwVF2CwjB3EdLVlXEbvrBAxRQWa63ZMu85OZMCKQAgA43LYKX4pWgVcGVZQBqQyCR8sw5jrNn48ngJO1AKFQpHQjcEgKpbYdegm5vN/xq8M1a2rnklECb378pemXMi8sevjVwGkU0E+D8NO62zO3L98n8DDn3cF14aWObl3zqLF+bM3UPhM= gui@host"
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCVI5xX1ihCI+PvlzXJg73W07ifE5DAtqunjZaUNWDZWtRfvvtZtpojfCh3fqrc3xnG9YSAEiKSV6PqPCS7skci450MC4ZsKZ7ZVJ1Y2ugyDXOPN9UcGT4zWDUMgzAqpoXXe7KnR1vfZ45ZbCt5q3s3cabbEfBQQ703ZTYC85WeoWGgOnm277tj78r02724rUvdBlyiqBL8+ea2EshIumLDjNcZXF/MxeRS4Yye1PJx6qjnHcxAl0enwKQGeG0QmADrzatho/v7wl2bkPyrKm7myWq2s1fJyLeFkdzYFtwlrSebNw/TrFbLFqqKNkrhnPsvFuq8JncDQXCXnc+2Yeke5Fak6HYu3XQGkBW1HcrHq5Uo9LtYWf8n661s2ySVllkOfRLbr6XfTjPsyG9wY1/Bgx5cZqtowsySzYFaV6r9OkI6YaLZQ+cu18ftQGyI7K6Q4PKC6TqiXUfLWueGkQrPC6Huo/vwu7e1igy3ACx2X7QLwIprbWuf/tdQmMILLU0= gui@proton"
        ];
        shell = pkgs.fish;
      };
    };
  };

}

