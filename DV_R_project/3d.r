# Install and load required packages
if (!requireNamespace("shiny", quietly = TRUE)) {
  install.packages("shiny")
}
if (!requireNamespace("rgl", quietly = TRUE)) {
  install.packages("rgl")
}
library(shiny)
library(rgl)

# Define the Shiny app
shinyApp(
  ui = fluidPage(
    titlePanel("3D Scatter Plot in R Shiny"),
    mainPanel(
      rglwidgetOutput("plot3d")
    )
  ),
  server = function(input, output) {
    # Generate more random 3D data (500 points)
    data <- data.frame(
      Movie_id = rnorm(500),
      Ratings = rnorm(500),
      User_id = rnorm(500)
    )
    
    # Calculate positive limits for all axes
    xlim <- range(pmax(0, data$Movie_id))
    ylim <- range(pmax(0, data$Ratings))
    zlim <- range(pmax(0, data$User_id))
    
    # Render the 3D plot with positive axis limits
    output$plot3d <- renderRglwidget({
      plot3d(Movie_id, Ratings, User_id, col = "blue", size = 10,
             xlim = xlim, ylim = ylim, zlim = zlim)
      rglwidget()
    })
    
    # Clean up resources when the app is closed
    onStop(function() {
      rgl.postscript("output.png", fmt = "png")
      rgl.close()
    })
  }
)
