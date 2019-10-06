#' walk2 
#' 
#' Given index \code{i}, \code{j} and the coordinates list \code{z}, generate the corresponding ggplot aesthetics
#' 
#' @param i, the first index
#' @param j, the second index
#' @param z, the coordinates list extracted from dataset
#' @return  the corresponding ggplot aesthetics including geo coordinates
#' @examples
#' x<-ICU$new(land="world-2",date="1984-11")   ## New class
#' z<-x$guo$Countries$coordinates
#' ggplot()+walk2(164,1,z)  ## the first area of Finland
#' 


walk2<-function(i,j,z){  ## Go through one by one
  #da<-convertDF(z[[i]])
  da<-as.data.frame(unlist(z[[i]][[j]]))
  geom_polygon(data=da,aes(x=da[[1]],y=da[[2]]))
}