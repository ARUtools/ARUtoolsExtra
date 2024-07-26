#' ARUtoolsExtra: Management and Processing of Autonomous Recording Unit (ARU) Data
#'
#' @description
#' Parse Autonomous Recording Unit (ARU) data and for sub-sampling recordings.
#' Extract Metadata from your recordings, select a subset of recordings for
#' interpretation, and prepare files for processing on the
#' WildTrax <https://wildtrax.ca/> platform. Read and process metadata
#' from recordings collected using the Song Meter and BAR-LT types of ARUs.
#'
#' @docType package
#' @name ARUtoolsExtra
#' @import rlang
#'
"_PACKAGE"

## usethis namespace: start
#' @importFrom Rcpp sourceCpp
#' @useDynLib ARUtoolsExtra, .registration = TRUE
## usethis namespace: end
NULL

rlang::on_load(rlang::local_use_cli())


.arutools <- rlang::new_environment(parent = rlang::empty_env())



  # copied from the tidyverse package
  msg <- function(..., startup = FALSE) {
    if (startup) {
      if (!isTRUE(getOption("tidyverse.quiet"))) {
        packageStartupMessage(text_col(...))
      }
    } else {
      message(text_col(...))
    }
  }

  # copied from the tidyverse package
  text_col <- function(x) {
    # If RStudio not available, messages already printed in black
    if (!rstudioapi::isAvailable()) {
      return(x)
    }
    if (!rstudioapi::hasFun("getThemeInfo")) {
      return(x)
    }
    theme <- rstudioapi::getThemeInfo()

    if (isTRUE(theme$dark)) crayon::white(x) else crayon::black(x)

  }


  .onLoad = function(libname, pkgname){
    msg( text_col( cli::rule(left = "Attaching ARUtoolsExtra", right = utils::packageVersion("ARUtoolsExtra")) ), startup = TRUE)
    avail <- FALSE
    .arutools$wamd <- NULL
    if(rlang::is_installed('reticulate')){
      path <- system.file("python", package = "ARUtoolsExtra")
      .arutools$wamd <-  reticulate::import_from_path("WAMD", path, delay_load = TRUE, convert = TRUE)

    }

#
#   # msg( text_col( cli::rule(left = "Attaching sjSDM", right = utils::packageVersion("sjSDM")) ), startup = TRUE)
#
#   # causes problems on macOS systems
#   # if( is_osx() ) Sys.setenv( KMP_DUPLICATE_LIB_OK=TRUE )
#
#   # load r-sjsdm environment
#   success_env = try({
#     envs = reticulate::conda_list()
#     env_path = envs[which(envs$name %in% "r-sjsdm", arr.ind = TRUE), 2]
#     reticulate::use_python(env_path, required = TRUE)
#   }, silent = TRUE)
#
#   # check if dependencies are installed
#   # check = check_installation()
#
#   # load modules only if dependencies are available
#   modules_available = any(check[,2] == "0")
#   if(!modules_available) {
#     # load torch
#     # pkg.env$torch = reticulate::import("torch", delay_load = TRUE, convert = FALSE )
#
#     # 'compile' and load sjSDM python package
#     path =
#
#     pkg.env$fa = reticulate::import_from_path("WAMD", "py", delay_load = TRUE, convert = FALSE)
#     check= cbind(check, crayon::black( c(pkg.env$torch$`__version__`, rep("", 3))))
  # }
}
