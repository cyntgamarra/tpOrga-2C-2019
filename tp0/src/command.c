#include "command.h"
#include "matrix.h"
#include <string.h>
#include <stdio.h>

void CommandHelp(){
    printf("Usage:\n");
    printf("  tp0 -h\n");
    printf("  tp0 -V\n");
    printf("  tp0 < in_file > out_file\n");
    printf("Options:\n");
    printf("  -V, --version    Print version and quit.\n");
    printf("  -h, --help       Print this information and quit.\n");
    printf("Examples:\n");
    printf("  tp0 < in.txt > out.txt\n");
    printf("  cat in.txt | tp0 > out.txt\n");
}

void CommandVersion() {
    printf("Version: 0.1\n");
}

void CommandErrArg() {
    fprintf(stderr, "Invalid Arguments\n");
    fprintf(stderr,"Usage:\n");
    fprintf(stderr,"  tp0 -h.\n");
    fprintf(stderr,"  tp0 -V.\n");
    fprintf(stderr,"  tp0 < in_file > out_file.\n");
    fprintf(stderr,"Options:\n");
    fprintf(stderr,"  -V, --version    Print version and quit.\n");
    fprintf(stderr,"  -h, --help       Print this information and quit.\n");
    fprintf(stderr,"Examples:\n");
    fprintf(stderr,"  tp0 < in.txt > out.txtn\n");
    fprintf(stderr,"  cat in.txt | tp0 > out.txt\n");
}

void CommandCreate(CommandOptions *opt) {
    //FileCreate(&opt->input);
    //FileCreate(&opt->output);    
    //opt->input_route = 0;
    //opt->output_route = 0;
    opt->error = FALSE;
}

/*void CommandSetInput(CommandOptions *opt, const char *input) {
    opt->input_route = input;
}

void CommandSetOutput(CommandOptions *opt, const char *output) {
    opt->output_route = output;
}*/

void CommandSetError(CommandOptions *opt) {
    opt->error = TRUE;
}

char CommandHasError(CommandOptions *opt) {
    return opt->error;
}

/*char CommandProcess(CommandOptions *opt) {
    opt->error = FileOpenForRead(&opt->input, opt->input_route);

    if(!opt->error)
        opt->error = FileOpenForWrite(&opt->output, opt->output_route);

    if(!opt->error){
        opt->error = _CommandMatrixMultiply(opt);
        FileClose(&opt->input);
        FileClose(&opt->output);
    }
    else {
        FileClose(&opt->input);
    }
    return opt->error;
}

char _CommandMatrixMultiply(CommandOptions *opt) {
    unsigned char buf_decoded[3];
    unsigned char buf_encoded[4];
    unsigned char count = 0;
    matrix_t* m1 = create_matrix(2,2);
    matrix_t* m2 = create_matrix(2,2);



    while(!FileEofReached(&opt->input)){
	memset(buf_decoded, 0, 3);
	unsigned int read = FileRead(&opt->input, buf_decoded, 3);
	if (read > 0) {
		matrix_multiply(m1, m2);
                FileWrite(&opt->output, buf_encoded, 4);
                ++count;
                if (count == 18) { // 19 * 4 = 76 bytes
                    FileWrite(&opt->output, (unsigned char *) "\n", 1);
                    count = 0;
                }

	}
    }
    destroy_matrix(m1);
    destroy_matrix(m2);

    return opt->error;
}*/
