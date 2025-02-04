
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ARUtoolsExtra

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

The goal of ARUtoolsExtra is to house some extra fuctions that have a
few too many extra dependancies to be included in “ARUtools”.

## Installation

You can install the development version of ARUtoolsExtra from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ARUtools/ARUtoolsExtra")
```

## Example - Wind detection

I have imported and adapted code from the
[WindNoiseDetection](https://github.com/kenders2000/WindNoiseDetection)
software.

I recommend checking out that software if you want to run directly in
c++ or [my
fork](https://github.com/dhope/WindNoiseDetection/tree/multicore) if you
want to use multiple processors.

To set up for a run, you’ll need to clean the metadata.

``` r
library(ARUtools)
m <- clean_metadata(project_files = ARUtools::example_files)
```

Then you can write the wind software prep files

``` r
wind_files <-
  wind_detection_pre_processing(
    wav_files = m$path,
    output_directory = "./wind_files/",
    site_pattern = create_pattern_site_id(
      p_digits = c(2, 3), sep = "_",
      s_digits = c(1, 2)
    ),
    write_to_file = T, chunk_size = NULL
  )
```

To call the function enter:

``` r
detect_wind(input_file_directory = "./wind_files/",
            output_directory = "Path/to/outpu/",
            quiet = T)
```

To run in parallel:

``` r

RcppParallel::defaultNumThreads() # Check number of threads available
RcppParallel::setThreadOptions(numThreads = 8) 
# Don't use all of available threads as R requires one.
detect_wind(input_file_directory = "./wind_files/",
            output_directory = "Path/to/outpu/",
            quiet = T, parallel = T)
```
