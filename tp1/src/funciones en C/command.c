#include "command.h"
#include "matrix.h"
#include <string.h>
#include <stdio.h>

void CommandHelp(){
    printf("Usage:\n");
    printf("  tp1 -h\n");
    printf("  tp1 -V\n");
    printf("  tp1 < in_file > out_file\n");
    printf("Options:\n");
    printf("  -V, --version    Print version and quit.\n");
    printf("  -h, --help       Print this information and quit.\n");
    printf("Examples:\n");
    printf("  tp1 < in.txt > out.txt\n");
    printf("  cat in.txt | tp1 > out.txt\n");
}

void CommandVersion() {
    printf("Version: 1.1\n");
}

void CommandErrArg() {
    fprintf(stderr, "Invalid Arguments\n");
    fprintf(stderr,"Usage:\n");
    fprintf(stderr,"  tp1 -h.\n");
    fprintf(stderr,"  tp1 -V.\n");
    fprintf(stderr,"  tp1 < in_file > out_file.\n");
    fprintf(stderr,"Options:\n");
    fprintf(stderr,"  -V, --version    Print version and quit.\n");
    fprintf(stderr,"  -h, --help       Print this information and quit.\n");
    fprintf(stderr,"Examples:\n");
    fprintf(stderr,"  tp1 < in.txt > out.txtn\n");
    fprintf(stderr,"  cat in.txt | tp1 > out.txt\n");
}

void CommandCreate(CommandOptions *opt) {
    opt->error = FALSE;
}

void CommandSetError(CommandOptions *opt) {
    opt->error = TRUE;
}

char CommandHasError(CommandOptions *opt) {
    return opt->error;
}
