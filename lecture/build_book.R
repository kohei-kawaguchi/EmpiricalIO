# restart the session
.rs.restartR()

# set the working directory
setwd("lecture")

# serve book
bookdown::serve_book(dir = ".")
file.create("../docs/.nojekyll")

# render html book
bookdown::render_book("index.Rmd", "bookdown::gitbook")

# render pdf book
bookdown::render_book("index.Rmd", "bookdown::pdf_book")

# publish book on RStudio Connect
bookdown::publish_book()
