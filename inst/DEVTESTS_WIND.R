test_dir <-
  "D:/!TMP_2024_Zoom/2024-06-11"
test_aru <-
  "D:/!_TEMP_AUDIO_SAMPLES/ARU_RecordingSample_P7-04"
#"D:/Merlin_data/Merlin/"
library(ARUtools)
# m <- clean_metadata(project_dir = test_dir,
#                     pattern_time = create_pattern_time(sep = "_", seconds ='no'),
#                     pattern_dt_sep = create_pattern_dt_sep(sep = " "))

m <- clean_metadata(project_dir = test_dir,
                    pattern_time = create_pattern_time(sep = "", seconds ='yes'),
                    pattern_dt_sep = create_pattern_dt_sep(sep = "-"),
                    pattern_date = create_pattern_date(yr_digits = 2))


wind_detection_pre_processing(m$path[1:10], site_pattern = "Zoom",
                              output_directory =
                                "D:/Merlin_data/wind/", write_to_file = T)
# library(rwind)
tree_locs_ <-system.file("extdata","trees",  package = "rwind")
detect_wind_cpp("D:/Merlin_data/wind/", output_directory ="D:/Merlin_data/wind/" ,
                verbose = 1, tree_locs = tree_locs_)



m <- clean_metadata(project_dir = test_aru,
                    pattern_time = create_pattern_time(sep = "",
                                                       seconds ='yes',
                                                       look_behind = "T", look_ahead = "-"),
                    pattern_dt_sep = create_pattern_dt_sep(sep = "T"),
                    pattern_date = create_pattern_date(yr_digits = 4),
                    pattern_site_id = "P7-04")


wind_detection_pre_processing(m$path[1:4], site_pattern = "P7-04",
                              output_directory =
                                "D:/Merlin_data/wind/barlt/", write_to_file = T)

job::job({
  tree_locs_ <-system.file("extdata","trees/",  package = "ARUtoolsExtra")
  glue::glue("{tree_locs_}/")
  detect_wind_cpp(input_file_directory = "D:/Merlin_data/wind/barlt/",
                  output_directory ="D:/Merlin_data/wind/" ,
                  verbose = 1, tree_locs = glue::glue("{tree_locs_}/"))
})

bench::system_time(
detect_wind(input_file_directory = "D:/Merlin_data/wind/barlt/",
            output_directory ="D:/Merlin_data/wind/seq/" ,quiet = T,
            parallel = F)
)


bench::system_time({

RcppParallel::setThreadOptions(numThreads = 4)
detect_wind(input_file_directory = "D:/Merlin_data/wind/barlt/",
                output_directory ="D:/Merlin_data/wind/parallel/" ,quiet = T,
                parallel = T)
}
)
Sys.getenv("RCPP_PARALLEL_NUM_THREADS")


ll_org <- list.files("D:/Merlin_data/wind/seq/", "P7.+.txt$", full.names = T, recursive = F) |> sort()
ll_p <- list.files("D:/Merlin_data/wind/parallel/", "P7.+.txt$", full.names = T, recursive = F) |> sort()
tools::md5sum(ll_org[[2]]) == tools::md5sum(ll_p[[2]])
ll_org[[2]] |> readr::read_file()
ll_p[[2]] |> readr::read_file()


ll_orgj <- list.files("D:/Merlin_data/wind/seq/", "P7.+.json$", full.names = T, recursive = F) |> sort()
ll_pj <- list.files("D:/Merlin_data/wind/parallel/", "P7.+.json$", full.names = T, recursive = F) |> sort()

ARUtools::wind_detection_summarize_json(ll_orgj[[4]])

ARUtools::wind_detection_summarize_json(ll_pj[[4]])
