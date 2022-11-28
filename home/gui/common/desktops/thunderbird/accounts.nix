{ pkgs, ... }:

let
  realName = "Guilherme Paixão";
  SMTP = {
    gandi = {
      host = "mail.gandi.net";
      port = 465;
    };
    gmail = {
      host = "smtp.gmail.com";
      port = 465;
    };
  };
  IMAP = {
    gandi = {
      host = "mail.gandi.net";
      port = 993;
    };
    gmail = {
      host = "imap.gmail.com";
      port = 993;
    };
  };
in
{
  accounts.email.accounts = {

    "me@guip.dev" = {
      inherit realName;
      primary = true;
      userName = "me@guip.dev";
      smtp = SMTP.gandi;
      imap = IMAP.gandi;
      thunderbird = {
        enable = true;
      };
    };

    "guircp@usp.br" = {
      inherit realName;
      userName = "guircp@usp.br";
      smtp = SMTP.gmail;
      imap = IMAP.gmail;
      thunderbird = {
        enable = true;
      };
    };

    "guipaixao2000@gmail.com" = {
      inherit realName;
      primary = true;
      userName = "guipaixao2000@gmail.com";
      smtp = SMTP.gmail;
      imap = IMAP.gmail;
      thunderbird = {
        enable = true;
      };
    };

  };
}
