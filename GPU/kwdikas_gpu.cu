
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <algorithm>


cudaError_t addWithCuda(int *c,  int *finalarr,  int arraySizex, int arraySizey, int size);

__global__ void addKernel(int *dev_c,  int *dev_finalarr, int arraySizex)
{
	
	int sum;
	int i = blockIdx.x*blockDim.x + threadIdx.x;
	int j = blockIdx.y*blockDim.y + threadIdx.y;
	int first0;
	int first1;
	int first2;
	int first3;
	int first4;
	int first5;
	int first6;
	int first7;
	int first8;

	
		if (i < arraySizex) {
			if (j < arraySizex) {

				//ypologimos twn gwniakwn pixel
				if (i == 0 && j == 0) {
					
					first0 = 0;
					first1 = 0;
					first2 = 0;
					first3 = 0;
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = dev_c[(i)*arraySizex + (j + 1)];
					first6 = 0;
					first7 = dev_c[(i + 1)*arraySizex + (j)];
					first8 = dev_c[(i + 1)*arraySizex + (j + 1)];
					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);
					

					if (sum < 0){
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if(sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				}
				else if (i == 0 && j == 511) {
					
					first0 = 0;
					first1 = 0;
					first2 = 0;
					first3 = dev_c[(i)*arraySizex + (j - 1)];
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = 0;
					first6 = dev_c[(i + 1)*arraySizex + (j - 1)];
					first7 = dev_c[(i + 1)*arraySizex + (j)];
					first8 = 0;

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				}
				else if (i == 511 && j == 0) {
					
					first0 = 0;
					first1 = dev_c[(i - 1)*arraySizex + (j)];
					first2 = dev_c[(i - 1)*arraySizex + (j + 1)];
					first3 = 0;
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = dev_c[(i)*arraySizex + (j + 1)];
					first6 = 0;
					first7 = 0;
					first8 = 0;

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				}
				else if (i == 511 && j == 511) {
					
					first0 = dev_c[(i - 1)*arraySizex + (j - 1)];
					first1 = dev_c[(i - 1)*arraySizex + (j)];
					first2 = 0;
					first3 = dev_c[(i)*arraySizex + (j - 1)];
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = 0;
					first6 = 0;
					first7 = 0;
					first8 = 0;

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				} // ypologismos twn perimetrikwn pixel
				else if (i == 0 && (j != 0 || j != 511)) {
					

					first0 = 0;
					first1 = 0;
					first2 = 0;
					first3 = dev_c[(i)*arraySizex + (j - 1)];
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = dev_c[(i)*arraySizex + (j + 1)];
					first6 = dev_c[(i + 1)*arraySizex + (j - 1)];
					first7 = dev_c[(i + 1)*arraySizex + (j)];
					first8 = dev_c[(i + 1)*arraySizex + (j - 1)];

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				}
				else if (i == 511 && (j != 0 || j != 511)) {
					
					first0 = dev_c[(i - 1)*arraySizex + (j - 1)];
					first1 = dev_c[(i - 1)*arraySizex + (j)];
					first2 = dev_c[(i - 1)*arraySizex + (j + 1)];
					first3 = dev_c[(i)*arraySizex + (j - 1)];
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = dev_c[(i)*arraySizex + (j + 1)];
					first6 = 0;
					first7 = 0;
					first8 = 0;

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				}
				else if (j == 0 && (i != 0 || i != 511)) {
					
					first0 = 0;
					first1 = dev_c[(i - 1)*arraySizex + (j)];
					first2 = dev_c[(i - 1)*arraySizex + (j + 1)];
					first3 = 0;
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = dev_c[(i)*arraySizex + (j + 1)];
					first6 = 0;
					first7 = dev_c[(i + 1)*arraySizex + (j)];
					first8 = dev_c[(i + 1)*arraySizex + (j + 1)];

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				}
				else if (j == 511 && (i != 0 || i != 511)) {
					

					first0 = dev_c[(i - 1)*arraySizex + (j - 1)];
					first1 = dev_c[(i - 1)*arraySizex + (j)];
					first2 = 0;
					first3 = dev_c[(i)*arraySizex + (j - 1)];
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = 0;
					first6 = dev_c[(i + 1)*arraySizex + (j - 1)];
					first7 = dev_c[(i + 1)*arraySizex + (j)];
					first8 = 0;

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}

				}
				else { //ypologismos twn eswterikwn pixel

					first0 = dev_c[(i - 1)*arraySizex + (j - 1)];
					first1 = dev_c[(i - 1)*arraySizex + (j)];
					first2 = dev_c[(i - 1)*arraySizex + (j + 1)];
					first3 = dev_c[(i)*arraySizex + (j - 1)];
					first4 = dev_c[(i)*arraySizex + (j)];
					first5 = dev_c[(i)*arraySizex + (j + 1)];
					first6 = dev_c[(i + 1)*arraySizex + (j - 1)];
					first7 = dev_c[(i + 1)*arraySizex + (j)];
					first8 = dev_c[(i + 1)*arraySizex + (j + 1)];

					sum = 0;
					sum = first0 * (-1) + first1 * (-1) + first2 * (-1) + first3 * (-1) + first4 * (9) + first5 * (-1) + first6 * (-1) + first7 * (-1) + first8 * (-1);


					if (sum < 0) {
						dev_finalarr[(i)*arraySizex + (j)] = 0;
					}
					else if (sum > 255) {
						dev_finalarr[i * arraySizex + j] = 255;
					}
					else {
						dev_finalarr[i * arraySizex + j] = sum;
					}


				}




			}


		}
		


}

