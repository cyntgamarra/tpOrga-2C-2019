#ifndef TP0_COMMAND_H
#define TP0_COMMAND_H

#define FALSE 0
#define TRUE 1

typedef struct {
    char error;
} CommandOptions;

/**
 * Help Command
 * Imprime por salida estandar los distintos comandos posibles.
 * Pre: N/A
 * Post: N/A
 */
void CommandHelp();

/**
 * Imprime la ayuda por la salida de errores
 */
void CommandErrArg();

/**
 * Version Command
 * Imprime por salida estandar la version del codigo
 * Pre: N/A
 * Post: N/A
 */
void CommandVersion();

/**
 * Inicializa TDA CommandOptions
 * Pre: Puntero a Command Options escribible
 * Post: CommandOptions Inicializados a valores por default
 * Valores default:
 *      input: stdin
 *      output stdout
 *      error: FALSE
 *      encode_opt: decode
 */
void CommandCreate(CommandOptions* opt);


/**
 * Indica que hubo un error
 */
void CommandSetError(CommandOptions *opt);

/**
 * Devuelve el flag de error
 */
char CommandHasError(CommandOptions *opt);

#endif //TP0_COMMAND_H
