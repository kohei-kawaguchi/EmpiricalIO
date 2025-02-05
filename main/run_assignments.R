# Script to run all Rmd files in the assignment directory
devtools::load_all()

# Get list of all Rmd files in assignment directory
rmd_files <- 
  list.files(
    path = "assignment",  
    pattern = "\\.Rmd$",
    full.names = TRUE
  )

# Render each file
for (
  file in rmd_files
  ) {
  render_file(
    file_path = file
  )
}

message("Finished rendering all Rmd files")