library(readr)
complete <- function(directory, id = 1:332) {
  id_list <- NA ## create an empty list to store ID
  nobs_list <- NA ## create an empty list to store num of obs
  dir <- paste0(getwd(), "/", directory, "/")
  file_list <- list.files(dir)
  for (i in id) {
    id_list[i] <- i
    file <- read_csv(paste0(dir, file_list[i]))
    dt <- file[complete.cases(file), ]
    nobs_list[i] <- nrow(dt)
  }
  dt.frame <- cbind(id_list, nobs_list)
  df <- as.data.frame(na.omit(dt.frame))
  colnames(df) <- c("id", "nobs")
  df
}