/*
 * main.cpp
 *
 *  Created on: Mar 2, 2020
 *      Author: Kat Li Yang
 */

#include <cstdio>
#include <iomanip>
#include <iostream>
#include <fstream>
#include <vector>
#include <random>
#include "softposit_cpp.h"
#include "half.hpp"

using namespace std;
using namespace half_float;

#define INPUT_LAYER 784
#define HIDDEN_LAYER 64
#define OUTPUT_LAYER 10
#define N_INPUTS 60000
#define ITERATIONS 5000
#define BATCH_SIZE 128
#define LEARN_RATE 1
#define TEST_SIZE 10000

void print(vector<half> A);
void print(vector<vector<half>> A);
void read_files(vector<vector<uint8_t>> &inputs, vector<vector<uint8_t>> &outputs, vector<vector<half>> &hidden_weights, vector<vector<half>> &output_weights, vector<vector<half>> &test_inputs, vector<half> &test_outputs);
void get_data(vector<int> random, vector<vector<uint8_t>> &inputs, vector<vector<uint8_t>> &outputs, vector<vector<half>> &data, vector<vector<half>> &truth, int batch_size);
void matmul(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C, vector<vector<half>> &D);
void matmul(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C, vector<half> &D);
void matmul(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C);
vector<vector<half>> transpose(vector<vector<half>> &A);
void sigmoid(vector<vector<half>> &A, vector<vector<half>> &B);
void d_output(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C);
void d_hidden(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C);
void d_weight(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C, int batch_size);
void d_act(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C);
vector<vector<half>> d_sigmoid(vector<vector<half>> &A);
void update_weight(vector<vector<half>> &A, vector<vector<half>> &B, int learn_rate);
void update_bias(vector<half> &A, vector<vector<half>> &B, int learn_rate, int batch_size);
double error(vector<vector<half>> &A, vector<vector<half>> &B, int batch_size);

int main(int argc, char *argv[]){

	default_random_engine generator(random_device{}());
	uniform_int_distribution<int> distribution(0, N_INPUTS-1);
	vector<int> random(BATCH_SIZE);

	vector<vector<uint8_t>> inputs(INPUT_LAYER);
	for (int i = 0; i < INPUT_LAYER; i++) {
		inputs[i].resize(N_INPUTS);
	}
	vector<vector<uint8_t>> outputs(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		outputs[i].resize(N_INPUTS);
	}
	vector<vector<half>> test_inputs(INPUT_LAYER);
	for (int i = 0; i < INPUT_LAYER; i++) {
		test_inputs[i].resize(TEST_SIZE);
	}
	vector<half> test_outputs(TEST_SIZE);
	vector<vector<half>> hidden_weight(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		hidden_weight[i].resize(INPUT_LAYER);
	}
	vector<half> hidden_bias(HIDDEN_LAYER);
	vector<vector<half>> output_weight(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		output_weight[i].resize(HIDDEN_LAYER);
	}
	vector<half> output_bias(OUTPUT_LAYER);
	vector<vector<half>> d_hidden_weight(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		d_hidden_weight[i].resize(INPUT_LAYER);
	}
	vector<half> d_hidden_bias(HIDDEN_LAYER);
	vector<vector<half>> d_output_weight(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		d_output_weight[i].resize(HIDDEN_LAYER);
	}
	vector<half> d_output_bias(OUTPUT_LAYER);

	vector<vector<half>> data(INPUT_LAYER);
	for (int i = 0; i < INPUT_LAYER; i++) {
		data[i].resize(BATCH_SIZE);
	}
	vector<vector<half>> truth(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		truth[i].resize(BATCH_SIZE);
	}

	vector<vector<half>> hidden_val(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		hidden_val[i].resize(BATCH_SIZE);
	}
	vector<vector<half>> hidden_act(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		hidden_act[i].resize(BATCH_SIZE);
	}
	vector<vector<half>> output_val(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		output_val[i].resize(BATCH_SIZE);
	}
	vector<vector<half>> d_hidden_val(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		d_hidden_val[i].resize(BATCH_SIZE);
	}
	vector<vector<half>> d_hidden_act(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		d_hidden_act[i].resize(BATCH_SIZE);
	}
	vector<vector<half>> d_output_val(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		d_output_val[i].resize(BATCH_SIZE);
	}
	vector<vector<half>> output_act(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		output_act[i].resize(BATCH_SIZE);
	}

	vector<vector<half>> test_hidden_val(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		test_hidden_val[i].resize(TEST_SIZE);
	}
	vector<vector<half>> test_hidden_act(HIDDEN_LAYER);
	for (int i = 0; i < HIDDEN_LAYER; i++) {
		test_hidden_act[i].resize(TEST_SIZE);
	}
	vector<vector<half>> test_output_val(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		test_output_val[i].resize(TEST_SIZE);
	}
	vector<vector<half>> test_output_act(OUTPUT_LAYER);
	for (int i = 0; i < OUTPUT_LAYER; i++) {
		test_output_act[i].resize(TEST_SIZE);
	}
	read_files(inputs, outputs, hidden_weight, output_weight, test_inputs, test_outputs);

//	for (int i = 0; i < 28; i++) {
//		for (int j = 0; j < 28; j++) {
//			cout << setw(5) << test_inputs[j*28 + i][9999];
//		}
//		cout << endl;
//	}
//
//	cout << test_outputs[9999] << endl;
	ofstream file;
	file.open("test.txt");

	for (int i = 0; i < ITERATIONS; i++) {
		for (int i = 0; i < BATCH_SIZE; i++) {
			random[i] = distribution(generator);
		}
		get_data(random, inputs, outputs, data, truth, BATCH_SIZE);
		matmul(hidden_weight, data, hidden_val, hidden_bias);
		sigmoid(hidden_val, hidden_act);
		matmul(output_weight, hidden_act, output_val, output_bias);
		sigmoid(output_val, output_act);
		file << error(truth, output_act, BATCH_SIZE) << endl;
		d_output(output_act, truth, d_output_val);
		d_weight(d_output_val, hidden_act, d_output_weight, BATCH_SIZE);
		d_act(output_weight, d_output_val, d_hidden_act);
		d_hidden(d_hidden_act, hidden_act, d_hidden_val);
		d_weight(d_hidden_val, data, d_hidden_weight, BATCH_SIZE);
		update_weight(hidden_weight, d_hidden_weight, LEARN_RATE);
		update_bias(hidden_bias, d_hidden_val, LEARN_RATE, BATCH_SIZE);
		update_weight(output_weight, d_output_weight, LEARN_RATE);
		update_bias(output_bias, d_output_val, LEARN_RATE, BATCH_SIZE);
	}

	file.close();

	matmul(hidden_weight, test_inputs, test_hidden_val, hidden_bias);
	sigmoid(test_hidden_val, test_hidden_act);
	matmul(output_weight, test_hidden_act, test_output_val, output_bias);
	sigmoid(test_output_val, test_output_act);
	double correct = 0;
	for (int i = 0; i < TEST_SIZE; i++) {
		half max = test_output_act[0][i];
		int max_idx = 1;
		for (int j = 1; j < OUTPUT_LAYER; j++) {
			if (test_output_act[j][i] > max) {
				max = test_output_act[j][i];
				max_idx = j + 1;
			}
		}
		if (test_outputs[i] == max_idx) {
			correct = correct + 1;
		}
	}
	cout << correct / TEST_SIZE * 100 << endl;
	return 0;
}

