#Stolen code that looks snazzy


#----------- let's create some custom functions -------------

# installing new packages
install_pkg <- function (pkg_name='') {
  suppressWarnings(suppressMessages(install.packages(pkg_name, verbose = T, quiet=T)))
}

# loading packages
load_pkg <- function(pkg_name) {
  suppressPackageStartupMessages(library(pkg_name, character.only = T))
}

# custom ggplot theme
my_ggtheme <- function (legend='none', center = 0.5, face='bold', yaxis='on') {
  theme(
    plot.title = element_text(hjust = center, face=face),
    plot.subtitle = element_text(hjust = center, face=face),
    legend.position = legend
  )
}