sm4 <- "//WNCRLABN74947/RecordStor20222023/A3NearNorthCONWEWPW_2024/SM4_1178/Data/S4A01178_20240610_213200.wav"
brlt <- "//WNCRLABN74947/RecordStor20222023/JamesBayLowlandsBorealShieldTransition_2022/P072/4A_BARLT17497/20220502_Nakina2022/00017497_20220502T001100-0400_SS.wav"


get_ARU_type(sm4)
get_ARU_type(brlt)

get_ARU_type("inst/test_media/00017497_20220502T001100-0400_SS.wav")
get_ARU_type("inst/test_media/01178_20240610_213200.wav")

project_dir <- "//WNCRLABN74947/RecordStor20222023/A3NearNorthCONWEWPW_2024/SM4_1178"
project_files <-  ARUtools:::list_files(project_dir, NULL, NULL,
                 type = "file"
)
file_type_pattern <- "wav"
# Collect non-file-type files
extra <- stringr::str_subset(project_files, file_type_pattern, negate = TRUE)
log <-  stringr::str_subset(extra, stringr::regex("logfile", ignore_case = TRUE))
gps <- stringr::str_subset(extra, stringr::regex("gps|summary", ignore_case = TRUE))
focal <- stringr::str_subset(project_files, file_type_pattern)
tt <- guess_ARU_type(focal)

FX <- fs::dir_ls("inst/test_media/")
guess_ARU_type(FX)
