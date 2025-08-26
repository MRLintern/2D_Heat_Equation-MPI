# 2D_Heat_Equation-MPI
---

## Requirements
---
* __Compiler__: `g++ 13.1.0`.
* __OS__: developed and tested on `Linux Ubuntu 20.04`.
* `MPI`. This can be downloaded [here](https://www.mpich.org/) or at the command line (see below).
* `$ sudo apt-get install mpich`
* __Text editor__ of your choosing.

## Introduction
---

* We model the __2D Heat Equation__ for a bottle.
* The Solution is found by __parallelising__ the __linear system__ of __algebraic equations__ with __MPI__.
* The bottle has an __intial temperature__ distrubution: data for this can be found in `bottle.dat`. 
* The end result after running the application will give the temperature at a certain point in the distribution.

## Scenario
---

* The diagram below shows the general form taken by a 2D heat distribution:

                            I = 0
                            
               [0][0]------------------[0][N-1]
                    |                  |
             J = 0  |                  |  J = N-1
                    |                  |
             [M-1][0]------------------[M-1][N-1]
              
                            I = M-1
                            
* This diagram will prove very useful so refer to it.
* Solution to the heat-equation:

      `u(Central) = (1/4)*([u(North] + u[South] + u[East] + u[West])`

## Background: Parallel Programming
---

* The __parallel strategy__ used is __Domain Decomposition__.
* The problem (__global domain__) is decomposed into __smaller domains__ (__processes__). __"Workers"__ in the __subdomains__ perform the calculations and then __communicate__ the results with the __master__ (__global domain__). This [link](https://www.mcs.anl.gov/research/projects/mpi/tutorial/mpiexmpl/src2/io/C/main.html) provides a basic example behind the Master/Slave concept.

## Running the Application
---

Once the application has been compiled, use the MPI script, `mpirun` script along the the number of processors you wish to use at the command line.
Note: there are a few options. That is, the initial temperature distribution can be added, spacial dimementions of the temperature distribution and the and the number of time steps. Below shows that 4 processors are used, the initial temperature data is being used along with a 800 x 800 grid with 1000 time steps.


  * `$ git clone http://github/MRLintern/2D_Heat_Equation-MPI.git`
  * `$ make`
  * `$ mpirun -np ./main_heat bottle.dat 800 800 1000`









  
  
  
  

