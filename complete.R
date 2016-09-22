complite <- function(directory, id = 1:332) {
 
    for (letters in list.files()) {
        if(identical(letters, directory)){
            setwd(directory)
        }
    }
 
    result <- data.frame("id" = integer(0), "nobs" = integer(0))   
    
       
    result[1,1] <- 34
    result[1,2] <- 43
    
    result
}