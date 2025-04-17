{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "suru-plus";
  version = "9bd895f324051ed9ba26e5981dd995376e5e572a";

  src = fetchFromGitHub {
    owner = "gusbemacbe";
    repo = pname;
    rev = "9bd895f324051ed9ba26e5981dd995376e5e572a";
    sha256 = "06qzd6wnj5fzhgzaf0gxqxndq73l404dqn23lnqz8pgpzs87250p";
  };

  installPhase = ''
    mkdir -p $out/share/themes/Suru++-Light
    mkdir -p $out/share/themes/Suru++
    mkdir -p $out/share/icons/eSuru++
    rm -rf *.md *.sh
    cp -r Suru++-Light/* $out/share/themes/Suru++-Light
    cp -r Suru++/* $out/share/themes/Suru++
    cp -r eSuru++/* $out/share/icons/eSuru++
  '';

  meta = with lib; {
    description = "Suru plus plus theme";
    homepage = "https://github.com/gusbemacbe/suru-plus";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
  };
}
