book_header = readLines(textConnection('---
title: "Spatial microsimulation with R"
output:
\ \ pdf_document:
\ \ \ \ fig_caption: yes
\ \ \ \ includes: null
\ \ \ \ keep_tex: yes
\ \ \ \ number_sections: yes
\ \ \ \ toc: yes
layout: default
---'))

source("R/functions.R")
Rmd_bind_mod(book_header = book_header)

library(knitr)
library(rmarkdown)

render("book.Rmd", output_format = "pdf_document")
tt <- list.files(pattern = "*.aux|*.toc|*.log|*.lot|*.gz|*.idx|*.ilg|*.ind|*.ggmap", )

source("R/bbuild.R")
system("pdflatex --interaction=nonstopmode  spatial-microsim-book.tex")

for(i in tt){
  system(paste('rm', i))
}

# For website build see gh-pages version
