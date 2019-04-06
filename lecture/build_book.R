# restart the session
.rs.restartR()
file.create("../docs/.nojekyll")

# set the working directory
setwd("lecture")

# serve book
bookdown::serve_book(dir = ".")


# render html book
bookdown::render_book("index.Rmd", "bookdown::gitbook")

# render pdf book
bookdown::render_book("index.Rmd", "bookdown::pdf_book")

