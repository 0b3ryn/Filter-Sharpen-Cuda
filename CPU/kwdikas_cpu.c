

#include <time.h>
#include <stdlib.h>
#include <stdio.h>



int main()
{
	clock_t tic = clock();
	FILE * pFile;
	FILE * nFile;
	char readChars[256];
	
	
	char readChars1[256];
	int sum;
	int arraySizex = 512;
	int arraySizey = 512;
	int size = arraySizex * arraySizey;
	int* c = (int*)malloc(sizeof(int*) * size);
	int **arr = (int **)malloc(3 * sizeof(int *));
	int **temp_final = (int **)malloc(3 * sizeof(int *));
	int **temp_first = (int **)malloc(3 * sizeof(int *));
	for (int i = 0; i < 3; i++) {
		arr[i] = (int *)malloc(3 * sizeof(int));
		temp_final[i] = (int *)malloc(3 * sizeof(int));
		temp_first[i] = (int *)malloc(3 * sizeof(int));
	}
	//dimiourgia filtrou
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			if (i == 1 && j == 1) {
				arr[i][j] = 9;
			}
			else
			{
				arr[i][j] = -1;
			}
			
			
		}
	}
	
	
	// read the pgm file
	pFile = fopen("baboon.ascii.pgm", "r");
	nFile = fopen("baboon1.ascii.pgm", "w");
	// skip 4 lines
	fgets(readChars, 255, pFile);
	fgets(readChars, 255, pFile);
	fgets(readChars, 255, pFile);
	fgets(readChars, 255, pFile);
	//write the headline of the new pgm file
	fprintf(nFile, "P2\n");
	fprintf(nFile, "# baboon.pgma created by PGMA_IO::PGMA_WRITE.\n");
	fprintf(nFile, "512  512\n");
	fprintf(nFile, "255\n");
	
	//read from pgm file
	for (int i = 0; i < arraySizex; i++)
	{
		for (int j = 0; j < arraySizey; j++)
		{
			fscanf(pFile, "%s", readChars);
			int sum = atoi(readChars); //from string to integer
			c[i*arraySizex + j] = sum;
		}
	}
	sum = 0;
	for (int i = 0; i < 512; i++)
	{
		for (int j = 0; j < 512; j++)
		{
			//ypologismos gwniakwn pixel
			if (i == 0 && j == 0) {
				
				temp_first[0][0] = 0;
				temp_first[0][1] = 0;
				temp_first[0][2] = 0;
				temp_first[1][0] = 0;
				temp_first[1][1] = c[(i )*arraySizex + (j )];
				temp_first[1][2] = c[(i )*arraySizex + (j + 1)];
				temp_first[2][0] = 0;
				temp_first[2][1] = c[(i + 1)*arraySizex + (j )];
				temp_first[2][2] = c[(i + 1)*arraySizex + (j + 1)];

			}
			else if (i == 0 && j == 511) {
				
				temp_first[0][0] = 0;
				temp_first[0][1] = 0;
				temp_first[0][2] = 0;
				temp_first[1][0] = c[(i)*arraySizex + (j-1)];
				temp_first[1][1] = c[(i)*arraySizex + (j)];
				temp_first[1][2] = 0;
				temp_first[2][0] = c[(i+1)*arraySizex + (j-1)];
				temp_first[2][1] = c[(i+1)*arraySizex + (j)];
				temp_first[2][2] = 0;
			
			}
			else if (i == 511 && j == 0) {
				
				temp_first[0][0] = 0;
				temp_first[0][1] = c[(i-1)*arraySizex + (j)];
				temp_first[0][2] = c[(i-1)*arraySizex + (j+1)];
				temp_first[1][0] = 0;
				temp_first[1][1] = c[(i)*arraySizex + (j)];
				temp_first[1][2] = c[(i)*arraySizex + (j + 1)];
				temp_first[2][0] = 0;
				temp_first[2][1] = 0;
				temp_first[2][2] = 0;
				
			}
			else if (i == 511 && j == 511) {
				
				temp_first[0][0] = c[(i-1)*arraySizex + (j-1)];
				temp_first[0][1] = c[(i - 1)*arraySizex + (j)];
				temp_first[0][2] = 0;
				temp_first[1][0] = c[(i)*arraySizex + (j-1)];
				temp_first[1][1] = c[(i)*arraySizex + (j)];
				temp_first[1][2] = 0;
				temp_first[2][0] = 0;
				temp_first[2][1] = 0;
				temp_first[2][2] = 0;

			} // ypologismos perimetrikwn pixel
			else if (i == 0 && (j!=0 || j!=511)) {
				

				temp_first[0][0] = 0;
				temp_first[0][1] = 0;
				temp_first[0][2] = 0;
				temp_first[1][0] = c[(i)*arraySizex + (j - 1)];
				temp_first[1][1] = c[(i)*arraySizex + (j)];
				temp_first[1][2] = c[(i)*arraySizex + (j+1)];
				temp_first[2][0] = c[(i+1)*arraySizex + (j-1)];
				temp_first[2][1] = c[(i+1)*arraySizex + (j)];
				temp_first[2][2] = c[(i+1)*arraySizex + (j - 1)];
			
			}
			else if (i == 511 && (j != 0 || j != 511)) {
				
				temp_first[0][0] = c[(i-1)*arraySizex + (j - 1)];
				temp_first[0][1] = c[(i - 1)*arraySizex + (j )];
				temp_first[0][2] = c[(i - 1)*arraySizex + (j + 1)];
				temp_first[1][0] = c[(i)*arraySizex + (j - 1)];
				temp_first[1][1] = c[(i)*arraySizex + (j)];
				temp_first[1][2] = c[(i)*arraySizex + (j + 1)];
				temp_first[2][0] = 0;
				temp_first[2][1] = 0;
				temp_first[2][2] = 0;
			
			}
			else if (j == 0 && (i != 0 || i != 511)) {
				
				temp_first[0][0] = 0;
				temp_first[0][1] = c[(i - 1)*arraySizex + (j)];
				temp_first[0][2] = c[(i - 1)*arraySizex + (j + 1)];
				temp_first[1][0] = 0;
				temp_first[1][1] = c[(i)*arraySizex + (j)];
				temp_first[1][2] = c[(i)*arraySizex + (j + 1)];
				temp_first[2][0] = 0;
				temp_first[2][1] = c[(i + 1)*arraySizex + (j)];
				temp_first[2][2] = c[(i + 1)*arraySizex + (j + 1)];
			
			}
			else if (j == 511 && (i != 0 || i != 511)) {
				

				temp_first[0][0] = c[(i - 1)*arraySizex + (j - 1)];
				temp_first[0][1] = c[(i - 1)*arraySizex + (j)];
				temp_first[0][2] = 0;
				temp_first[1][0] = c[(i)*arraySizex + (j - 1)];
				temp_first[1][1] = c[(i)*arraySizex + (j)];
				temp_first[1][2] = 0;
				temp_first[2][0] = c[(i + 1)*arraySizex + (j - 1)];
				temp_first[2][1] = c[(i + 1)*arraySizex + (j )];
				temp_first[2][2] = 0;

			}
			else { // ypologismos eswterikwn pixel
				
				for (int q = -1; q < 2; q++)
				{
					for (int n = -1; n < 2; n++)
					{
						temp_first[q + 1][n + 1] = c[(i + q)*arraySizex + (j + n)];
						
						
					}
				}
			}
			for (int c = 0; c < 3; c++) {
				for (int d = 0; d < 3; d++) {
					sum += arr[c][d] * temp_first[c][d];

					
				}
				
			}
			
			if (sum < 1) {
				fprintf(nFile, "%d  ", 0);
			}
			else if (sum > 255){
				
				fprintf(nFile, "%d  ", 255);
			}
			else {
				fprintf(nFile, "%d  ", sum );
			}
			sum = 0;
		}
		fprintf(nFile, "\n");
	}
	fclose(pFile);
	
	
	clock_t toc = clock();
	printf(" %f seconds\n",(double)(toc-tic )/ CLOCKS_PER_SEC);
	free(c);
	free(arr);
	free(temp_first);
	free(temp_final);
	
	return 0;

}



