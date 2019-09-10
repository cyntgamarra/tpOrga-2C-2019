#define ERROR 0
#define FALSE 0
#define TRUE 1

#include <getopt.h>
#include "command.h"
#include "reading.h"
#include <stddef.h>

int main(int argc, char** argv) {

    struct option arg_long[] = {
            {"help",    no_argument,        NULL,  'h'},
            {"version", no_argument,        NULL,  'V'},
            {"input",   required_argument,  NULL,  'i'},
            {"output",  required_argument,  NULL,  'o'},
    };
    char arg_opt_str[] = "<:>:a:hV";
    int arg_opt;
    int arg_opt_idx = 0;
    char should_finish = FALSE;

    CommandOptions cmd_opt;
    CommandCreate(&cmd_opt);

    if(argc == 1)
        CommandSetError(&cmd_opt);

    while((arg_opt =
                   getopt_long(argc, argv, arg_opt_str, arg_long, &arg_opt_idx)) != -1 && !should_finish) {
        switch(arg_opt){
            case 'h':
                CommandHelp();
                should_finish = TRUE;
                break;
            case 'V':
                CommandVersion();
                should_finish = TRUE;
                break;
            case '<':
                CommandSetInput(&cmd_opt, optarg);
                should_finish = TRUE;
                break;
            case '>':
                CommandSetOutput(&cmd_opt, optarg);
                should_finish = TRUE;
                break;
            default:
                CommandSetError(&cmd_opt);
                break;
        }
    }

    if(should_finish)
        return 0;

    if(!CommandHasError(&cmd_opt)) {
    /*  Si no hubo error aca llamar a las funciones para multiplicar*/
        process();
        //CommandProcess(&cmd_opt);
        return 0;
    } else {
        CommandErrArg();
        return 1;
    }

    return 0;
}
