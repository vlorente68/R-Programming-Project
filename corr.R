corr <- function (directory, threshold = 0) {
  # Initialize the vector of correlations
  correlations <- vector('numeric')
  
  # Call the function complete to get list of Ids and the complete measurements
  id_obs <- complete(directory)
  
  # Subset nobs to get the files that are over the threshold
  id_obs <- id_obs[id_obs$nobs > threshold,]
  print (nrow(id_obs))
  
  if (nrow(id_obs) > 0) {
    #Sacamos los id que nos interesan en un vector
    id <- id_obs$id
  
    # Get the vector with the file names
    files <- paste0 (directory, "/", formatC(id, width = 3, flag = 0), ".csv")
  
    # Go through every file in id vector
    for (i in files) {
      # Read file into data frame
      my_data <- read.csv(i)
      
      # Calculate Correlation
      id_correlation <- cor( my_data$sulfate, my_data$nitrate, use = "complete.obs")
      correlations <- c(correlations, id_correlation)
      
    }
  }

  # Return the value
  correlations
  
}