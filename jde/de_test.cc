
#include "de_test.h"

double *OShift,*M,*y,*z,*x_bound;
int ini_flag=0, n_flag,func_flag;

int g_function_number;
int g_problem_size;
unsigned int g_max_num_evaluations;

int g_pop_size;
int g_init_pop_size;
int g_num_reduction;
double g_tau_sf;
double g_tau_cr;

int main(int argc, char **argv) {
  //number of runs
  int num_runs = 51;
    //dimension size. please select from 10, 30, 50, 100
  g_problem_size = 10;
  //available number of fitness evaluations
  g_max_num_evaluations = g_problem_size * 10000;

  //random seed is based on time according to competition rules
  srand((unsigned)time(NULL));

  //jDE and dynNP-jDE parameters
  //--------------------- Note ---------------------
  // If you set variable "g_num_reduction" which detetermines the number of reductions to "0",
  // the population reduction is not ocurr and this algorithm become "jDE".
  // So, if you'd like to run jDE program, please set "g_num_reduction = 0".
  //--------------------- Note ---------------------
  g_init_pop_size = 200;
  g_num_reduction = 0;
  g_tau_sf = 0.1;
  g_tau_cr = 0.1;

  g_pop_size = g_init_pop_size;

 for (int i = 0; i < 28; i++) {
    g_function_number = i + 1;
    cout << "\n-------------------------------------------------------" << endl;
    cout << "Function = " << g_function_number << ", Dimension size = " << g_problem_size << "\n" << endl;

    Fitness *bsf_fitness_array = (Fitness*)malloc(sizeof(Fitness) * num_runs);
    Fitness mean_bsf_fitness = 0;
    Fitness std_bsf_fitness = 0;

    for (int j = 0; j < num_runs; j++) {
      searchAlgorithm *alg = new jDE();
      bsf_fitness_array[j] = alg->run();

      cout << j + 1 << "th run, " << "best fitness = " << bsf_fitness_array[j] << endl;
    }

    for (int j = 0; j < num_runs; j++) {
      mean_bsf_fitness += bsf_fitness_array[j];
    }

    mean_bsf_fitness /= num_runs;

    for (int j = 0; j < num_runs; j++) {
      std_bsf_fitness += pow((mean_bsf_fitness - bsf_fitness_array[j]), 2.0);
    }

    std_bsf_fitness /= num_runs;
    std_bsf_fitness = sqrt(std_bsf_fitness);

    cout  << "\nmean = " << mean_bsf_fitness << ", std = " << std_bsf_fitness << endl;
    free(bsf_fitness_array);
  }

  return 0;
}
