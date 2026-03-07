{ mobile-nixos
, fetchzip
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.12.76";
  configfile = ./config.aarch64;

  src = fetchzip {
    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
    hash = "sha256-GnC2A8ja45gifcnkmT4LcorgFWr6pBLoWlT95eD1rEA=";
  };

  patches = [
    ./stop_unconditionally_power_dsi.patch

    ./readd_mrbland_rev1.patch

    ./remove_bwmon_nodes.patch

    ./fix_compat_old_hj110iz.patch
  ];

  isModular = true;
  isCompressed = false;
}
