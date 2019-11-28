RFLtheme README
================

RFLtheme R package
------------------

This is a package for theme-ing data visualisations. the core function is `rfl_style()` which allows you to style `ggplot2` charts according to the Royal Free's style guide and charts library (taking a significant lead from the BBC's [bbplot package](https://github.com/bbc/bbplot)). You can also use colours form our corporate colour palette with the `rfl_colour()` and `rfl_scale_*()` funcitons, borrowing very heavily from [this blogplot](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2) by [Simon Jackson](https://twitter.com/drsimonj)

In the future we may include markdown templates and styles.

Installation
------------

You will have to install it directly from Github using devtools.

If you do not have the devtools package installed, you will have to run the first line in the code below.

``` r
# install.packages('devtools')
devtools::install_github('royal-free-london/RFLtheme')
```

**N.B.** Currently, importing `RFLtheme` into your project with `library(RFLtheme)` will change some default ggplot2 options (axis titles and grid lines) of your `ggplot2` plots.

How to use and examples
-----------------------

``` r
...coming soon...
```
