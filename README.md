# adocao

[![Travis-CI Build Status](https://travis-ci.org/abjur/adocao.svg?branch=master)](https://travis-ci.org/abjur/adocao)

This package _wraps up_ the results of the project "Tempo dos Processos Relacionados À Adoção no Brasil" (or Adoption Times in Brazil), executed with support of the [National Council of Justice](cnj.jus.br).

## Organização do repositório

This repo is, at the same time, both a [package](http://r-pkgs.had.co.nz/) and a  [bookdown](https://bookdown.org/yihui/bookdown/). The files are organized as follows:

-   `index.Rmd` file has some nice tips on how to print images and render tables using this template.
-   `xx-yyyy.Rmd` files will have the contents of your book. May the tidyverse be with you.
-   `abj_book.Rproj` is the R project file. You should rename it to the name of your github repo.
-   `bibliography` folder has the `.bib` files. We recommend you to change the `book.bib` file inside it.
-   `_output.yml` is used to configure outputs. If you are using more than one output, you should compile `index.Rmd` with `Ctrl+Shift+B` (build button) instead of knit.
-   `_bookdown.yml` configures chapters naming scheme and other bookdown options. Don't change the defaults unless you really need to do that.
-   `imgs` folder is used to store all your images in `png`, `jpg` or even `pdf`.
-   `latex` folder has some additional configuration files to use ABJ pdf template. Don't change it.
-    `DESCRIPTION` and `NAMESPACE` configure the installation of this package.
-    `R` stores the functions of this package.
