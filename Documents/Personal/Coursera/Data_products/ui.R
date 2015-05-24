shinyUI(
   pageWithSidebar(
      # Application title
      headerPanel("Standard Atmosphere Calculator"),
      
      sidebarPanel(
         helpText('This application implements the 1976 Standard Atmosphere model and displays the properties of the air at an altitude that the user specifies.  It is useful for aircraft engineers who need to know the pressure, density and temperature at a given flight condition.'),
         helpText("Typically, the aviation industry uses feet for altitude, so the input is always in feet.  The output units are selectable to accomodate the engineer's preference."),
         h3('Altitude Input'),
         numericInput('alt','Altitude (ft)', 0, min=-2000, max=36089.2, step=1000),
         radioButtons('units','Units:',
                      c('Ratio'='ratio',
                        'Metric'='metric',
                        'English'='english'))
         ),
      mainPanel(
         h3('Standard Atmosphere Conditions'),
         h4('Altitude (ft) input by user'),
         verbatimTextOutput("altitude"),
         h4('Temperature (°C)'),
         verbatimTextOutput("temperature"),
         h4('speed of sound'),
         verbatimTextOutput("speedOfSound"),
         h4('pressure'),
         verbatimTextOutput("delta"),
         h4('density'),
         verbatimTextOutput("sigma"),
         helpText('The output of this program can be compared to the calculator at this url:'),
         helpText(a("http://www.digitaldutch.com/atmoscalc/",href="http://www.digitaldutch.com/atmoscalc/")
         )
      )
   )
)