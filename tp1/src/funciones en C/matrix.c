#include "matrix.h"

matrix_t* create_matrix(size_t rows, size_t cols){
    matrix_t* m = (matrix_t*)malloc(sizeof(matrix_t));
    if (!m){
        return NULL;
    }
    m->rows = rows;
    m->cols = cols;
    m->array = (double*)malloc(sizeof(double) * rows * cols);
    if (!(m->array)){
        free(m);
        return NULL;
    }
    return m;
}

void destroy_matrix(matrix_t* m){
    free(m->array);
    free(m);
}

int print_matrix(FILE* fp, matrix_t* m){
    int correct = fprintf(fp, "%lu ", m->rows);
    if (correct < 0){
       return -1;
    }

    for (int r = 0; r < m->rows; r++){
        for (int c = 0; c < m->cols; c++){
            size_t i = (r * (m->cols)) + c;
            correct = fprintf(fp, "%g ", m->array[i]);
            if (correct < 0){
                return -1;
            }
        }
    }

    correct = fprintf(fp, "\n");
    if (correct < 0){
       return -1;
    }
    return 0;
}

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2){
    matrix_t* new = create_matrix(m1->rows, m1->cols);
    if (!new){
        return NULL;
    }

    for (size_t r1 = 0; r1 < m1->rows; r1++) {
        for (size_t c2 = 0; c2 < m2->cols; c2++) {
            double sum = 0.0;

            for (size_t r2 = 0; r2 < m2->rows; r2++){
                int index_m1 = (r1 * m1->cols) + r2;
                int index_m2 = (r2 * m2->cols) + c2;
                sum += m1->array[index_m1] * m2->array[index_m2];
            }

            int index_new = (r1 * m1->cols) + c2;
            new->array[index_new] = sum;
        }

    }

    return new;
}

