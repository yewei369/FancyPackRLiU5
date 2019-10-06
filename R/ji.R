#' ji 
#' 
#' Given a numeric vector \code{x}, generate the product of all elements
#' 
#' @param x, a numeric vector
#' @return the product of all elements
#' @examples
#' x<-c(1,2,3)
#' ji(x)   ## result is 6
#' 

ji<-function(x){
  len<-length(x)
  re<-1
  for(i in 1:len) re<-re*x[i]
  return (re)
}