void print(vector<half> A) {
	for (int i = 0; i < (int)A.size(); i++) {
		cout << A[i];
	}
	cout << endl;
}

void print(vector<vector<half>> A) {
	for (int i = 0; i < (int)A.size(); i++) {
		for (int j = 0; j < (int)A[0].size(); j++) {
				cout << A[i][j];
		}
		cout << endl;
	}
}

void read_files(vector<vector<uint8_t>> &inputs, vector<vector<uint8_t>> &outputs, vector<vector<half>> &hidden_weights, vector<vector<half>> &output_weights, vector<vector<half>> &test_inputs, vector<half> &test_outputs) {
	string line;
	ifstream file;
	int count = 0;

	file.open("input.txt");

	if (file.is_open()) {
		while(getline(file, line)) {
			inputs[count % INPUT_LAYER][count / INPUT_LAYER] = (uint8_t)stoi(line);
			count++;
		}
		file.close();
	}

	count = 0;
	file.open("output.txt");

	if (file.is_open()) {
		while(getline(file, line)) {
			outputs[count % OUTPUT_LAYER][count / OUTPUT_LAYER] = (uint8_t)stoi(line);
			count++;
		}
		file.close();
	}

	count = 0;
	file.open("hidden_weight.txt");

	if (file.is_open()) {
		while(getline(file, line)) {
			hidden_weights[count % HIDDEN_LAYER][count / HIDDEN_LAYER] = (half)stod(line);
			count++;
		}
		file.close();
	}

	count = 0;
	file.open("output_weight.txt");

	if (file.is_open()) {
		while(getline(file, line)) {
			output_weights[count % OUTPUT_LAYER][count / OUTPUT_LAYER] = (half)stod(line);
			count++;
		}
		file.close();
	}

	count = 0;
	file.open("test_input.txt");
	if (file.is_open()) {
		while(getline(file, line)) {
			test_inputs[count % INPUT_LAYER][count / INPUT_LAYER] = (half)((double)stoi(line) / 256);
			count++;
		}
		file.close();
	}

	count = 0;
	file.open("test_output.txt");

	if (file.is_open()) {
		while(getline(file, line)) {
			test_outputs[count] = (half)stoi(line);
			count++;
		}
		file.close();
	}

	return;
}

