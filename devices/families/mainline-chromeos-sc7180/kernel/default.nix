{ mobile-nixos
, fetchzip
, fetchpatch
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.12.19";
  configfile = ./config.aarch64;

  src = fetchzip {
    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
    hash = "sha256-9Uq2kgoSe42EPUEwlEP2ai8c8VFl+aZ/DTPrwBHagyY=";
  };

  patches = [
    ./stop_unconditionally_power_dsi.patch

    ./readd_mrbland_rev1.patch

    ./remove_bwmon_nodes.patch
  ];

  isModular = true;
  isCompressed = false;
}
