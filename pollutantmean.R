library(readr)
pollutantmean <- function(directory, pollutant, id = 1:332){
                  directory <- paste0(getwd(),"/",directory,"/")
                  file_list <- list.files(directory) ## list all the files 
                  data <- NA
                  for (i in id) { ## for each number in id, get the data and append them
                    file_dir <- paste0(directory,file_list[i])
                    file_data <- read_csv(file_dir)
                    data <- rbind(data, file_data)
                  } 
                  mean(data[[pollutant]],na.rm = TRUE)
}