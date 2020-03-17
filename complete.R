complete <- function(directory, id = 1:332) {
  # Store the previous working directory and change to the data directory
  old_dir <- getwd ()
  setwd(directory)
  
  # Initialize the data frame for the result
  complete_rows <- data.frame(id = integer(), nobs = integer ())
  
  # Get the list of files in the directory
  files <- list.files()
  
  # Extract the subset for the indicated IDs
  files <- files [id]
  
  # Recorremos todos los ficheros
  for (i in files) {
    # Read file into data frame
    my_data <- read.csv(i)
    
    # Look for complete cases
    good <- complete.cases(my_data)
    my_data <- my_data [good,]
    
    # Get the number of rows
    nobs <- nrow(my_data)
    
    # Get the id
    my_id <- as.numeric(substr(i, 1, 3))
    
    # Fill the result Dataframe
    complete_rows [nrow(complete_rows)+1,] = c(my_id, nobs)
    
    # print (i)
    # print (rows)
  }
  
  # Set working directory back to the previous one
  setwd (old_dir)
  
  # Return the dataframe with results
  complete_rows
  
}