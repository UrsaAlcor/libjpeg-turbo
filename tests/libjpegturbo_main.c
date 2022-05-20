#include <turbojpeg.h>


int main(int argc, const char* argv[]){

    const char* filename;
    int *width;
    int align;
    int *height;
    int *pixelFormat;
    int flags;

    unsigned char *data = tjLoadImage(
        filename, 
        width,
        align, 
        height, 
        pixelFormat,
        flags
    );

    return 0;
}