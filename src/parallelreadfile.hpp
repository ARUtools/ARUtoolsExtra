
#ifndef PARALLELREADFILE_HPP
#define	PARALLELREADFILE_HPP
#include <vector>
#include <string>

void loadWavparallel(std::vector<std::string> paths,
                     std::vector<std::string> filenames,
                     std::vector<std::string> sites,
                     int verbose,
                     std::string wavext, std::string outdir,
                     std::string outext,std::string tree_locs);


#endif	/* PARALLELREADFILE_HPP */
