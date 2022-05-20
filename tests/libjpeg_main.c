#include <jpeglib.h>

int main(int argc, const char* argv[]){

    j_compress_ptr* ptr;

    jpeg_create_compress(ptr);

    return 0;
}