#include "command.h"
#include <string.h>
#include <stdio.h>

void CommandHelp(){
    printf("Options:\n");
    printf("  -V, --version    Print version and quit.\n");
    printf("  -h, --help       Print this information.\n");
    printf("  -i, --input      Location of the input file.\n");
    printf("  -o, --output     Location of the output file.\n");
    printf("  -a, --action     Program action: encode (default) or decode.\n");
    printf("Examples:\n");
    printf("  tp0 -a encode -i ~/input -o ~/output\n");
    printf("  tp0 -a decode\n");
}

void CommandVersion() {
    printf("Version: 0.1\n");
}

void CommandErrArg() {
    fprintf(stderr, "Invalid Arguments\n");
    fprintf(stderr,"Options:\n");
    fprintf(stderr,"  -V, --version    Print version and quit.\n");
    fprintf(stderr,"  -h, --help       Print this information.\n");
    fprintf(stderr,"  -i, --input      Location of the input file.\n");
    fprintf(stderr,"  -o, --output     Location of the output file.\n");
    fprintf(stderr,"  -a, --action     Program action: encode (default) or decode.\n");
    fprintf(stderr,"Examples:\n");
    fprintf(stderr,"  tp0 -a encode -i ~/input -o ~/output\n");
    fprintf(stderr,"  tp0 -a decode\n");
}
