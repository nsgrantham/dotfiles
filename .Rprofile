.First <- function() {
  options(
    repos = c(CRAN = "https://cran.rstudio.com/"),
    devtools.name = "Neal Grantham",
    devtools.desc.author = "Neal Grantham <neal@nsgrantham.com> [aut, cre]",
    devtools.desc.license = "BSD"
  )
  if (interactive()) {
    suppressMessages(require(devtools))
    .quit <<- function() quit(save = "no")
  }
}
