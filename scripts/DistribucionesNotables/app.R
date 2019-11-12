#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#









library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
            selectInput("dist", "Distribution type:",
                         c("Bernoulli" = "bern",
                           "Geométrica" = "geom")),
            
            # br() element to introduce extra vertical spacing ----
            br(),
            
            sliderInput("p", label = "Probabilidad éxito p:",
                        min = 0.01, max = 0.99, value = 0.25, step = 0.01),
            
            sliderInput("n", label = "Número de repeticiones n:",
                        min = 1, max = 50, value =10 , step = 1)
        
        ),

        # Show a plot of the generated distribution
        mainPanel(
           # Output: Tabset w/ plot, summary, and table ----
           tabsetPanel(type = "tabs",
                       tabPanel("Plot", plotOutput("distPlot")),
                       tabPanel("Summary", verbatimTextOutput("summary")),
                       tabPanel("Table", tableOutput("table"))
           )
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    
    d <- reactive({
        switch(input$dist,
               binom = rbinom(10000, n = input$n, prob=input$p),
               geom = rgeom(input$n, prob=input$p))
    })
    
    
    output$distPlot <- renderPlot({
        par(mfrow=c(1,2))
        n=input$n
        p=input$p
        
        aux=rep(0,(n+1)*2)
        aux[seq(2,(n+1)*2,2)]=dbinom(c(0:n),size=n,prob=p)
        
        plot(x=c(0:n),y=dbinom(c(0:n),size=n,prob=p),
             ylim=c(0,1),xlim=c(-1,n+1),xlab="x",
             main=paste0(c("Función de probabilidad\n B(n=",n,",p=",p,")"),collapse = ""))
        
        lines(x=rep(0:n,each=2),y=aux, type = "h", lty = 2,col="blue")
        
        curve(pbinom(x,size=n,p=p),
              xlim=c(-1,input$n+1),col="blue",
              main=paste0(c("Función de distribución\n B(n=",input$n,",p=",p,")"),
                          collapse = ""))
        
        par(mfrow=c(1,1))
    })
    
    
    output$summary <- renderPrint({
        summary(d())
    })
    
    output$table <- renderTable({
        d()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
