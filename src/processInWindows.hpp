/* 
 * File:   processInWindows.hpp
 * Author: ags056
 *
Copyright (c) <2014> <Paul Kendrick>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. */

#ifndef PROCESSINWINDOWS_HPP
#define	PROCESSINWINDOWS_HPP




extern "C" {
#include <stdio.h>
#include <stdlib.h>
#include <string.h> // for memcmp
#include <stdint.h> // for int16_t and int32_t
#include "featureExtraction.h"
    #include "aweighting.h"
        void aWeightingPreComp(float * f,int fftn);
        void aWeighting(float * f, float * a ,int Len, float * rms,int fftn );

}
int loadWav(const char *filename, const char * outFilename,const char *jsonFilename, char *treeDir, float gain, int frameAve,float thresh,int verbose,char * treeFileLoc);
#include  "DecisionTreeClass.hpp"

#define WIN_N 1024

//

#endif	/* PROCESSINWINDOWS_HPP */


