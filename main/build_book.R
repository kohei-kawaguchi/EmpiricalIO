# Clear environment and restart R
rm(list = ls())  # clear environment
if(exists(".rs.restartR")) {
  .rs.restartR()
} else {
  # Alternative approach if not in RStudio
  try(dev.off(), silent = TRUE)  # clear plots
  gc()  # garbage collection
}

file.create("docs/.nojekyll")

# serve book - fixed directory path
bookdown::serve_book(dir = "lecture")

# render html book
bookdown::render_book(
  input = "lecture/index.Rmd", 
  output = "bookdown::gitbook",
  clean = TRUE
)

# render pdf book
bookdown::render_book(
  input = "lecture/index.Rmd", 
  output = "bookdown::pdf_book",
  clean = TRUE
)

