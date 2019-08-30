#ifndef TP0_COMMAND_H
#define TP0_COMMAND_H

#define CMD_ENCODE 1
#define CMD_DECODE 0
#define CMD_NOENCODE 2
#define FALSE 0
#define TRUE 1

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

#endif //TP0_COMMAND_H
