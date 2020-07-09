#Project Title: RFL Style
#File Title: RFL style functions for consistent data visualisation with ggplot
#File Purpose: allow people to set a consistent style using the rfl_style() function
#Author: Edward Watkinson (edward.watkinson@nhs.net)
#Team: Performance and Analytics RFL
#Source: Inspiration from the bbplot package

#TODO - '+' = recently complete, '~' = testing required, '-' = to do
#  - Try to build every chart in the RFL chart library as vignettes


#' Add RFL styling to ggplot graphics
#'
#' @return ggplot::theme object to be added (+) to ggplot2 graphic
#' @examples
#' rfl_style()
#'
#' ggplot(data, aes(x=xaxis, y=yaxis)) +
#' geom_line() +
#' rfl_style()
#' @export
rfl_style <- function() {
  font <- "sans"

  ggplot2::theme_minimal() +
    ggplot2::theme(
      #white background and no grid lines
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      panel.grid.major.y = element_line(color = "grey"),
      axis.ticks.x = element_line(color = "grey"),

      #no axis titles by default - change by adding rfl_show_axis_titles()
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.text.x = element_text(angle = 45, hjust = 1),

      #left justified title and subtitle
      plot.title = element_text(
        family = font,
        face = 'bold',
        size = 18,
        hjust = 0
      ),
      plot.subtitle = element_text(
        family = font,
        face = 'italic',
        size = 11,
        hjust = 0
      )
    )

}


#' Show Axis Titles on an rfl_style() Styled ggplot2 graphic
#'
#' @return ggplot::theme object to be added (+) to ggplot2 graphic
#' @param which either x, y, or both (default)
#'  @examples
#' rfl_show_axis_titles()
#'
#' ggplot(data, aes(x=xaxis, y=yaxis)) +
#'   geom_line() +
#'   rfl_style() +
#'   labs(x="something", y="something else") +
#'   rfl_show_axis_titles()
#' @export
rfl_show_axis_titles <- function(which='both') {
  switch(which,
    'x' = ggplot2::theme(axis.title.x = ggplot2::element_text()),
    'y' = ggplot2::theme(axis.title.y = ggplot2::element_text()),
    'both' = ggplot2::theme(axis.title.x = ggplot2::element_text(),axis.title.y = ggplot2::element_text())
  )
}


#to load geom_defaults on startup give an empty .onload function
#' @export
.onLoad <- function(libname, pkgname) {

  ##set default colours and behaviour for column, line and point plots
  blue <- rfl_colour("blue")

  ggplot2::update_geom_defaults("col", list(fill = blue))
  ggplot2::update_geom_defaults("line", list(fill = blue,
                                             colour = blue))

  ggplot2::update_geom_defaults("point", list(
    shape = 21,
    fill = "white",
    colour = blue
  ))
}
