{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.elixir_1_14
    pkgs.erlangR25
    pkgs.smlnj
  ];
}
