#include "reading.h"

bool read_matrix_array(int n, double* array){
	int len = n * n;
	for (int i = 0; i < len; i++){
		if (scanf("%lg", &(array[i])) == 0){
			return false;
		}
	}
	return true;
}

bool read_and_multiply(int n){
	matrix_t* m1 = create_matrix(n, n);
	matrix_t* m2 = create_matrix(n, n);

	if ((!m1) || (!m2)){
		return false;
	}

	bool read_m1 = read_matrix_array(n, m1->array);
	bool read_m2 = read_matrix_array(n, m2->array);

	if ((!read_m1) || (!read_m2)){
		return false;
	}

	matrix_t* m3 = matrix_multiply(m1, m2);
	print_matrix(stdout, m3);
	return true;
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

