# My Nix Config

My nixos configs

If you want to know more about it, read the [HOWTO.md](https://github.com/gp2112/nix-config/blob/main/HOWTO.md) or the [nix-starter-config](https://github.com/Misterio77/nix-starter-config).

And a special thanks to [Misterio](https://github.com/Misterio77), for showing me NixOS for the first time and all the support :)

## My Setup:

* Frostbyte - The gaming PC
  * **CPU:** Intel Core I5-6500 @ 3.6 GHz
  * **GPU:** Sapphire ATI Radeon RX 480 4GB
  * **RAM:** 16 GB DDR4 (2x8GB)
  * **Storage:** SSD 256GB Kingston + HDD 1TB Seagate SATA III 7200 rpm
  * **MOBO:** MSI Morthar Arctic B150M
  
* Slowdive - The Laptop
  * **Model:** Asus zenbook 
  * **CPU:** Intel Core I5-8250U
  * **RAM:** 8GB LPDDR3 (1x8GB)
  * **Storage:** 256GB SSD

* Rasp - My Homeserver :v
  * Just a Raspberry PI
  * **Model:** 4
  * **RAM:** 8GB LDDR3
  * **Storage:** 32 GB SD Card + 1TB HDD USB

## How to reproduce?

It's very easy to reproduce my entire config in your machine using NixOS!

### NixOS Configure (system):

`sudo nixos-rebuild switch --flake github:gp2112/nix-config#HOSTNAME`

### Home Manager Config:

`home-manager switch --flake github:gp2112/nix-config#USER@HOSTNAME`
