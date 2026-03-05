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

PmfMessageId main_836bb176_1_compDerivs(const RuntimeDerivedValuesBundle *rtdv,
  const int *eqnEnableFlags, const double *state, const int *modeVector, const
  double *input, const double *inputDot, const double *inputDdot, const double
  *discreteState, double *deriv, double *errorResult, NeuDiagnosticManager
  *neDiagMgr)
{
  const double *rtdvd = rtdv->mDoubles.mValues;
  const int *rtdvi = rtdv->mInts.mValues;
  int ii[1];
  double xx[78];
  (void) rtdvd;
  (void) rtdvi;
  (void) eqnEnableFlags;
  (void) modeVector;
  (void) inputDot;
  (void) inputDdot;
  (void) discreteState;
  (void) neDiagMgr;
  xx[0] = state[3];
  xx[1] = state[4];
  xx[2] = state[5];
  xx[3] = state[6];
  xx[4] = state[10];
  xx[5] = state[11];
  xx[6] = state[12];
  pm_math_Quaternion_compDeriv_ra(xx + 0, xx + 4, xx + 7);
  xx[0] = 1.0;
  xx[1] = state[5] * state[5];
  xx[2] = state[6] * state[6];
  xx[3] = 2.0;
  xx[11] = xx[0] - (xx[1] + xx[2]) * xx[3];
  xx[12] = state[4] * state[5];
  xx[13] = state[3] * state[6];
  xx[14] = xx[12] - xx[13];
  xx[15] = state[3] * state[5];
  xx[16] = state[4] * state[6];
  xx[17] = xx[15] + xx[16];
  xx[18] = xx[11];
  xx[19] = xx[3] * xx[14];
  xx[20] = xx[17] * xx[3];
  xx[21] = 10.0;
  xx[22] = 20.0;
  xx[23] = xx[21] * xx[11];
  xx[24] = xx[22] * xx[14];
  xx[25] = xx[17] * xx[22];
  xx[11] = (xx[13] + xx[12]) * xx[3];
  xx[12] = state[4] * state[4];
  xx[13] = xx[0] - (xx[2] + xx[12]) * xx[3];
  xx[2] = state[5] * state[6];
  xx[14] = state[3] * state[4];
  xx[17] = xx[3] * (xx[2] - xx[14]);
  xx[26] = xx[21] * xx[11];
  xx[27] = xx[21] * xx[13];
  xx[28] = xx[21] * xx[17];
  xx[22] = pm_math_Vector3_dot_ra(xx + 18, xx + 26);
  xx[29] = xx[3] * (xx[16] - xx[15]);
  xx[15] = (xx[14] + xx[2]) * xx[3];
  xx[2] = xx[0] - (xx[12] + xx[1]) * xx[3];
  xx[30] = xx[21] * xx[29];
  xx[31] = xx[21] * xx[15];
  xx[32] = xx[21] * xx[2];
  xx[0] = pm_math_Vector3_dot_ra(xx + 18, xx + 30);
  xx[1] = 0.0;
  xx[33] = xx[11];
  xx[34] = xx[13];
  xx[35] = xx[17];
  xx[3] = pm_math_Vector3_dot_ra(xx + 33, xx + 30);
  xx[11] = xx[29];
  xx[12] = xx[15];
  xx[13] = xx[2];
  xx[2] = 1.666666666666667;
  xx[36] = pm_math_Vector3_dot_ra(xx + 18, xx + 23);
  xx[37] = xx[22];
  xx[38] = xx[0];
  xx[39] = xx[1];
  xx[40] = xx[1];
  xx[41] = xx[1];
  xx[42] = xx[22];
  xx[43] = pm_math_Vector3_dot_ra(xx + 33, xx + 26);
  xx[44] = xx[3];
  xx[45] = xx[1];
  xx[46] = xx[1];
  xx[47] = xx[1];
  xx[48] = xx[0];
  xx[49] = xx[3];
  xx[50] = pm_math_Vector3_dot_ra(xx + 11, xx + 30);
  xx[51] = xx[1];
  xx[52] = xx[1];
  xx[53] = xx[1];
  xx[54] = xx[1];
  xx[55] = xx[1];
  xx[56] = xx[1];
  xx[57] = xx[2];
  xx[58] = xx[1];
  xx[59] = xx[1];
  xx[60] = xx[1];
  xx[61] = xx[1];
  xx[62] = xx[1];
  xx[63] = xx[1];
  xx[64] = xx[2];
  xx[65] = xx[1];
  xx[66] = xx[1];
  xx[67] = xx[1];
  xx[68] = xx[1];
  xx[69] = xx[1];
  xx[70] = xx[1];
  xx[71] = xx[2];
  ii[0] = factorSymmetricPosDef(xx + 36, 6, xx + 22);
  if (ii[0] != 0) {
    return sm_ssci_recordRunTimeError(
      "sm:compiler:messages:simulationErrors:DegenerateMass",
      "'main/6-DOF Joint' has a degenerate mass distribution on its follower side.",
      neDiagMgr);
  }

  xx[14] = - state[3];
  xx[15] = - state[4];
  xx[16] = - state[5];
  xx[17] = - state[6];
  xx[22] = state[7];
  xx[23] = state[8];
  xx[24] = state[9];
  pm_math_Quaternion_inverseXform_ra(xx + 14, xx + 22, xx + 25);
  pm_math_Vector3_cross_ra(xx + 4, xx + 25, xx + 14);
  xx[22] = - xx[25];
  xx[23] = - xx[26];
  xx[24] = - xx[27];
  pm_math_Vector3_cross_ra(xx + 4, xx + 22, xx + 25);
  xx[22] = (xx[14] + xx[25]) * xx[21] - input[0];
  xx[23] = (xx[15] + xx[26]) * xx[21] - input[1];
  xx[24] = (xx[16] + xx[27]) * xx[21] - input[2];
  xx[14] = xx[2] * state[10];
  xx[15] = xx[2] * state[11];
  xx[16] = xx[2] * state[12];
  pm_math_Vector3_cross_ra(xx + 4, xx + 14, xx + 25);
  xx[72] = - pm_math_Vector3_dot_ra(xx + 18, xx + 22);
  xx[73] = - pm_math_Vector3_dot_ra(xx + 33, xx + 22);
  xx[74] = - pm_math_Vector3_dot_ra(xx + 11, xx + 22);
  xx[75] = input[3] - xx[25];
  xx[76] = input[4] - xx[26];
  xx[77] = input[5] - xx[27];
  solveSymmetricPosDef(xx + 36, xx + 72, 6, 1, xx + 11, xx + 17);
  deriv[0] = state[7];
  deriv[1] = state[8];
  deriv[2] = state[9];
  deriv[3] = xx[7];
  deriv[4] = xx[8];
  deriv[5] = xx[9];
  deriv[6] = xx[10];
  deriv[7] = xx[11];
  deriv[8] = xx[12];
  deriv[9] = xx[13];
  deriv[10] = xx[14];
  deriv[11] = xx[15];
  deriv[12] = xx[16];
  errorResult[0] = xx[1];
  return NULL;
}

