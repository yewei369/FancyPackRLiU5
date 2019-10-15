#' ICU 
#' 
#' Given \code{land}, data form \code{module} and \code{date}, show the map of an entity under special period
#' 
#' @param land, a data source or category
#' @param module, a data form which includes different information
#' @param date, special date when the entity existed
#' @return a set rawData including info such as id, name, type and coordinates etc 
#' @examples
#' x<-ICU$new(land="se-7",date="2015-11")
#' x$visa("stockholm")

ICU<-setRefClass("ICU",
  fields=list(land="character",
              date="character",
              #mode="character",
              #find="character",
              #language="character",
              guo="list"),               
  
   
  
  methods=list( 
     
    
    initialize=function(land="character",date="character",guo="list"){
      options(stringsAsFactors = FALSE) # Turn off automatical conversion of text factoring
      require(httr)
      require(jsonlite)
      require(ggplot2)
      
      info<-rawData(land,"info",date)$description     ## Info
      enti<-as.data.frame(rawData(land,"data",date))  ## Data(id+name)
      #if(mode=="geo")
      {gj<-rawData(land,"geo",date)                   ## GEO(id+coordinates)
      
      }
      #rawData(land,"geo",date)
      #if(mode=="svg)
      
      guo<<-list(Description=info,Entities=enti,Countries=gj)
    
     },
  
  
  
    visa=function(aim,ind=FALSE,di=1){
      if(!is.character(aim)) stop("The input should be a character!")
      
      
       z<-x$guo$Countries$coordinates
       enti<-x$guo$Entities
       gj<-x$guo$Countries
       #id<-enti[grep(aim,enti$name,ignore.case=TRUE),]$id
       g<-ggplot()
       
  if(ind==TRUE)
       {draw<-function(i){
         if(is.list(z[[i]])&length(z[[i]])>1)
         { num<-length(z[[i]])
         
         if(length(z[[i]][[1]])==1)  ## New code here starts
         {if(num%%7==0) {telo<-NULL;tela<-NULL
         for(p in 1:num) {if(((p-1)%/%7)%%2==0) telo<-telo+z[[i]][[p]]
         else tela<-telo+z[[i]][[p]]}
         teda<-data.frame(Longitude=telo,Latitude=tela)
         g<-g+geom_polygon(data=teda,aes(x=Longitude,y=Latitude))}
           else {telo<-NULL;tela<-NULL
           for(p in 1:num) {if(((p-1)%/%5)%%2==0) telo<-c(telo,z[[i]][[p]])
           else tela<-c(tela,z[[i]][[p]])}
           teda<-data.frame(Longitude=telo,Latitude=tela)
           g<-g+geom_polygon(data=teda,aes(x=Longitude,y=Latitude))}}## New code here finishes
         
         else {
           for(j in 1:num)
           {if(is.list(z[[i]][[j]])&length(z[[i]][[j]])>1)
           {te<-length(z[[i]][[j]])
           for(k in 1:te) g<-g+walk3(i,j,k,z)}
             else g<-g+walk2(i,j,z)}}}
         else g<-g+walk1(i,z)
         g+xlab("Longitude")+ylab("Latitude")}
       
         draw(di)
         }
   else    
       {i<-grep(aim,enti$name,ignore.case=TRUE)
       #i<-which(gj$id==as.numeric(id))
       
       if(length(i)==0) stop("Unfortunately there is no data for this entity yet...")
       else if(length(i)>1) stop(paste("Sorry! It seems there is more than one ",aim,sep="")) 
       else
       {len<-length(z)
       
       #for(i in 1:len)
       #cat(i)
        {if(is.list(z[[i]])&length(z[[i]])>1)
             {num<-length(z[[i]])
             
             if(length(z[[i]][[1]])==1)  ## New code here starts
             {if(num%%7==0) {telo<-NULL;tela<-NULL
             for(p in 1:num) {if(((p-1)%/%7)%%2==0) telo<-telo+z[[i]][[p]]
             else tela<-telo+z[[i]][[p]]}
             teda<-data.frame(Longitude=telo,Latitude=tela)
             g<-g+geom_polygon(data=teda,aes(x=Longitude,y=Latitude))}
               else {telo<-NULL;tela<-NULL
               for(p in 1:num) {if(((p-1)%/%5)%%2==0) telo<-c(telo,z[[i]][[p]])
               else tela<-c(tela,z[[i]][[p]])}
               teda<-data.frame(Longitude=telo,Latitude=tela)
               g<-g+geom_polygon(data=teda,aes(x=Longitude,y=Latitude))}}## New code here finishes
             
              else {
              for(j in 1:num)
               {if(is.list(z[[i]][[j]])&length(z[[i]][[j]])>1)
                    {te<-length(z[[i]][[j]])
                     for(k in 1:te) g<-g+walk3(i,j,k,z)}
                else g<-g+walk2(i,j,z)}}}
         else g<-g+walk1(i,z)
         g+xlab("Longitude")+ylab("Latitude")      
         }}}
       
       
  },
  
  
    leta=function(){
    
  },
  
    summary=function(){
    ## No entities
  }
  

))