pollutantmean <- function (directory, pollutant, id = 1:332) {

  # Get the vector with the file names
  files <- paste0 (directory, "/", formatC(id, width = 3, flag = 0), ".csv")

  # Initialize the data frame with all data
  pollution_df <- data.frame()
  
  # Go through every file in id vector
  for (i in files) {
    # Read file into data frame
    my_data <- read.csv(i)
    
    # Append to the end of the total data
    pollution_df <- rbind(pollution_df, my_data)
    
  }
  
  print (mean(pollution_df[[pollutant]],na.rm = TRUE))
  
}
