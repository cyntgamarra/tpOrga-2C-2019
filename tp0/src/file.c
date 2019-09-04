#define ERROR 1
#define OK 0

#include "file.h"
#include<stdlib.h>
#include<string.h>
#include <errno.h>

void FileCreate(File *file){
    file->file = 0;
    file->eof = 0;
}

char FileOpenForRead(File* file, const char *route ){
    if(route == NULL) {
        file->file = stdin;
    } else {
        file->file = fopen(route, "rb");
        if (file->file == NULL) {
            int err = errno;
            fprintf(stderr, "File Open Error; %s\n", strerror(err));
            return ERROR;
        }
    }
    return OK;
}

char FileOpenForWrite(File* file, const char *route ) {
    if(route == NULL) {
        file->file = stdout;
    } else {
        file->file = fopen(route, "wb");
        if (file->file == NULL) {
            int err = errno;
            fprintf(stderr, "File Open Error; %s\n", strerror(err));
            return ERROR;
        }
    }
    return OK;
}

int FileClose(File* file){
    if(file->file == stdin || file->file == stdout)
        return OK;

    int result = fclose(file->file);
    if (result == EOF){
        int err = errno;
        fprintf(stderr, "File Close Error; %s\n", strerror(err));
        return ERROR;
    }
    return OK;
}

unsigned int FileRead(File *file, unsigned char *buffer, unsigned int length) {
    unsigned int result = 0;
    if(!FileEofReached(file)){
        // El tamaño de un chunk no debe superar el tamaño de un unsigned int
        result = (unsigned int) fread(buffer, sizeof(char), length, file->file);
        if(feof(file->file))
            file->eof = 1;	//Setea Flag EOF
    }
    return result;
}

int FileEofReached(File* file){
    return file->eof;
}

void FileWrite(File* file, unsigned char* buffer, unsigned int length) {
    fwrite(buffer, sizeof(char), length, file->file);
}
