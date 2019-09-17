#define ERROR 0
#define FALSE 0
#define TRUE 1

#include <getopt.h>
#include "command.h"
#include "reading.h"
#include <stddef.h>

int main(int argc, char** argv) {

    char should_finish = FALSE;
    CommandOptions cmd_opt;
    CommandCreate(&cmd_opt);

    char arg_opt_str[] = "hV";
    int arg_opt = getopt(argc, argv, arg_opt_str);
    while ((arg_opt != -1) && (!should_finish)){
        switch(arg_opt){
            case 'h':
                CommandHelp();
                should_finish = TRUE;
                break;
            case 'V':
                CommandVersion();
                should_finish = TRUE;
                break;
            default:
                CommandSetError(&cmd_opt);
                break;
        }
        arg_opt = getopt(argc, argv, arg_opt_str);
    }


    if(should_finish)
        return 0;

    if(!CommandHasError(&cmd_opt)) {
        if (!process()){
            return 1;
        }
        return 0;
    } else {
        CommandErrArg();
        return 1;
    }

    return 0;
}
