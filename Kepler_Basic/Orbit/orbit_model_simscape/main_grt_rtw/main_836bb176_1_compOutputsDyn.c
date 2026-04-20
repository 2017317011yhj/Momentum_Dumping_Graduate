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

PmfMessageId main_836bb176_1_compOutputsDyn(const RuntimeDerivedValuesBundle
  *rtdv, const int *eqnEnableFlags, const double *state, const int *modeVector,
  const double *input, const double *inputDot, const double *inputDdot, const
  double *discreteState, double *deriv, double *output, int *derivErr, double
  *errorResult, NeuDiagnosticManager *neDiagMgr)
{
  const double *rtdvd = rtdv->mDoubles.mValues;
  const int *rtdvi = rtdv->mInts.mValues;
  int ii[1];
  double xx[87];
  (void) rtdvd;
  (void) rtdvi;
  (void) eqnEnableFlags;
  (void) modeVector;
  (void) inputDot;
  (void) inputDdot;
  (void) discreteState;
  (void) neDiagMgr;
  (void) derivErr;
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
  xx[14] = xx[3] * (xx[12] - xx[13]);
  xx[15] = state[3] * state[5];
  xx[16] = state[4] * state[6];
  xx[17] = (xx[15] + xx[16]) * xx[3];
  xx[18] = xx[11];
  xx[19] = xx[14];
  xx[20] = xx[17];
  xx[21] = 10.0;
  xx[22] = xx[21] * xx[11];
  xx[23] = xx[21] * xx[14];
  xx[24] = xx[21] * xx[17];
  xx[25] = (xx[13] + xx[12]) * xx[3];
  xx[12] = state[4] * state[4];
  xx[13] = xx[0] - (xx[2] + xx[12]) * xx[3];
  xx[2] = state[5] * state[6];
  xx[26] = state[3] * state[4];
  xx[27] = xx[3] * (xx[2] - xx[26]);
  xx[28] = xx[21] * xx[25];
  xx[29] = xx[21] * xx[13];
  xx[30] = xx[21] * xx[27];
  xx[31] = pm_math_Vector3_dot_ra(xx + 18, xx + 28);
  xx[32] = xx[3] * (xx[16] - xx[15]);
  xx[15] = (xx[26] + xx[2]) * xx[3];
  xx[2] = xx[0] - (xx[12] + xx[1]) * xx[3];
  xx[33] = xx[21] * xx[32];
  xx[34] = xx[21] * xx[15];
  xx[35] = xx[21] * xx[2];
  xx[0] = pm_math_Vector3_dot_ra(xx + 18, xx + 33);
  xx[1] = 0.0;
  xx[36] = xx[25];
  xx[37] = xx[13];
  xx[38] = xx[27];
  xx[3] = pm_math_Vector3_dot_ra(xx + 36, xx + 33);
  xx[39] = xx[32];
  xx[40] = xx[15];
  xx[41] = xx[2];
  xx[12] = 1.666666666666667;
  xx[42] = pm_math_Vector3_dot_ra(xx + 18, xx + 22);
  xx[43] = xx[31];
  xx[44] = xx[0];
  xx[45] = xx[1];
  xx[46] = xx[1];
  xx[47] = xx[1];
  xx[48] = xx[31];
  xx[49] = pm_math_Vector3_dot_ra(xx + 36, xx + 28);
  xx[50] = xx[3];
  xx[51] = xx[1];
  xx[52] = xx[1];
  xx[53] = xx[1];
  xx[54] = xx[0];
  xx[55] = xx[3];
  xx[56] = pm_math_Vector3_dot_ra(xx + 39, xx + 33);
  xx[57] = xx[1];
  xx[58] = xx[1];
  xx[59] = xx[1];
  xx[60] = xx[1];
  xx[61] = xx[1];
  xx[62] = xx[1];
  xx[63] = xx[12];
  xx[64] = xx[1];
  xx[65] = xx[1];
  xx[66] = xx[1];
  xx[67] = xx[1];
  xx[68] = xx[1];
  xx[69] = xx[1];
  xx[70] = xx[12];
  xx[71] = xx[1];
  xx[72] = xx[1];
  xx[73] = xx[1];
  xx[74] = xx[1];
  xx[75] = xx[1];
  xx[76] = xx[1];
  xx[77] = xx[12];
  ii[0] = factorSymmetricPosDef(xx + 42, 6, xx + 78);
  if (ii[0] != 0)
    *derivErr = 1;
  xx[28] = - state[3];
  xx[29] = - state[4];
  xx[30] = - state[5];
  xx[31] = - state[6];
  xx[22] = state[7];
  xx[23] = state[8];
  xx[24] = state[9];
  pm_math_Quaternion_inverseXform_ra(xx + 28, xx + 22, xx + 33);
  pm_math_Vector3_cross_ra(xx + 4, xx + 33, xx + 22);
  xx[78] = - xx[33];
  xx[79] = - xx[34];
  xx[80] = - xx[35];
  pm_math_Vector3_cross_ra(xx + 4, xx + 78, xx + 33);
  xx[0] = xx[22] + xx[33];
  xx[3] = xx[23] + xx[34];
  xx[16] = xx[24] + xx[35];
  xx[22] = xx[0] * xx[21] - input[0];
  xx[23] = xx[3] * xx[21] - input[1];
  xx[24] = xx[16] * xx[21] - input[2];
  xx[33] = xx[12] * state[10];
  xx[34] = xx[12] * state[11];
  xx[35] = xx[12] * state[12];
  pm_math_Vector3_cross_ra(xx + 4, xx + 33, xx + 78);
  xx[81] = - pm_math_Vector3_dot_ra(xx + 18, xx + 22);
  xx[82] = - pm_math_Vector3_dot_ra(xx + 36, xx + 22);
  xx[83] = - pm_math_Vector3_dot_ra(xx + 39, xx + 22);
  xx[84] = input[3] - xx[78];
  xx[85] = input[4] - xx[79];
  xx[86] = input[5] - xx[80];
  solveSymmetricPosDef(xx + 42, xx + 81, 6, 1, xx + 18, xx + 33);
  deriv[0] = state[7];
  deriv[1] = state[8];
  deriv[2] = state[9];
  deriv[3] = xx[7];
  deriv[4] = xx[8];
  deriv[5] = xx[9];
  deriv[6] = xx[10];
  deriv[7] = xx[18];
  deriv[8] = xx[19];
  deriv[9] = xx[20];
  deriv[10] = xx[21];
  deriv[11] = xx[22];
  deriv[12] = xx[23];
  errorResult[0] = xx[1];
  xx[1] = 9.87654321;
  pm_math_Quaternion_xform_ra(xx + 28, xx + 21, xx + 4);
  xx[7] = xx[18] * xx[11] + xx[19] * xx[25] + xx[20] * xx[32] + xx[0];
  xx[8] = xx[18] * xx[14] + xx[19] * xx[13] + xx[20] * xx[15] + xx[3];
  xx[9] = xx[18] * xx[17] + xx[19] * xx[27] + xx[20] * xx[2] + xx[16];
  pm_math_Quaternion_xform_ra(xx + 28, xx + 7, xx + 10);
  output[7] = xx[4];
  output[8] = xx[5];
  output[9] = xx[6];
  output[16] = xx[10];
  output[17] = xx[11];
  output[18] = xx[12];
  return NULL;
}
