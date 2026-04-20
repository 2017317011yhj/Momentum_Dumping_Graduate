/* Simscape target specific file.
 * This file is generated for the Simscape network associated with the solver block 'main/Solver Configuration'.
 */

#ifdef MATLAB_MEX_FILE
#include "tmwtypes.h"
#else
#include "rtwtypes.h"
#endif

#include "nesl_rtw.h"
#include "main_836bb176_1.h"
#include "main_836bb176_1_gateway.h"

void main_836bb176_1_gateway(void)
{
  NeModelParameters modelparams = { (NeSolverType) 1, 0.001, 0.001, 0.001, 0, 0,
    (NeModifyAbsTol) 0, 0.01, 0, 0, 0, 0, (SscLoggingSetting) 0, 618333489, 1, };

  NeSolverParameters solverparams = { 0, 0, 1, 0, 0, 0.001, 0.001, 1e-09, 0, 0,
    100, 0, 1, (NeIndexReductionMethod) 1, 0, 1e-09, 0, (NeLocalSolverChoice) 0,
    0.001, 0, 3, 2, 0, 2, (NeLinearAlgebraChoice) 0, 0,
    (NeEquationFormulationChoice) 0, 1024, 1, 0.001, (NePartitionStorageMethod)
    0, 1024, (NePartitionMethod) 0, };

  const NeOutputParameters* outputparameters = NULL;
  NeDae* dae;
  size_t numOutputs = 0;
  int* rtpDaes = NULL;
  int rtwLogDaes[1] = { 0 };

  {
    static const NeOutputParameters outputparameters_init[] = { { 0, 0, }, { 0,
        1, }, };

    outputparameters = outputparameters_init;
    numOutputs = sizeof(outputparameters_init)/sizeof(outputparameters_init[0]);
  }

  main_836bb176_1_dae(&dae,
                      &modelparams,
                      &solverparams);
  nesl_register_simulator_group("main/Solver Configuration_1",
    1,
    &dae,
    &solverparams,
    &modelparams,
    numOutputs,
    outputparameters,
    0,
    rtpDaes,
    1,
    rtwLogDaes);
}
