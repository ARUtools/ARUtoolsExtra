check_modules <- function() {
  # check if dependencies are installed
  chunk_ = struct_ = dt_ = c(crayon::red(cli::symbol$cross), 0)
  if(reticulate::py_module_available("chunk")) chunk_ =  c(crayon::green(cli::symbol$tick), 1)
  if(reticulate::py_module_available("struct")) struct_ =  c(crayon::green(cli::symbol$tick), 1)
  if(reticulate::py_module_available("datetime")) dt_ =  c(crayon::green(cli::symbol$tick), 1)
  return(rbind("chunk" = chunk_,  "struct" = struct_, "datetime" = dt_))
}

