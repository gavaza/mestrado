// programa diagonal
void main() {
	char *program;
	// ler toda a entrada corrente,
	// alocando a quantidade de memoria
	// necessaria.
	// mscanf e' garantida terminar.
	mscanf("%s", &program);
	if (Halts(program, program) == 1) {
		while(1) { }
	}
}