void get_data(vector<int> random, vector<vector<uint8_t>> &inputs, vector<vector<uint8_t>> &outputs, vector<vector<half>> &data, vector<vector<half>> &truth, int batch_size) {
	for (int i = 0; i < batch_size; i++) {
		int index = random[i];
		for (int j = 0; j < INPUT_LAYER; j++) {
			data[j][i] = (half)((double)inputs[j][index] / 256);
		}
		for (int j = 0; j < OUTPUT_LAYER; j++) {
			truth[j][i] = outputs[j][index];
		}
	}
}

void matmul(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C, vector<vector<half>> &D) {
	int m = A.size();
	int n = B.size();
	int p = B[0].size();
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < p; j++) {
			C[i][j] = D[i][j];
			for (int k = 0; k < n; k++) {
				C[i][j] += A[i][k] * B[k][j];
			}
		}
	}
}

void matmul(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C, vector<half> &D) {
	int m = A.size();
	int n = B.size();
	int p = B[0].size();
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < p; j++) {
			C[i][j] = D[i];
			for (int k = 0; k < n; k++) {
				C[i][j] += A[i][k] * B[k][j];
			}
		}
	}
}

void matmul(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C) {
	int m = A.size();
	int n = B.size();
	int p = B[0].size();
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < p; j++) {
			C[i][j] = 0;
			for (int k = 0; k < n; k++) {
				C[i][j] += A[i][k] * B[k][j];
			}
		}
	}
}

vector<vector<half>> transpose(vector<vector<half>> &A) {
	vector<vector<half>> B((int)A[0].size());
	for (int i = 0; i < (int)A[0].size(); i++) {
		B[i].resize((int)A.size());
	}
	for (int i = 0; i < (int)A.size(); i++) {
		for (int j = 0; j < (int)A[0].size(); j++) {
			B[j][i] = A[i][j];
		}
	}
	return B;
}

void sigmoid(vector<vector<half>> &A, vector<vector<half>> &B) {
	for (int i = 0; i < (int)A.size(); i++) {
		for (int j = 0; j < (int)A[0].size(); j++) {
			B[i][j] = (half)((double)1 / (1 + exp(-(double)A[i][j])));
		}
	}
}

void d_output(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C) {
	for (int i = 0; i < (int)A.size(); i++) {
		for (int j = 0; j < (int)A[0].size(); j++) {
			C[i][j] = A[i][j] - B[i][j];
		}
	}
}

void d_hidden(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C) {
	vector<vector<half>> temp = d_sigmoid(B);
	for (int i = 0; i < (int)C.size(); i++) {
		for (int j = 0; j < (int)C[0].size(); j++) {
			C[i][j] = A[i][j] * B[i][j];
		}
	}
}

void d_weight(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C, int batch_size) {
	vector<vector<half>> temp = transpose(B);
	matmul(A, temp, C);
	for (int i = 0; i < (int)C.size(); i++) {
		for (int j = 0; j < (int)C[0].size(); j++) {
			C[i][j] = C[i][j] / batch_size;
		}
	}
}

void d_act(vector<vector<half>> &A, vector<vector<half>> &B, vector<vector<half>> &C) {
	vector<vector<half>> temp = transpose(A);
	matmul(temp, B, C);
}

vector<vector<half>> d_sigmoid(vector<vector<half>> &A) {
	vector<vector<half>> B((int)A.size());
	for (int i = 0; i < (int)A.size(); i++) {
		B[i].resize((int)A[0].size());
	}
	for (int i = 0; i < (int)A.size(); i++) {
		for (int j = 0; j < (int)A[0].size(); j++) {
			B[i][j] = A[i][j] * (1 - A[i][j]);
		}
	}
	return B;
}

void update_weight(vector<vector<half>> &A, vector<vector<half>> &B, int learn_rate) {
	for (int i = 0; i < (int)A.size(); i++) {
		for (int j = 0; j < (int)A[0].size(); j++) {
			A[i][j] = A[i][j] - learn_rate * B[i][j];
		}
	}
}

void update_bias(vector<half> &A, vector<vector<half>> &B, int learn_rate, int batch_size) {
	for (int i = 0; i < (int)A.size(); i++) {
		half sum(0);
		for (int j = 0; j < (int)B[0].size(); j++) {
			sum += B[i][j];
		}
		A[i] = A[i] - learn_rate * (sum / batch_size);
	}
}

double error(vector<vector<half>> &A, vector<vector<half>> &B, int batch_size) {
	double result = 0;
	for (int i = 0; i < (int)A.size(); i++) {
		for (int j = 0; j < (int)A[0].size(); j++) {
			if (B[i][j] > 0 && (1 - B[i][j]) > 0) {
				result += (double)A[i][j] * log((double)B[i][j]) + (double)(1 - A[i][j]) * log(1 - (double)B[i][j]);
			}
		}
	}
	return -result / batch_size;
}
