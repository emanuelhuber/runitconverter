
shinyAppUI  <- shiny::fluidPage(
        titlePanel("Unit converter"),
        tabsetPanel(
          tabPanel("Converter",
         fluidRow(
                  column(12,
                    fluidRow(
                      column(6, numericInput("in", "Input value", value = NULL) ),
                      column(6, textInput("in_unit", label = "Input unit",
                                          value = "", width = NULL,
                                          placeholder = NULL))),
                    fluidRow(
                      column(6,textInput("out_unit", label = "Output unit",
                                         value = "", width = NULL,
                                         placeholder = NULL)),
                    column(6, actionButton("go","Convert"))),
                    fluidRow(
                      column(6, h4("Result"),
                             verbatimTextOutput("out", placeholder = TRUE)))
                  )
         ),
         fluidRow(column(12, h4("Example:"),
                  p("enter '10' without the quote marks in the field " , tags$b("Input value")),
                  p("enter 'm/s' (for meters per second) without the quote marks in the field" , tags$b("Input unit")),
                  p("enter 'km/h' (for kilometers per hour) without the quote marks in the field" , tags$b("Ouput unit")),
                  p("Click on 'Convert'"))
         )
         ),
         tabPanel("Valid unit symbols",
         fluidRow(
                  column(12,  DT::dataTableOutput("valid_units"))
         )
         ))
)

