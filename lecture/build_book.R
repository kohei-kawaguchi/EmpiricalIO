# restart the session
.rs.restartR()
file.create("docs/.nojekyll")

# set the working directory
setwd("lecture")

# serve book
bookdown::serve_book(dir = ".")

# render html book
bookdown::render_book(
  input = "index.Rmd", 
  output = "bookdown::gitbook",
  clean = TRUE
  )

# render pdf book
bookdown::render_book(
  input = "index.Rmd", 
  output = "bookdown::pdf_book",
  clean = TRUE
  )

