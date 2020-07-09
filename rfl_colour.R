#Project Title: RFL Style
#File Title: RFL colour functions
#File Purpose: allow people to  consistent style using the rfl_colour() and other functions
#Author: Edward Watkinson (edward.watkinson@nhs.net)
#Team: Performance and Analytics RFL
#Source: Inspiration from the bbplot package and https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

#TODO - '+' = recently complete, '~' = testing required, '-' = to do
#  - Curate colour palletes

# Internal to store colours
colours <- data.frame(
  'name' = c('blue', 'green', 'orange', 'purple', 'pink', 'yellow', 'grey'),
  'official_name' = c(
    'PANTONE 300',
    'PANTONE 368',
    'PANTONE 158',
    'PANTONE 2685',
    'PANTONE 219',
    'PANTONE 123',
    'Grey'
  ),
  'R' = c(0, 120, 232, 51, 219, 255, 191),
  'G' = c(94, 190, 119, 0, 24, 199, 191),
  'B' = c(184, 32, 34, 114, 132, 44, 191)
)


#' Return Colour from the RFL style (in Hexidecimal Format)
#'
#' @param colour A colour in the RFL pallete (type rfl_colors() for lists).
#' @return A string in Hexidecimal format for use in graphics & themes
#' @examples
#' ggplot(data, aes(x=xaxis, y=yaxis)) +
#' geom_line(colour=rfl_colour("blue"))
#' rfl_colour("green")
#' @export
rfl_colour <- function(colour, alpha = 1) {
  ##scale alpha (transparency/shade) to fit with other definitions
  alpha <- alpha * 255

  if (is.element(colour, colours[, 'name'])) {
    grDevices::rgb(colours[which(colours[, 'name'] == colour), 'R'],
        colours[which(colours[, 'name'] == colour), 'G'],
        colours[which(colours[, 'name'] == colour), 'B'],
        alpha,
        maxColorValue = 255)
  } else{
    FALSE
  }

}

#' Return a List of Colours in the RFL style (in Hexidecimal Format)
#'
#' @param details A logical defaulting to FALSE. Provides colour names and RGB values
#' @return A vector of colour names to use in rfl_colour() or a dataframe with details.
#' @examples
#' rfl_colours()
#' rfl_colours(details=TRUE)
#' @export
rfl_colours <- function(details = FALSE) {
  if (details) {
    colours
  } else {
    colours[, 'name']
  }
}


#' show different available colour palletes
#' @export
rfl_pallete <- list(
  "main" = c(
    rfl_colour("blue"),
    rfl_colour("orange"),
    rfl_colour("green")
  ),
  "bluegrad" = c(
    rfl_colour("blue", 0.5),
    rfl_colour("blue", 0.25),
    rfl_colour("blue")
  ),
  "bright" = c(
    rfl_colour("pink"),
    rfl_colour("yellow"),
    rfl_colour("orange")
  ),
  "full" =  c(
    rfl_colour('blue'),
    rfl_colour('green'),
    rfl_colour('orange'),
    rfl_colour('purple'),
    rfl_colour('pink'),
    rfl_colour('yellow'),
    rfl_colour('grey')
  )
)


#' Internal comand to deal with the RFL colour pallete
#' @export
rfl_colour_pal <- function(palette = "main",
                           reverse = FALSE,
                           ...) {
  pal <- rfl_pallete[[palette]]

  if (reverse)
    pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


#' use a colour scale from the Royal Free colour pallete for 'colour' attributes
#'
#' @param pallete A string denoting the pallete to use, options "main", "bright" and "full"
#' @param discrete A logical to set a discrete or coninuious colour scale
#' @param reverse A logical to reverse the colour scale
#' @return ggplot2::discrete_scale or scale_color_gradient object
#' @examples
# ggplot(data, aes(x=xaxis, y=yaxis, group=groupVar)) +
#' geom_line() +
#' scale_color_rfl("main", reverse=TRUE)
#' @export
rfl_scale_colour <-
  function(palette = "main",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    pal <- rfl_colour_pal(palette = palette, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale("colour", paste0("rfl_colour_", palette), palette = pal, ...)
    } else {
      ggplot2::scale_color_gradientn(colours = pal(256), ...)
    }
}


#' use a colour scale from the Royal Free colour pallete for 'fill' attributes
#'
#' @param pallete A string denoting the palete to use, options "main", "bright" and "full"
#' @param discrete A logical to set a discrete or coninuious colour scale
#' @param reverse A logical to reverse the colour scale
#' @return ggplot2::discrete_scale or scale_color_gradient object
#' @examples
# ggplot(data, aes(x=xaxis, y=yaxis, group=groupVar)) +
#' geom_line() +
#' scale_color_rfl("main", reverse=TRUE)
#' @export
rfl_scale_fill <-
  function(palette = "main",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    pal <- rfl_colour_pal(palette = palette, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale("fill", paste0("rfl_colour_", palette), palette = pal, ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = pal(256), ...)
    }
}
