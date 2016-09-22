pollutantmean <- function(directory, pollutant, id = 1:332) { # pollutant == sulfate | nitrate
    
    for (letters in list.files()) {
        if(identical(letters, directory)){
            setwd(directory)
        }
    }
    
    results <- vector("double", length = length(id))
    names <- vector("character", length = length(id))
    
    for (i in id) {
        
        number_str <- paste(i)
        number_len <- nchar(number_str) 
        
        prefix <- ""
        
        if(number_len == 1) {
            prefix <- "00"
        } else if(number_len == 2) {
            prefix <- "0"
        } 
        
        names[i] <- paste(prefix, i, ".csv", sep = "")
    }
    
    for (i in seq_along(names)) {
    
        data <- read.csv(names[i])    
    
        results[i] <- mean(data[,pollutant], na.rm = TRUE) 
    }
    
    mean(results)
}

