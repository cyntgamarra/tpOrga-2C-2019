#define ERROR 0
#define FALSE 0
#define TRUE 1

#include <getopt.h>
#include "command.h"
#include <stddef.h>

int main(int argc, char** argv) {
    struct option arg_long[] = {
            {"input",   required_argument,  NULL,  'i'},
            {"output",  required_argument,  NULL,  'o'},
            {"action",  required_argument,  NULL,  'a'},
            {"help",    no_argument,        NULL,  'h'},
            {"version", no_argument,        NULL,  'V'},
    };
    char arg_opt_str[] = "i:o:a:hV";
    int arg_opt;
    int arg_opt_idx = 0;
    char should_finish = FALSE;

    if(argc == 1)
        should_finish = TRUE;

    while((arg_opt =
                   getopt_long(argc, argv, arg_opt_str, arg_long, &arg_opt_idx)) != -1 && !should_finish) {
        switch(arg_opt){
        	case 'i':
        		should_finish = TRUE;
        		break;
        	case 'o':
                should_finish = TRUE;
                break;
        	case 'h':
        		CommandHelp();
                should_finish = TRUE;
                break;
        	case 'V':
        		CommandVersion();
                should_finish = TRUE;
                break;
        	case 'a':
        	    should_finish = TRUE;
				break;
        	default:
        		CommandErrArg();
        		break;
        }
    }

    if(should_finish)
        return 0;

    return 0;
}
