#' Detect wind in wave files.
#'
#' @param input_file_directory Path to directory of wind software files
#' @param output_directory Path to directory to output files
#' @param quiet Logical to verbosely run
#'
#' @return NULL
#' @export
#'
detect_wind <- function(input_file_directory, output_directory, quiet = T){
  tree_locs_ <-system.file("extdata","trees/",  package = "ARUtoolsExtra")
  v <- ifelse(quiet,0,1)
  o <- detect_wind_cpp(input_file_directory = input_file_directory,
                  output_directory = output_directory,
                  verbose = v, tree_locs = glue::glue("{tree_locs_}/"))
  NULL
}
