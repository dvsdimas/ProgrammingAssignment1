complete <- function(directory, id = 1:332) {
 
    for (letters in list.files()) {
        if(identical(letters, directory)){
            setwd(directory)
        }
    }
 
    result <- data.frame("id" = integer(0), "nobs" = integer(0))   
    
    for (i in seq_along(id)) {
        
        number_str <- paste(id[i])
        number_len <- nchar(number_str) 
        
        prefix <- ""
        
        if(number_len == 1) {
            prefix <- "00"
        } else if(number_len == 2) {
            prefix <- "0"
        } 
        
        name <- paste(prefix, id[i], ".csv", sep = "")
        
        result[i,1] <- id[i]
        
        data <- read.csv(name)    
        
        good_data <- data[complete.cases(data[,2:3]),]
        
        result[i,2] <- nrow(good_data)
        
    }
    
    result 
}