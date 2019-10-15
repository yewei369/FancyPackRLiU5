#require(shiny)
library(shiny)
#library(FancyPackRLiU5)

ui <- fluidPage(
  
  titlePanel("Show Map!"),
  sidebarLayout(
    sidebarPanel(
      # Choose dataset
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("world-2","se-7","se-4")),
      ## ,"fi-8", "ch-8", "no-7","no-4","dk-7","us-4","gl-7"
      
      # Type in objective 
      textInput(inputId="aim", label = h4("Entity to show"), value = "Enter entity name..."),
      # Type in date
      textInput(inputId = "date", label = h4("Searching date"), value = "Enter in form of YYYY-MM..."),
      # Type in ~th entity
      textInput(inputId = "index", label = h4("Searching index -prioritized"), value = "Enter the index of entity...")
      
    ),
    
    mainPanel(
      plotOutput(outputId = "visa"),
      verbatimTextOutput(outputId = "id"),
      verbatimTextOutput(outputId = "name"),
      verbatimTextOutput(outputId = "ds")
    )))


server <- function(input, output) {
  datasetInput <- reactive({
    switch(input$dataset,
           "world-2"="world-2","se-7"="se-7","se-4"="se-4")
  })
  
  
  # Show map 
  output$visa <- renderPlot({
    ha<-datasetInput()
    x<-ICU$new(land=ha,date=input$date)
    
    di=as.numeric(input$index)
    if(input$index!="") x$visa(input$aim,ind=TRUE,di)
    else x$visa(input$aim,ind=FALSE)
  })
  # Show id + Formal name
  output$id <- renderPrint({
    #x<-ICU$new(land=input$dataset,date=input$date) 
    z<-x$guo$Countries$coordinates
    enti<-x$guo$Entities
    gj<-x$guo$Countries
    id<-enti[grep(input$aim,enti$name,ignore.case=TRUE),]$id
    cat(paste("This entity has id number of ",id,sep=""))
  }) 
  output$name <- renderPrint({
    #x<-ICU$new(land=input$dataset,date=input$date) 
    z<-x$guo$Countries$coordinates
    enti<-x$guo$Entities
    gj<-x$guo$Countries
    nam<-enti[grep(input$aim,enti$name,ignore.case=TRUE),]$name
    cat(paste("This entity has formal name of ",nam,sep=""))
  }) 
  
  #output$ds <- renderPrint({
    #ha<-datasetInput()
  #  cat(paste(input$dataset,input$date))
  #}) 
  
}


shinyApp(ui = ui, server = server)