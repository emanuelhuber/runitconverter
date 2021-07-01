.onAttach <- function(libname, pkgname) {
  packageStartupMessage(paste0("Don't hesitate to contact me if you ",
                               "have any question:\n",
                               "emanuel.huber@pm.me\n\n",
                               "There is only one function to run in this package:\n",
                               "runitconv"))
}



#' RGPR: A package for processing and visualising ground-penetrating data
#' radar (GPR) data.
#'
#' The RGPR package provides two classes GPR and GPRsurvey
#'
#' @import shiny
"_PACKAGE"
#> [1] "_PACKAGE"



#' Lauch the unit converter app
#'
#' Lauch the unit converter app. A very simple and flexible app for unit
#' conversion based on the great \code{units} package.
#'
#' @export
#'
#' @return shiny application object
runitconv <- function() {
  shinyApp(ui = shinyAppUI, server = shinyAppServer)
}
