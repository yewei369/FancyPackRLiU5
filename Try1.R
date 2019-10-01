library(httr)
library(jsonlite)
#GET" request to the API to pull raw data



    
    r <- GET("http://api.thenmap.net/v2/us-4/geo/2019-10-01")
   #Response Object
    r 
     
     #Status code 
     status_code(r)
#200 means successful
     
     headers(r)
     
#Content
     content(r, "text")
     content(r, "raw")
     content(r, "parsed")
     str(content(r))

 # http status 
     http_status(r)
     
     
    # parse the data to jason format 
     r_json <- fromJSON("http://api.thenmap.net/v2/us-4/geo/2019-10-01", flatten = TRUE)
     r_df <- as.data.frame(r_json)
  View(r_df)
