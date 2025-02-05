# browse data
br <- 
  function(
    x, 
    file = "temporary"
  ) {
    x <- as.data.frame(x)
    rnd <- sample(1:100, 1)
    file <- paste(file, rnd, ".csv", sep = "")
    write.csv(x, file)
    command <- paste('open', file, sep = ' ')
    system(command)
}

# Function to compile a single chapter
compile_chapter <- 
  function(
    chapter_path
  ) {
    # Validate file exists
    if (!file.exists(chapter_path)) {
      stop("Chapter file not found: ", chapter_path)
    }
    
    # Get the output filename (same name but with .html extension)
    output_file <- sub("\\.Rmd$", ".html", basename(chapter_path))
    output_dir <- dirname(chapter_path)
    
    # Render the chapter
    rmarkdown::render(
      input = chapter_path,
      output_format = rmarkdown::html_document(),
      output_file = output_file,
      output_dir = output_dir
    )
    
    message("Successfully compiled: ", file.path(output_dir, output_file))
}