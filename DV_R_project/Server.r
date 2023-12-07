# Define Server Function
server <- function(input, output,session) {
  

  
  x <- reactiveVal(1)  # Create a reactive value to store the user index
  observeEvent(input$GetStarted1, {
    updateTabsetPanel(session,inputId = "myTabs", selected = "Recommendation")
  })
  
observe({
       if (input$dropdown1 == "Adventure") 
       {  x(1)
          }
       else if (input$dropdown1 == "Action")
         {  x(2) }
       else if (input$dropdown1 == "Children")
         {  x(3) }
       else if (input$dropdown1 == "Animation")
         {  x(4) }
       else if (input$dropdown1 == "Select Genere")
         {  return(NULL) }
        })

  
output$selected_val <- renderText({
    user_index <- x()  # Retrieve the user index from the reactive value
    
    user1 <- predicted_recommendations@items[[user_index]]
    movies_user1 <- predicted_recommendations@itemLabels[user1]
    movies_user2 <- movies_user1
    
    for (index in 1:5)
      {
         movies_user2[index] <- as.character(subset(movie_data,movie_data$movieId == movies_user1[index])$title)
      }
    
    i<- c("1:-","2:-","3:-","4:-","5:-")
    if (input$dropdown1 == "Adventure" || input$dropdown1 == "Action" || input$dropdown1 == "Animation" || input$dropdown1 == "Children") 
      {
      paste(i,movies_user2, collapse=", ")
      }
  })
  
  output$selected_val2 <- renderPlot({
    
    x_value <- input$dropdown3
    y_value <- input$dropdown4
    
    r1<-head(rating_data,50)
    if (input$dropdown2 == "Bar-Chart") 
     { 
        barplot(r1[,x_value], r1[ ,y_value])
     }
    else if (input$dropdown2 == "Heat-Map")
     {
      movie_similarity <- similarity(ratingMatrix[, 1:4], method =
                                       "cosine", which = "items")
      as.matrix(movie_similarity)
      
      image(as.matrix(movie_similarity), main = "Movies similarity")
     }
    else if (input$dropdown2 == "Line-Plot")
     {
        plot(r1[ ,x_value], r1[ ,y_value], type = "o")
     } 
    else if(input$dropdown2 == "Scatter-Plot")
     {
        plot(r1[,x_value], r1[ ,y_value])
     }
  })
  
  output$selected_val3 <- renderPlot({
    rglwidgetOutput("plot3d")
  })
  

}

shinyApp(ui = ui, server = server)
