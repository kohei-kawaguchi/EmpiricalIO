# Clear environment and restart R
rm(list = ls())  # clear environment
if(exists(".rs.restartR")) {
  .rs.restartR()
} else {
  # Alternative approach if not in RStudio
  try(dev.off(), silent = TRUE)  # clear plots
  gc()  # garbage collection
}

# Create .nojekyll file for GitHub Pages
file.create("docs/.nojekyll")

# serve book - fixed directory path
bookdown::serve_book(dir = "lecture")

# render html book
bookdown::render_book(
  input = "lecture", 
  output_format = "bookdown::gitbook",
  clean = TRUE
)

# render pdf book
bookdown::render_book(
  input = "lecture", 
  output_format = "bookdown::pdf_book",
  clean = TRUE
)

