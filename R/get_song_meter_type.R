# detect_aru_type <- function(meta )
#   #
#   #
#   #   readLines(log_file, n= 10) |> stringr::str_subset("FRONTIER")
#   sites <- dplyr::distinct(m, aru_id, site_id)
# missing <- dplyr::tibble()
#
# log_files <- dplyr::filter(m, type == "log") |>
#   dplyr::select(site_id, aru_id, path)
# if(length(log_files)>0){
#   barlts <- dplyr::rowwise(log_files) |>
#     dplyr::mutate(aru_name = readLines(path, n= 10) |>
#                     stringr::str_subset("FRONTIER")) |>
#     dplyr::ungroup()
#
#   sites <- dplyr::left_join(x = sites,barlts, by = dplyr::join_by(site_id, aru_id))
#   missing <- dplyr::filter(sites, is.na(aru_name))
# }
# if(nrow(missing)>0){
#   fs <- missing$site_id[[1]]
#   ss <- dplyr::filter(m, site_id%in% missing$site_id & type == 'wav') |>
#     dplyr::slice_sample(n=1, by = site_id) |> dplyr::pull(path)
#
#   smt <- get_song_meter_type(ss)
#
# }

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

