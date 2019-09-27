#include "reading.h"

// Devuelve true si lo siguiente a leer por stdin
// es "\n" (new line) o " \n" (espacio + new line).
// De lo contrario devuelve false.
bool is_next_new_line(){
    int c;
    c = fgetc(stdin);
    if (c == ' '){
    	int d = fgetc(stdin);
    	if (d == '\n'){
    		return true;
    	}
    	ungetc(d, stdin);
    }
    if (c == '\n'){
    	return true;
    }
    ungetc(c, stdin);
    return false;
}

bool read_matrix_array(int n, double* array){
	int len = n * n;
	for (int i = 0; i < len; i++){
		if (scanf("%lg", &(array[i])) <= 0){
			fprintf(stderr, "Error al leer archivo\n");
			return false;
		}
		if ((i != (len -1)) && is_next_new_line()){
			fprintf(stderr, "Error al leer archivo\n");
			return false;
		}
	}
	return true;
}

bool read_and_multiply(int n){
	matrix_t* m1 = create_matrix(n, n);
	if (!m1){
		fprintf(stderr, "Error de memoria\n");
		return false;
	}
	matrix_t* m2 = create_matrix(n, n);
	if (!m2){
		fprintf(stderr, "Error de memoria\n");
		destroy_matrix(m1);
		return false;
	}

	bool read_m1 = read_matrix_array(n, m1->array);
	if (!read_m1){
		destroy_matrix(m1);
		destroy_matrix(m2);
		return false;
	}
	
	bool read_m2 = read_matrix_array(n, m2->array);
	if (!read_m2){
		destroy_matrix(m1);
		destroy_matrix(m2);
		return false;
	}

	matrix_t* m3 = matrix_multiply(m1, m2);
	bool ret = true;
	if (print_matrix(stdout, m3) < 0){
		fprintf(stderr, "Error al imprimir matriz\n");
		ret = false;
	}
	destroy_matrix(m1);
	destroy_matrix(m2);
	destroy_matrix(m3);
	return ret;
}

bool process(){
	int n;
	while (scanf("%d", &n) != EOF){
		if (!read_and_multiply(n)){
			return false;
		}
	}
	return true;
}

