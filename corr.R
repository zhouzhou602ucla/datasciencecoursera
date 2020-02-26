library(readr)
corr <- function(directory, threshold = 0) {
  correlation <- NA
  dt <- complete(directory)
  for (i in 1:nrow(dt)) {
    if (dt$nobs[i] > threshold) {
      dir <- paste0(getwd(), "/", directory, "/")
      file_list <- list.files(dir)
      file_num <- dt$id[i]
      file <- read_csv(paste0(dir, file_list[file_num]))
      df <- file[complete.cases(file),]
      correlation[i] <- cor(df$sulfate, df$nitrate)
    } else {
      length(NULL)
    }
  }
  correlation <- na.omit(correlation)
}