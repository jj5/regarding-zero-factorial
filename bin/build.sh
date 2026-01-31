#!/bin/bash

main() {

    set -euo pipefail;

    cd -- "$(dirname -- "$(readlink -f -- "$0")")/.."

    pushd tex

        rm_tex

        pdflatex paper.tex
        bibtex paper
        pdflatex paper.tex
        pdflatex paper.tex

        rm_tex

        mv paper.pdf ../pdf/regarding-zero-factorial.pdf

    popd

}

rm_tex() {

    rm -f paper.aux paper.bbl paper.blg paper.log paper.out texput.log

}

main "$@";
