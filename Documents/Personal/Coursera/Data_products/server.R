temperatureAt <- function(altitude) 15-.0065*altitude

speedOfSoundAt <- function(temperature) sqrt(1.4*8.31432/.0289645*(temperature+273.15))

deltaAt <- function(temperature) ((temperature+273.15)/288.15)^(9.80665/.0065/(8.31432/0.0289644))

sigmaAt <- function(height) (1-.0065*height/288.15)^(9.80665/.0065/(8.31432/0.0289644)-1)

shinyServer(
   function(input, output){
      output$altitude <- renderPrint({input$alt})
      temp <- reactive({temperatureAt(input$alt*.3048)})
      output$temperature <- renderText({temp()})
      output$speedOfSound <- renderText({
         if (input$units == 'english') paste(speedOfSoundAt(temp())/.3048,"ft/s")
         else paste(speedOfSoundAt(temp()),"m/s")
      })
      output$delta <- renderText({
         if (input$units == 'ratio') paste(deltaAt(temp()),"delta")
         else if (input$units == 'metric') paste(deltaAt(temp())*101325,"Pascals (N/m^2)")
         else paste(deltaAt(temp())*2116.21662367394,"psf (lb/ft^2)")
      })
      output$sigma <- renderText({
         if (input$units == 'ratio') paste(sigmaAt(input$alt*.3048),"sigma")
         else if (input$units == 'metric') paste(sigmaAt(input$alt*.3048)*1.225,"kg/m^3")
         else paste(sigmaAt(input$alt*.3048)*.0023769,"slug/ft^3")
      })
   }
)