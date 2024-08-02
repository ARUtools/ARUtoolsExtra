#' Detect wind in wave files.
#'
#' @param input_file_directory Path to directory of wind software files
#' @param output_directory Path to directory to output files
#' @param parallel Logical. Run in parallel
#' @param quiet Logical to verbosely run
#'
#' @return NULL
#' @export
#'
detect_wind <- function(input_file_directory, output_directory,parallel = F, quiet = T){
  tree_locs_ <-system.file("extdata","trees/",  package = "ARUtoolsExtra")
  v <- ifelse(quiet,0,1)
  p <- ifelse(parallel,1,0)
  if(parallel & Sys.getenv("RCPP_PARALLEL_NUM_THREADS") == RcppParallel::defaultNumThreads()){
    rlang::abort(c("Number of threads likely too high",
                   '*'= "Keep at least one thread avaible to run R",
                   'i'= "Use RcppParallel::setThreadOptions(numThreads = 4) to adjust cores used") )
  }
  o <- detect_wind_cpp(input_file_directory = input_file_directory,
                  output_directory = output_directory,parallel = p,
                  verbose = v, tree_locs = glue::glue("{tree_locs_}/"))
  NULL
}