PmfMessageId main_836bb176_1_numJacPerturbLoBounds(const
  RuntimeDerivedValuesBundle *rtdv, const int *eqnEnableFlags, const double
  *state, const int *modeVector, const double *input, const double *inputDot,
  const double *inputDdot, const double *discreteState, double *bounds, double
  *errorResult, NeuDiagnosticManager *neDiagMgr)
{
  const double *rtdvd = rtdv->mDoubles.mValues;
  const int *rtdvi = rtdv->mInts.mValues;
  double xx[2];
  (void) rtdvd;
  (void) rtdvi;
  (void) eqnEnableFlags;
  (void) state;
  (void) modeVector;
  (void) input;
  (void) inputDot;
  (void) inputDdot;
  (void) discreteState;
  (void) neDiagMgr;
  xx[0] = 1.0e-9;
  xx[1] = 1.0e-8;
  bounds[0] = xx[0];
  bounds[1] = xx[0];
  bounds[2] = xx[0];
  bounds[3] = xx[1];
  bounds[4] = xx[1];
  bounds[5] = xx[1];
  bounds[6] = xx[1];
  bounds[7] = xx[0];
  bounds[8] = xx[0];
  bounds[9] = xx[0];
  bounds[10] = xx[1];
  bounds[11] = xx[1];
  bounds[12] = xx[1];
  errorResult[0] = 0.0;
  return NULL;
}

PmfMessageId main_836bb176_1_numJacPerturbHiBounds(const
  RuntimeDerivedValuesBundle *rtdv, const int *eqnEnableFlags, const double
  *state, const int *modeVector, const double *input, const double *inputDot,
  const double *inputDdot, const double *discreteState, double *bounds, double
  *errorResult, NeuDiagnosticManager *neDiagMgr)
{
  const double *rtdvd = rtdv->mDoubles.mValues;
  const int *rtdvi = rtdv->mInts.mValues;
  double xx[2];
  (void) rtdvd;
  (void) rtdvi;
  (void) eqnEnableFlags;
  (void) state;
  (void) modeVector;
  (void) input;
  (void) inputDot;
  (void) inputDdot;
  (void) discreteState;
  (void) neDiagMgr;
  xx[0] = +pmf_get_inf();
  xx[1] = 0.1;
  bounds[0] = xx[0];
  bounds[1] = xx[0];
  bounds[2] = xx[0];
  bounds[3] = xx[1];
  bounds[4] = xx[1];
  bounds[5] = xx[1];
  bounds[6] = xx[1];
  bounds[7] = xx[0];
  bounds[8] = xx[0];
  bounds[9] = xx[0];
  bounds[10] = xx[0];
  bounds[11] = xx[0];
  bounds[12] = xx[0];
  errorResult[0] = 0.0;
  return NULL;
}