int main()
{
	
	FILE * pFile;

	char readChars[256];
	int arraySizex = 512;
	int arraySizey = 512;
	int size = arraySizex * arraySizey;
	int* c = (int*)malloc(sizeof(int*) * size);
	
	int* finalarr = (int*)malloc(sizeof(int*) * size);
	
	
	

	pFile = fopen("baboon.ascii.pgm", "r");
	//skip 4 lines
	fgets(readChars, 255, pFile);
	fgets(readChars, 255, pFile);
	fgets(readChars, 255, pFile);
	fgets(readChars, 255, pFile);
	//read the pixels from pgm file
	for (int i = 0; i < arraySizex; i++)
	{
		for (int j = 0; j < arraySizey; j++)
		{
			fscanf(pFile, "%s", readChars);
			int sum = atoi(readChars);
			c[i*arraySizex + j] = sum;
			
		}
	}
	fclose(pFile);
	cudaError_t cudaStatus = addWithCuda(c, finalarr, arraySizex, arraySizey, size);
	free(c);
	free(finalarr);
    return 0;
}

// Helper function for using CUDA to add vectors in parallel.
cudaError_t addWithCuda(int *c,  int *finalarr,  int arraySizex, int arraySizey, int size)
{	
	clock_t tic = clock();
	dim3 threadsPerBlock(32, 32,1);
	dim3 numBlocks(512 / threadsPerBlock.x, 512 / threadsPerBlock.y,1);
	
    int *dev_c;
	int *dev_finalarr;
	FILE * nFile;
    
    cudaError_t cudaStatus;
	clock_t tic2 = clock();
	//metafora dedomenwn apo CPU stin GPU
	cudaStatus = cudaSetDevice(0);
	cudaStatus = cudaMalloc(&dev_c, size * sizeof(int));
	cudaStatus = cudaMemcpy(dev_c, c, size * sizeof(int), cudaMemcpyHostToDevice);
	cudaStatus = cudaMalloc(&dev_finalarr, size * sizeof(int));
	cudaStatus = cudaMemcpy(dev_finalarr, finalarr, size * sizeof(int), cudaMemcpyHostToDevice);
	clock_t toc2 = clock();
	printf(" %f copy data from CPU to GPU\n", (double)(toc2 - tic2) / CLOCKS_PER_SEC);
    // Launch a kernel on the GPU with one thread for each element.
	clock_t tic1 = clock();
	addKernel <<< numBlocks, threadsPerBlock >>>(dev_c, dev_finalarr, arraySizex);
	
	cudaStatus = cudaGetLastError();
	//metafora dedomenwn apo GPU stin CPU
	cudaStatus = cudaMemcpy(finalarr, dev_finalarr, size * sizeof(int), cudaMemcpyDeviceToHost);
	clock_t toc1 = clock();
	printf(" %f Time spent in GPU\n", (double)(toc1 - tic1) / CLOCKS_PER_SEC);
	nFile = fopen("baboon1.ascii.pgm", "w");
	//write the first 4 lines in new pgm file
	fprintf(nFile, "P2\n");
	fprintf(nFile, "# baboon.pgma created by PGMA_IO::PGMA_WRITE.\n");
	fprintf(nFile, "512  512\n");
	fprintf(nFile, "255\n");
	//write the new pixels in the pgm file
	for (int i = 0; i < arraySizex; i++)
	{
		for (int j = 0; j < arraySizey; j++)
		{
			fprintf(nFile, "%d  ", finalarr[i*arraySizex + j]);
			
		}
		fprintf(nFile, "\n");
	}
	
	fclose(nFile);

	clock_t toc = clock();
	printf(" %f Total time seconds\n", (double)(toc-tic) / CLOCKS_PER_SEC);
    cudaFree(dev_c);
	cudaFree(dev_finalarr);
	
    
    
    return cudaStatus;
}
