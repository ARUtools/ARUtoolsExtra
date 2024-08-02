// [[Rcpp::depends(RcppParallel)]]
#include <RcppParallel.h>
#include <Rcpp.h>
#include "processInWindows.hpp"
#include <string>
#include <vector>
using namespace RcppParallel;
using namespace Rcpp;

struct LoadWavP : public Worker
{
  // source matrix
  const std::vector<int> input;
  std::vector<std::string> paths;
  std::vector<std::string> filenames;
  std::vector<std::string> sites;
  const int verbose;
  const std::string wavext;
  const std::string outdir;
  const std::string outext;
  const std::string tree_locs;

  // initialize with source and destination
  LoadWavP(const std::vector<int> input,   std::vector<std::string> paths,
             std::vector<std::string> filenames,
             std::vector<std::string> sites, int verbose,
             std::string wavext, std::string outdir, std::string outext,
             std::string tree_locs)
    : input(input), paths(paths),
      filenames(filenames), sites(sites),
      verbose(verbose), wavext(wavext),
      outdir(outdir), outext(outext), tree_locs(tree_locs) {}

  // take the square root of the range of elements requested
  void operator()(std::size_t begin, std::size_t end) {
    char *tr_char = new char [tree_locs.length()+1];
    std::strcpy(tr_char, tree_locs.c_str());
    for (std::size_t i = begin; i < end; i++) {
      int j = input.at(i);
    // std::size_t j =  begin;
    // std::size_t k =  end;
    // char *trees =(char *)"dectrees_10_5000";


      std::string in_fname = paths.at(j)+  "/" + filenames.at(j) + wavext;//paths[j] + "/" +  filenames[j] + wavext;//
      std::string out_fname =  outdir +   sites.at(j)  + "__" +  filenames.at(j) + outext;
      std::string json_fnames =  outdir +  sites.at(j) + "__" + filenames.at(j) + ".json";
      // std::printf("input: %s\toutput: %s\t json: %s\n", in_fname.c_str(),out_fname.c_str(),
      //             json_fnames.c_str());
      // std::printf("site: %s\tfilenames: %s\t paths: %s\n", sites.at(j).c_str(),filenames.at(j).c_str(),
      //             paths.at(j).c_str());
      char *trees =(char *)"dectrees_10_5000";
      loadWav(in_fname.c_str(), out_fname.c_str(),json_fnames.c_str(),trees,
              1, 43,25,verbose,tr_char);
    }
  }
};


// [[Rcpp::export]]
void loadWavparallel(std::vector<std::string> paths,
                              std::vector<std::string> filenames,
                              std::vector<std::string> sites,
                              int verbose,
                              std::string wavext, std::string outdir,
                              std::string outext,
                              std::string tree_locs) {

  // allocate the output matrix
  std::vector<int> input(paths.size());
  for (int i = 0; i < paths.size(); i++) {
    input[i] = i;}

  // SquareRoot functor (pass input and output matrixes)
  LoadWavP loadWavP(input, paths, filenames, sites, verbose,wavext,
                    outdir, outext, tree_locs);

  // call parallelFor to do the work
  parallelFor(0, paths.size(), loadWavP);


}

