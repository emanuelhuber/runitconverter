shinyAppServer <- function(input, output) {
    val_in       <- shiny::reactive(input[["in"]])
    val_in_unit  <- shiny::reactive(input[["in_unit"]])
    val_out_unit <- shiny::reactive(input[["out_unit"]])

    restab <- shiny::eventReactive(input[["go"]],{
      aout <- ""
      if( !is.null(val_in()) && !is.na(val_in())){
        # print("!is.null(input[['in']])")
        a <- val_in()
        unit_in <- tryCatch(units::as_units(val_in_unit()),
                            error = function(cond){return(NULL)})
        unit_out <- tryCatch(units::as_units(val_out_unit()),
                            error = function(cond){return(NULL)})
        if(is.null(unit_in) || is.null(unit_out)){
          # aout <- "Error:\n"
          if(is.null(unit_in)) aout <- paste0(aout, "Error: input unit '",  val_in_unit(), "' is not recognized as unit.\n")
          if(is.null(unit_out)) aout <- paste0(aout, "Error: output unit '",  val_out_unit(), "' is not recognized as unit.\n")
        }else{
          units(a) <- unit_in
          units(a) <- unit_out
          aout <- paste(as.numeric(a), as.character(attr(a, "units")) )
        }
      }
      aout
    })
    output$out <- shiny::renderText({
      restab()
    })
    output$valid_units <- DT::renderDataTable(units::valid_udunits()[,1:3])
}
