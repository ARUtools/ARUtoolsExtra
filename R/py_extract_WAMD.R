py_extract_WAMD <- function(filename){
  # Fail if not installed
  if(rlang::is_null(.arutools$wamd)){
    rlang::abort(c("Python failed to load.",
                   '*' = "'py_extract_WAMD' requires a python installation with the 'reticulate' function and the
                 'chunk', 'struct', 'datetime' python modules installed.",
                   "i" = " See [reticulate::py_install] (https://rstudio.github.io/reticulate/reference/py_install.html) for details on installing python with 'reticulate' and then run `reticulate::py_install(c('chunk', 'struct', 'datetime', 'guano'))` to install the needed packages.") )
  }

  # Check python
  # check if dependencies are installed
  check <-  check_modules()

  # load modules only if dependencies are available
  modules_available <- all(check[,2] != "0")



  # Call python function
  .arutools$wamd$wamd(filename) |>
    stats::setNames(c(
      "version", "model", "serial", "firmware",
      "prefix", "timestamp", "lat_lon",
      "microphone", "sensitivity", "temp"
    )) |>
    dplyr::as_tibble()
}
