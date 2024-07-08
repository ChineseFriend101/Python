{ config, pkgs, ... }:

{
  imports =
    [
      ./core/default.nix
      ./optional/greetd.nix
      ./optional/peripherals.nix
      ./optional/gaming.nix
      ./optional/misc.nix
    ];
}
