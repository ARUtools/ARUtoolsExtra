get_song_meter_type <- function(filename){
  rlang::check_installed("exiftoolr")
  g <- exiftoolr::exif_read(filename, pipeline = 'csv')
  # exifr::read_exif(filename)
  print(g)
  if("Guano" %in% names(g)){
    g$Guano |> #stringr::str_remove("base64:") |>
      # stringr::str_remove("=") |> base64enc::decode() |> rawToChar() |>
      stringr::str_split("\\\r\\\n")
  } else{py_extract_WAMD(filename)}

  }

