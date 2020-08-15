
#ifndef DE_H_INCLUDED
#define DE_H_INCLUDED

#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <string.h>
#include <vector>
#include <cmath>
#define _USE_MATH_DEFINES

using namespace std;

typedef  double variable;
typedef variable *Individual;
typedef  double Fitness;

extern int g_function_number;
extern int g_problem_size;
extern unsigned int g_max_num_evaluations;
extern int function_name;

extern int g_pop_size;
extern int g_init_pop_size;
extern int g_num_reduction;
extern double g_tau_sf;
extern double g_tau_cr;

void test_func(double *, double *,int,int,int);

class searchAlgorithm {
public:
  virtual Fitness run() = 0;
protected:
  void evaluatePopulation(const vector<Individual> &pop, vector<Fitness> &fitness);
  void initializeFitnessFunctionParameters();

  void initializeParameters();
  Individual makeNewIndividual();
  void modifySolutionWithParentMedium(Individual child, Individual parent);
  void setBestSolution(const vector<Individual> &pop, const vector<Fitness> &fitness, Individual &bsf_solution, Fitness &bsf_fitness);

  //Return random value with uniform distribution [0, 1)
  inline double randDouble() {
    return (double)rand() / (double) RAND_MAX;
  }

  /*
    Return random value from Cauchy distribution with mean "mu" and variance "gamma"
    http://www.sat.t.u-tokyo.ac.jp/~omi/random_variables_generation.html#Cauchy
  */
  inline double cauchy_g(double mu, double gamma) {
    return mu + gamma * tan(3.1415926535897932384626433832795029 *(randDouble() - 0.5));
  }

  /*
    Return random value from normal distribution with mean "mu" and variance "gamma"
    http://www.sat.t.u-tokyo.ac.jp/~omi/random_variables_generation.html#Gauss
  */
  inline double gauss(double mu, double sigma){
    return mu + sigma * sqrt(-2.0 * log(randDouble())) * sin(2.0 * 3.1415926535897932384626433832795029 * randDouble());
  }

  //Recursive quick sort with index array
  template<class VarType>
    void sortIndexWithQuickSort(VarType array[], int first, int last, int index[]) {
    VarType x = array[(first + last) / 2];
    int i = first;
    int j = last;
    VarType temporaryValue = 0;
    int temporaryNumber = 0;

    while (true) {
      while (array[i] < x) {
	i++;
      }
      while (x < array[j]) {
	j--;
      }
      if (i >= j) {
	break;
      }

      temporaryValue = array[i];
      array[i] = array[j];
      array[j] = temporaryValue;

      temporaryNumber = index[i];
      index[i] = index[j];
      index[j] = temporaryNumber;

      i++;
      j--;
    }

    if (first < (i -1)) {
      sortIndexWithQuickSort(array, first, i - 1, index);
    }
    if ((j + 1) < last) {
      sortIndexWithQuickSort(array, j + 1, last, index);
    }
  }

  int function_number;
  int problem_size;
  variable max_region;
  variable min_region;
  Fitness optimum;
  // acceptable error value
  Fitness epsilon;
  unsigned int max_num_evaluations;
  int pop_size;
};

class jDE: public searchAlgorithm {
public:
  virtual Fitness run();
  void setjDEParameters();
  void operateRand1Bin(const vector<Individual> &pop, Individual child, int &target, variable &scaling_factor, variable &cross_rate);
  void reducePopulation(vector<Individual> &pop, vector<Fitness> &fitness,  variable *pop_sf,  variable *pop_cr);

  int init_pop_size;
  int num_reduction;
  double tau_sf;
  double tau_cr;
};


#endif // DE_H_INCLUDED
