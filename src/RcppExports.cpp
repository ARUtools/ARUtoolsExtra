// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// detect_wind_cpp
int detect_wind_cpp(std::string input_file_directory, std::string output_directory, std::string tree_locs, int verbose);
RcppExport SEXP _ARUtoolsExtra_detect_wind_cpp(SEXP input_file_directorySEXP, SEXP output_directorySEXP, SEXP tree_locsSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::string >::type input_file_directory(input_file_directorySEXP);
    Rcpp::traits::input_parameter< std::string >::type output_directory(output_directorySEXP);
    Rcpp::traits::input_parameter< std::string >::type tree_locs(tree_locsSEXP);
    Rcpp::traits::input_parameter< int >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(detect_wind_cpp(input_file_directory, output_directory, tree_locs, verbose));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_ARUtoolsExtra_detect_wind_cpp", (DL_FUNC) &_ARUtoolsExtra_detect_wind_cpp, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_ARUtoolsExtra(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
