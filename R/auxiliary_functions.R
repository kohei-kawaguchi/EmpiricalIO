# browse data
br <- function(x, file = "temporary") {
  x <- as.data.frame(x)
  rnd <- sample(1:100, 1)
  file <- paste(file, rnd, ".csv", sep = "")
  write.csv(x, file)
  command <- paste('open', file, sep = ' ')
  system(command)
}