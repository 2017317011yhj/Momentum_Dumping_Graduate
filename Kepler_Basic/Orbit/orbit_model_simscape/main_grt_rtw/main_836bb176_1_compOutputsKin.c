/* Simscape target specific file.
 * This file is generated for the Simscape network associated with the solver block 'main/Solver Configuration'.
 */

#include <math.h>
#include <string.h>
#include "pm_std.h"
#include "sm_std.h"
#include "ne_std.h"
#include "ne_dae.h"
#include "sm_ssci_run_time_errors.h"
#include "sm_RuntimeDerivedValuesBundle.h"
#include "main_836bb176_1_geometries.h"

PmfMessageId main_836bb176_1_compOutputsKin(const RuntimeDerivedValuesBundle
  *rtdv, const double *state, const int *modeVector, const double *input, const
  double *inputDot, const double *inputDdot, const double *discreteState, double
  *output, NeuDiagnosticManager *neDiagMgr)
{
  const double *rtdvd = rtdv->mDoubles.mValues;
  const int *rtdvi = rtdv->mInts.mValues;
  double xx[16];
  (void) rtdvd;
  (void) rtdvi;
  (void) modeVector;
  (void) input;
  (void) inputDot;
  (void) inputDdot;
  (void) discreteState;
  (void) neDiagMgr;
  xx[0] = - state[3];
  xx[1] = - state[4];
  xx[2] = - state[5];
  xx[3] = - state[6];
  xx[4] = state[10];
  xx[5] = state[11];
  xx[6] = state[12];
  pm_math_Quaternion_xform_ra(xx + 0, xx + 4, xx + 7);
  xx[4] = 9.87654321;
  xx[10] = state[7];
  xx[11] = state[8];
  xx[12] = state[9];
  pm_math_Quaternion_inverseXform_ra(xx + 0, xx + 10, xx + 13);
  pm_math_Quaternion_xform_ra(xx + 0, xx + 13, xx + 10);
  output[0] = state[3];
  output[1] = state[4];
  output[2] = state[5];
  output[3] = state[6];
  output[4] = xx[7];
  output[5] = xx[8];
  output[6] = xx[9];
  output[10] = state[0];
  output[11] = state[1];
  output[12] = state[2];
  output[13] = xx[10];
  output[14] = xx[11];
  output[15] = xx[12];
  return NULL;
}
