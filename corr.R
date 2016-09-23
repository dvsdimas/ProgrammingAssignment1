corr <- function(directory, threshold = 0) {
    
    for (letters in list.files()) {
        if(identical(letters, directory)){
            setwd(directory)
        }
    }
    
    result <- numeric(0)
    
    files <- list.files()
    
    for (i in seq_along(files)) {
        
        data <- read.csv(files[i])    
        
        good_data <- data[complete.cases(data[,2:3]),]
        
        if ( nrow(good_data) > threshold ) {
            result <- c(result, cor(good_data$sulfate, good_data$nitrate))
        }
        
    }
    
    result
}