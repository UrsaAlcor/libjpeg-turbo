// gcc lz4_main.c -o lz4_main -llz4
#include "lz4.h"


int main(int argc, const char* argv[]){


    const char* src;
    const char* dst;
    int srcSize;
    int dstCapacity;

    int written = LZ4_compress_default(src, dst, srcSize, dstCapacity);

    return 0;
}