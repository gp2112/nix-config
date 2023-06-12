{ stdenv, lib, fetchzip, substituteAll }:


stdenv.mkDerivation rec {
  pname = "netkit";
  version = "2.8";

  src = fetchzip {
    url = "http://www.lsec.icmc.usp.br/livronetkitbr/${pname}-${version}.tar.bz2";
    hash = "sha256-DC9PK2d636Zk7lOTqcIa75IA0zhwo2iJCT+VNiwGI8Q=";
  };


  buildPhase = ''
  '';

  installPhase = ''
    mkdir $out
    cd $out
    cp -r $src/bin ./
    chmod a+w -R $out/bin
    mkdir share
    cp -r $src/man ./share
  '';

}
