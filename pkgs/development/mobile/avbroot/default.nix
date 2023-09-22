{ lib, rustPlatform, fetchFromGitHub, pkg-config, bzip2, xz }:
rustPlatform.buildRustPackage rec {
  pname = "avbroot";
  version = "v2.1.0";

  src = fetchFromGitHub {
    owner = "chenxiaolong";
    repo = pname;
    rev = version;
    sha256 = "sha256-WZ0ZvC7p4HLjKgKBMME0t/3OF24P6npGGYd+LKXDCUA=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "lzma-sys-0.1.20" = "sha256-BEtDeRkuPokSemSJc+2g/6hbTwu1uR5Bm5R96MVTvoc=";
      "zip-0.6.6" = "sha256-oZQOW7xlSsb7Tw8lby4LjmySpWty9glcZfzpPuQSSz0=";
      "bzip2-0.4.4" = "sha256-6VOKPlgIIibpcvxSL9Y+wKre6h2J2s+dGOhCA9pAVwg=";
    };
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ bzip2 xz ];

  meta = {
    description = "Sign (and root) Android A/B OTAs with custom keys while preserving Android Verified Boot";
    homepage = "https://github.com/chenxiaolong/avbroot";
    license = lib.licenses.gpl3;
    maintainers = [ lib.maintainers.rvfg ];
  };
}
