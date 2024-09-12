{ lib
, stdenv
, fetchurl
}:
stdenv.mkDerivation rec {
  pname = "hello";
  version = "2.12";

  src = fetchurl {
    url = "mirror://gnu/hello/${pname}-${version}.tar.gz";
    sha256 = "sha256-zwSvhtwIUmjF9EcPuuSbGK+8Iht4CWqrhC2TSna60Ks=";
  };

  postPatch = ''
    sed -i -e 's/Hello, world/Greetings from annt@nurpkgs/' src/hello.c
  '';

  # disable checks as we are patching
  doCheck = false;

  meta = with lib; {
    description = "A small greeting via the console.";
    longDescription = ''
      A modified version of the GNU hello program that prints a greeting
    '';
    homepage = "https://www.gnu.org/software/hello/manual";
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.anntnzrb ];
    platforms = platforms.all;
  };
}
