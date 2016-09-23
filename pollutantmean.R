pollutantmean <- function(directory, pollutant, id = 1:332) { # pollutant == sulfate | nitrate
    
    for (letters in list.files()) {
        if(identical(letters, directory)){
            setwd(directory)
        }
    }
    
    results <- vector("double", length = length(id))
    names <- vector("character", length = length(id))
    
    for (i in seq_along(id)) {
        
        number_len <- nchar(paste(id[i])) 
        
        prefix <- ""
        
        if(number_len == 1) {
            prefix <- "00"
        } else if(number_len == 2) {
            prefix <- "0"
        } 
        
        names[i] <- paste(prefix, id[i], ".csv", sep = "")
    }
    
    row <- double(0)
    
    for (letters in names) {
    
        data <- read.csv(letters)    
    
        row <- c(row, as.vector(data[[pollutant]]))
    }
    
    round(mean(row, na.rm = TRUE), digits = 3)
    
    #row
}

