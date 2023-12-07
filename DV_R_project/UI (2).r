#User
# UI Defined 
# Loading the libraries
library(shiny)
library(shinythemes)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),
  tags$head(
    tags$style(HTML("
      body {
        background-color:white; /* Dark background color */
        color: black; /* Text color */
      }
      
      p {
        font-size: 18px;
        line-height: 1.5;
        margin-bottom: 60px;
        margin-left: 50%;
        text-align:center;
      }
        .get-started-btn {
        background-color: skyblue;
        color: black;
        margin-left: 66%;
        border: none;
        padding: 15px 30px;
        font-size: 18px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        text-decoration: none;
      }
      .get-started-btn:hover {
        background-color: lightpink;
        text-decoration: none;
      }
      h3 {
        display: flex;
        text-align: center;
        color: balck;
      }
      .navbar {
        background-color: red;
        color: blue; 
        border-color: black; /* Navbar border color */
      }
      .navbar-brand {
        color: white !important; /* Brand text color */
      }
      .nav-item {
        padding: 0.5rem 1rem;
      }
      .nav-link {
        color: white !important; /* Navbar link color */
      }
      .sidebarPanel {
        background-color: gray; /* Sidebar background color */
        padding: 20px; /* Adjust padding as needed */
      }
      .sidebarPanel img {
        width: 100%; /* Make the image fill the width of the sidebar */
        margin-bottom: 20px;
      }
      .mainPanel {
        padding: 20px; /* Adjust padding as needed */
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
      }
      .image-container {
        display: flex;
        margin-top:10%;
        justify-content: center;
        padding-bottom: 10%;
        gap: 30px;
        margin-left: 55%;
      }
      .image-container img {
        animation: pulse 3s ease-in-out infinite;
        width: 150px;
        height: auto;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.8); 
      }
      @keyframes pulse {
        0%, 100% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.1);
        }
      }
    "))
  ),
  
  navbarPage(
    "Movie Recommendation System", tabsetPanel(
      id="myTabs",
    
    tabPanel("Main",
             mainPanel(
               div(class = "image-container",
                   tags$img(src = "https://tse3.explicit.bing.net/th?id=OIP.dk5Ce3mDA_dk1We_RRHFaQHaK9&pid=Api&P=0&h=220"),
                   tags$img(src = "https://tse4.mm.bing.net/th?id=OIP.kaWlyOTz9kGJ5T3BA6H1qAHaK-&pid=Api&P=0&h=220"),
                   tags$img(src = "https://tse1.mm.bing.net/th?id=OIP.1VcphvNI_qXJxJNBDRdLgwHaKe&pid=Api&P=0&h=220"),
                   tags$img(src = "https://tse1.mm.bing.net/th?id=OIP.kywoYBM8O35Zevbd_HuMkAHaLR&pid=Api&P=0&h=220"),
                   tags$img(src = "https://tse1.mm.bing.net/th?id=OIP.lnHjw0P1qu_xmSL7kDR4FgHaK2&pid=Api&P=0&h=220"),
                   tags$img(src = "https://tse4.mm.bing.net/th?id=OIP.YoKLp53tsNY6BQJ0fYy12wHaK9&pid=Api&P=0&h=220"),
               ),
               div(class = "welcome-container",
                   p("Explore and discover new movies based on your preferences."),
                   actionButton(class="get-started-btn","GetStarted1","Get Started")
               )
             )
    ),
    tabPanel("Recommendation", 
             sidebarPanel(
               selectInput("dropdown1", "Select an option:",
                           c("Select Genre", "Action", "Adventure", "Animation", "Children")),
               selectInput("dropdown3", "X coordinate",
                           c("userId", "movieId", "timestamp", "rating")),
               selectInput("dropdown4", "Y coordinate",
                           c("userId", "movieId", "timestamp", "rating")),
               selectInput("dropdown2", "Select a graph:",
                           c("Select Chart", "Bar-Chart", "Heat-Map", "Scatter-Plot", "Line-Plot"))
             ),
           
             mainPanel(
               h3("Movies Recommended according to Your genre:"),
               textOutput("selected_val"),
               plotOutput("selected_val2"),
             )
    ),
    
    tabPanel("3-D graph",
             mainPanel(
               source("D:/DV_R_project/3d.r"),
               plotOutput("selected_val3")
             )),
    
    
  ))

)