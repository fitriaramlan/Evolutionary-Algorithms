/*
  Generational functions for DE algortihms

  Version: 1.0   Date: 11/Oct/2013
  Written by Ryoji Tanabe (rt.ryoji.tanabe@gmail.com)
*/

#include "de.h"

void searchAlgorithm::initializeParameters() {
  function_number = g_function_number;
  problem_size = g_problem_size;
  max_num_evaluations = g_max_num_evaluations;
  pop_size = g_pop_size;
  initializeFitnessFunctionParameters();
}


void searchAlgorithm::evaluatePopulation(const vector<Individual> &pop, vector<Fitness> &fitness) {
  for (int i = 0; i < pop_size; i++) {
    test_func(pop[i],  &fitness[i], problem_size, 1, function_number);
  }
}

void searchAlgorithm::initializeFitnessFunctionParameters() {
  //epsilon is acceptable error value
  epsilon = pow(10.0, -8);
  max_region = 100.0;
  min_region = -100.0;

  //set optimal value
  switch(function_number) {
  case 1 :
    optimum = -1400;
    break;
  case 2 :
    optimum = -1300;
    break;
  case 3 :
    optimum = -1200;
    break;
  case 4 :
    optimum = -1100;
    break;
  case 5 :
    optimum = -1000;
    break;
  case 6 :
    optimum = -900;
    break;
  case 7 :
    optimum = -800;
    break;
  case 8 :
    optimum = -700;
    break;
  case 9 :
    optimum = -600;
    break;
  case 10 :
    optimum = -500;
    break;
  case 11 :
    optimum = -400;
    break;
  case 12 :
    optimum = -300;
    break;
  case 13 :
    optimum = -200;
    break;
  case 14 :
    optimum = -100;
    break;
  case 15 :
    optimum = 100;
    break;
  case 16 :
    optimum = 200;
    break;
  case 17 :
    optimum = 300;
    break;
  case 18 :
    optimum = 400;
    break;
  case 19 :
    optimum = 500;
    break;
  case 20 :
    optimum = 600;
    break;
  case 21 :
    optimum = 700;
    break;
  case 22 :
    optimum = 800;
    break;
  case 23 :
    optimum = 900;
    break;
  case 24 :
    optimum = 1000;
    break;
  case 25 :
    optimum = 1100;
    break;
  case 26 :
    optimum = 1200;
    break;
  case 27 :
    optimum = 1300;
    break;
  case 28 :
    optimum = 1400;
    break;
  }
}

//set best solution (bsf_solution) and its fitness value (bsf_fitness) in the initial population
void searchAlgorithm::setBestSolution(const vector<Individual> &pop, const vector<Fitness> &fitness, Individual &bsf_solution, Fitness &bsf_fitness) {
  int current_best_individual = 0;

  for (int i = 1; i < pop_size; i++) {
    if (fitness[current_best_individual] > fitness[i]) {
      current_best_individual = i;
    }
  }

  bsf_fitness = fitness[current_best_individual];
  for (int i = 0; i < problem_size; i++) {
    bsf_solution[i] = pop[current_best_individual][i];
  }
}

// make new individual randomly
Individual searchAlgorithm::makeNewIndividual() {
  Individual individual = (variable*)malloc(sizeof(variable) * problem_size);

  for (int i = 0; i < problem_size; i++) {
    individual[i] = ((max_region - min_region) * randDouble()) + min_region;
  }

  return individual;
}

/*
  For each dimension j, if the mutant vector element v_j is outside the boundaries [x_min , x_max], we applied this bound handling method
  If you'd like to know that precisely, please read:
  J. Zhang and A. C. Sanderson, "JADE: Adaptive differential evolution with optional external archive,"
  IEEE Tran. Evol. Comput., vol. 13, no. 5, pp. 945–958, 2009.
 */
void searchAlgorithm::modifySolutionWithParentMedium(Individual child, Individual parent) {
  int l_problem_size = problem_size;
  variable l_min_region = min_region;
  variable l_max_region = max_region;

  for (int j = 0; j < l_problem_size; j++) {
    if (child[j] < l_min_region) {
      child[j]= (l_min_region + parent[j]) / 2.0;
    }
    else if (child[j] > l_max_region) {
      child[j]= (l_max_region + parent[j]) / 2.0;
    }
  }
}

