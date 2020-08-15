

#include "de.h"

Fitness jDE::run() {
 cout << setprecision(16);
 initializeParameters();
 setjDEParameters();

 //population
  vector <Individual> pop;
  //fitness value of the population
  vector <Fitness> fitness(pop_size, 0);

  vector <Individual> children;
  vector <Fitness> children_fitness(pop_size, 0);

  //initialize population
  for (int i = 0; i < pop_size; i++) {
    pop.push_back(makeNewIndividual());
    children.push_back((variable*)malloc(sizeof(variable) * problem_size));
  }

  // evaluate the initial population's fitness values
  evaluatePopulation(pop, fitness);
  //number of fitness evaluations is initialized
  int nfes = pop_size;

  //best-so-far solution
  Individual bsf_solution = (variable*)malloc(sizeof(variable) * problem_size);
  //fitness value of the best-so-far solution
  Fitness bsf_fitness;
  //initialize the best-so-far solution and its fitness value
  setBestSolution(pop, fitness, bsf_solution, bsf_fitness);

  //jDE and dynNP-jDE parameters
  variable sf_upper = 0.9;
  variable sf_lower = 0.1;
  variable *pop_sf = (variable*)malloc(sizeof(variable) * pop_size);
  variable *pop_cr = (variable*)malloc(sizeof(variable) * pop_size);
  variable *child_sf = (variable*)malloc(sizeof(variable) * pop_size);
  variable *child_cr = (variable*)malloc(sizeof(variable) * pop_size);

  //initialize F_i and CR_i (i = 1, ..., population size)
  for (int i = 0; i < pop_size; i++) {
    pop_sf[i] = 0.5;
    pop_cr[i] = 0.9;
  }

  //dynNP-jDE parameters
  int p_count = 1;
  int gen = 1;

  int gen_p;
  if (num_reduction == 0) gen_p = 0;
  else gen_p = (int)(max_num_evaluations / (num_reduction * pop_size));

  //main loop
  while (nfes < max_num_evaluations) {

    for (int target = 0; target < pop_size; target++) {
      //child's scaling factor
      if (randDouble() < tau_sf) child_sf[target] = (randDouble() * sf_upper) + sf_lower;
      else child_sf[target] = pop_sf[target];

      //child's crossover rate
      if (randDouble() < tau_cr) child_cr[target] = randDouble();
      else child_cr[target] = pop_cr[target];

      // generate trial vecotrs by using rand/1/bin
      operateRand1Bin(pop, &children[target][0], target, child_sf[target], child_cr[target]);
    }

    evaluatePopulation(children, children_fitness);

    /////////////////////////////////////////////////////////////////////////
    //update the bsf-solution and check the current number of fitness evaluations
    // if the current number of fitness evaluations over the max number of fitness evaluations, the search is terminated
    // So, this program is unconcerned about SHADE algorithm directly
    for (int i = 0; i < pop_size; i++) {
      nfes++;

      //following the rules of CEC 2013 real parameter competition,
      //if the gap between the error values of the best solution found and the optimal solution was 10^{−8} or smaller,
      //the error was treated as 0
      if ((children_fitness[i] - optimum) < epsilon) {
	children_fitness[i] = optimum;
      }

      if (children_fitness[i] < bsf_fitness) {
  	bsf_fitness = children_fitness[i];
  	for (int j = 0; j < problem_size; j ++) {
  	  bsf_solution[j] = children[i][j];
  	}
      }

      // if (nfes % 1000 == 0) {
      // 	//output the error value
      // 	cout << nfes << " " << bsf_fitness - optimum << endl;
      // }

      if (nfes >= max_num_evaluations) {
  	break;
      }
    }
    ////////////////////////////////////////////////////////////////////////////


    //generation alternation
    for (int i = 0; i < pop_size; i++) {
      if (children_fitness[i] <= fitness[i]) {
	fitness[i] = children_fitness[i];
	for (int j = 0; j < problem_size; j ++) {
	  pop[i][j] = children[i][j];
	}
	pop_sf[i] = child_sf[i];
	pop_cr[i] = child_cr[i];
      }
    }

    gen++;
    //    cout << gen << "  " << pop_size << endl;
    if ((gen == gen_p) && (p_count < num_reduction)) {
      reducePopulation(pop, fitness, pop_sf, pop_cr);
      gen_p *=2;
      gen = 0;
      p_count++;
    }
  }

  return bsf_fitness - optimum;
}

/*
   Reduce the population by half
   e.g, if current population size is 50, it becomes 25 after reduction.
   if population size is indivisible as 25, the population size after reduction is ceiling value as 13.
 */
void jDE::reducePopulation(vector<Individual> &pop, vector<Fitness> &fitness,  variable *pop_sf,  variable *pop_cr) {
  int before_pop_size = pop_size;
  int compared_pop_size;

  pop_size = (int)round(pop_size / 2.0);

  if (before_pop_size % 2 == 0) compared_pop_size = pop_size;
  else compared_pop_size = pop_size - 1;

  for (int i = 0; i < compared_pop_size; i++) {
    //cout << i << " " << i + pop_size <<endl;
    if (fitness[i + pop_size] < fitness[i]) {
      fitness[i] = fitness[i + pop_size];
      pop_sf[i] = pop_sf[i + pop_size];
      pop_cr[i] = pop_cr[i + pop_size];
      for (int j = 0; j < problem_size; j++) pop[i][j] = pop[i + pop_size][j];
    }
  }

  pop.resize(pop_size);
}

void jDE::operateRand1Bin(const vector<Individual> &pop, Individual child, int &target, variable &scaling_factor, variable &cross_rate) {
  int r1, r2, r3;
  int random_variable = rand() % problem_size;

  //select r1, r2 and  r3 from [1, population size] to be target != r1 != r2 != r3
  do {
    r1 = rand() % pop_size;
  } while (r1 == target);
  do {
    r2 = rand() % pop_size;
  } while ((r2 == target) || (r2 == r1));
  do {
    r3 = rand() % pop_size;
  } while ((r3 == target) || (r3 == r2) || (r3 == r1));

  for (int i = 0; i < problem_size; i++) {
    if ((randDouble() < cross_rate) || (i == random_variable)) {
      child[i] = pop[r1][i] + scaling_factor * (pop[r2][i] - pop[r3][i]);
    }
    else {
      child[i] = pop[target][i];
    }
  }

  //If the mutant vector violates bounds, the bound handling method is applied
  modifySolutionWithParentMedium(child,  pop[target]);
}

void jDE::setjDEParameters() {
  init_pop_size = g_init_pop_size;
  num_reduction = g_num_reduction;
  tau_sf = g_tau_sf;
  tau_cr = g_tau_cr;
}

