% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input-radiobuttons.R
\name{radioButtons}
\alias{radioButtons}
\title{Create radio buttons}
\usage{
radioButtons(inputId, label, choices = NULL, selected = NULL,
  inline = FALSE, width = NULL, choiceNames = NULL,
  choiceValues = NULL)
}
\arguments{
\item{inputId}{The \code{input} slot that will be used to access the value.}

\item{label}{Display label for the control, or \code{NULL} for no label.}

\item{choices}{List of values to select from (if elements of the list are
named then that name rather than the value is displayed to the user). If
this argument is provided, then \code{choiceNames} and \code{choiceValues}
must not be provided, and vice-versa. The values should be strings; other
types (such as logicals and numbers) will be coerced to strings.}

\item{selected}{The initially selected value (if not specified then defaults
to the first value)}

\item{inline}{If \code{TRUE}, render the choices inline (i.e. horizontally)}

\item{width}{The width of the input, e.g. \code{'400px'}, or \code{'100\%'};
see \code{\link{validateCssUnit}}.}

\item{choiceNames, choiceValues}{List of names and values, respectively, that
are displayed to the user in the app and correspond to the each choice (for
this reason, \code{choiceNames} and \code{choiceValues} must have the same
length). If either of these arguments is provided, then the other
\emph{must} be provided and \code{choices} \emph{must not} be provided. The
advantage of using both of these over a named list for \code{choices} is
that \code{choiceNames} allows any type of UI object to be passed through
(tag objects, icons, HTML code, ...), instead of just simple text. See
Examples.}
}
\value{
A set of radio buttons that can be added to a UI definition.
}
\description{
Create a set of radio buttons used to select an item from a list.
}
\details{
If you need to represent a "None selected" state, it's possible to default
the radio buttons to have no options selected by using \code{selected =
character(0)}. However, this is not recommended, as it gives the user no way
to return to that state once they've made a selection. Instead, consider
having the first of your choices be \code{c("None selected" = "")}.
}
\examples{
## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  radioButtons("dist", "Distribution type:",
               c("Normal" = "norm",
                 "Uniform" = "unif",
                 "Log-normal" = "lnorm",
                 "Exponential" = "exp")),
  plotOutput("distPlot")
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)

    hist(dist(500))
  })
}

shinyApp(ui, server)

ui <- fluidPage(
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("calendar"),
                 HTML("<p style='color:red;'>Red Text</p>"),
                 "Normal text"
               ),
               choiceValues = list(
                 "icon", "html", "text"
               )),
  textOutput("txt")
)

server <- function(input, output) {
  output$txt <- renderText({
    paste("You chose", input$rb)
  })
}

shinyApp(ui, server)
}
}
\seealso{
\code{\link{updateRadioButtons}}

Other input elements: \code{\link{actionButton}},
  \code{\link{checkboxGroupInput}},
  \code{\link{checkboxInput}}, \code{\link{dateInput}},
  \code{\link{dateRangeInput}}, \code{\link{fileInput}},
  \code{\link{numericInput}}, \code{\link{passwordInput}},
  \code{\link{selectInput}}, \code{\link{sliderInput}},
  \code{\link{submitButton}}, \code{\link{textAreaInput}},
  \code{\link{textInput}}, \code{\link{varSelectInput}}
}
\concept{input elements}
