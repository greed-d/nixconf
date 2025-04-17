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
    hash = "sha256-bZSLdRfEUmN4+A63ZVaOaK02L85b4nscXk95EU/trF0=";
  };

  installPhase = ''
    mkdir -p $out/share/icons/Suru++-Light
    mkdir -p $out/share/icons/Suru++
    mkdir -p $out/share/icons/eSuru++
    rm -rf *.md *.sh
    cp -r Suru++-Light/* $out/share/icons/Suru++-Light
    cp -r Suru++/* $out/share/icons/Suru++
    cp -r eSuru++/* $out/share/icons/eSuru++
  '';

  meta = with lib; {
    description = "Suru plus plus theme";
    homepage = "https://github.com/gusbemacbe/suru-plus";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
  };
}
