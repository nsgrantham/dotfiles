.First <- function() {
  options(
    repos = c(CRAN = "https://cran.rstudio.com/"),
    devtools.name = "Neal Grantham",
    devtools.desc.author = "Neal Grantham <neal@nsgrantham.com> [aut, cre]",
    devtools.desc.license = "BSD",
    warnPartialMatchArgs = TRUE,
    warnPartialMatchDollar = TRUE,
    warnPartialMatchAttr = TRUE
  )
  if (interactive()) {
    suppressMessages(require(devtools))
    .quit <<- function() quit(save = "no")
  }
  cat("Successfully loaded .Rprofile at", date(), "\n")
}


.Last <- function() {
  cat("Goodbye at", date(), "\n")
}
