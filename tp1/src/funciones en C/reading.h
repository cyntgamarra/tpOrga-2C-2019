#ifndef READING_H
#define READING_H 

#include "matrix.h"
#include <stdbool.h>

// Lee el array de una matriz por stdin
// con el formato especificado
bool read_matrix_array(int n, double* array);

// Lee por stdin una linea compuesta por 2
// matrices, las multiplica 
// e imprime el resultado
bool read_and_multiply(int n);

// Multica las matrices de cada linea,
// imprimiendo su resultado por stdout
bool process();

#endif
