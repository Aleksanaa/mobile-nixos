{ config, lib, pkgs, ... }:

let
  inherit (lib) mkIf mkMerge mkOption types;
  inherit (pkgs) imageBuilder;
  cfg = config.mobile.hardware.socs;
in
{
  options.mobile = {
    hardware.socs.allwinner-a64.enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable when SOC is Allwinner A64";
    };
    hardware.socs.allwinner-r18.enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable when SOC is Allwinner-R18";
    };
  };

  config = mkMerge [
    {
      mobile = mkIf cfg.allwinner-a64.enable {
        system.system = "aarch64-linux";
      };
    }
    {
      mobile = mkIf cfg.allwinner-r18.enable {
        system.system = "aarch64-linux";
      };
    }
  ];
}
