### Assignmet week 2

## Creo un mapa interactivo con leaflet y una aplicacion que lo abre y modifica con shiny

library(shiny)
library(leaflet)

ui <- fluidPage(
        textOutput("text1"),
        textOutput("text2"),
        textOutput("text3"),
        leafletOutput("mymap"),
        numericInput('lat', 'Please, enter latitude', 39.2980803),
        numericInput('lon', 'Please, enter longitude', -76.5898801),
)

server <- function(input, output) {
        
                output$text1 <- renderText("Assignment week 2 - Interactive Map")
                output$text2 <- renderText("Manuel Mariscal")
                output$text3 <- renderText("Date: 10/03/2020")
      
            output$mymap <- renderLeaflet({
               my_map <- leaflet() 
               my_map <- addTiles(my_map)
               my_map <- addMarkers(my_map, lat=input$lat, lng=input$lon, popup="Your mark")
})
               
        
}

shinyApp(ui, server)
