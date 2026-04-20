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

PmfMessageId main_836bb176_1_recordLog(const RuntimeDerivedValuesBundle *rtdv,
  const int *eqnEnableFlags, const double *state, const int *modeVector, const
  double *input, const double *inputDot, const double *inputDdot, double
  *logVector, double *errorResult, NeuDiagnosticManager *neDiagMgr)
{
  const double *rtdvd = rtdv->mDoubles.mValues;
  const int *rtdvi = rtdv->mInts.mValues;
  int ii[1];
  double xx[72];
  (void) rtdvd;
  (void) rtdvi;
  (void) eqnEnableFlags;
  (void) modeVector;
  (void) inputDot;
  (void) inputDdot;
  (void) neDiagMgr;
  xx[0] = 57.29577951308232;
  xx[1] = 1.0;
  xx[2] = state[5] * state[5];
  xx[3] = state[6] * state[6];
  xx[4] = 2.0;
  xx[5] = xx[1] - (xx[2] + xx[3]) * xx[4];
  xx[6] = state[4] * state[5];
  xx[7] = state[3] * state[6];
  xx[8] = xx[6] - xx[7];
  xx[9] = state[3] * state[5];
  xx[10] = state[4] * state[6];
  xx[11] = xx[9] + xx[10];
  xx[12] = xx[5];
  xx[13] = xx[4] * xx[8];
  xx[14] = xx[11] * xx[4];
  xx[15] = 10.0;
  xx[16] = 20.0;
  xx[17] = xx[15] * xx[5];
  xx[18] = xx[16] * xx[8];
  xx[19] = xx[11] * xx[16];
  xx[5] = (xx[7] + xx[6]) * xx[4];
  xx[6] = state[4] * state[4];
  xx[7] = xx[1] - (xx[3] + xx[6]) * xx[4];
  xx[3] = state[5] * state[6];
  xx[8] = state[3] * state[4];
  xx[11] = xx[4] * (xx[3] - xx[8]);
  xx[20] = xx[15] * xx[5];
  xx[21] = xx[15] * xx[7];
  xx[22] = xx[15] * xx[11];
  xx[16] = pm_math_Vector3_dot_ra(xx + 12, xx + 20);
  xx[23] = xx[4] * (xx[10] - xx[9]);
  xx[9] = (xx[8] + xx[3]) * xx[4];
  xx[3] = xx[1] - (xx[6] + xx[2]) * xx[4];
  xx[24] = xx[15] * xx[23];
  xx[25] = xx[15] * xx[9];
  xx[26] = xx[15] * xx[3];
  xx[1] = pm_math_Vector3_dot_ra(xx + 12, xx + 24);
  xx[2] = 0.0;
  xx[27] = xx[5];
  xx[28] = xx[7];
  xx[29] = xx[11];
  xx[4] = pm_math_Vector3_dot_ra(xx + 27, xx + 24);
  xx[5] = xx[23];
  xx[6] = xx[9];
  xx[7] = xx[3];
  xx[3] = 1.666666666666667;
  xx[30] = pm_math_Vector3_dot_ra(xx + 12, xx + 17);
  xx[31] = xx[16];
  xx[32] = xx[1];
  xx[33] = xx[2];
  xx[34] = xx[2];
  xx[35] = xx[2];
  xx[36] = xx[16];
  xx[37] = pm_math_Vector3_dot_ra(xx + 27, xx + 20);
  xx[38] = xx[4];
  xx[39] = xx[2];
  xx[40] = xx[2];
  xx[41] = xx[2];
  xx[42] = xx[1];
  xx[43] = xx[4];
  xx[44] = pm_math_Vector3_dot_ra(xx + 5, xx + 24);
  xx[45] = xx[2];
  xx[46] = xx[2];
  xx[47] = xx[2];
  xx[48] = xx[2];
  xx[49] = xx[2];
  xx[50] = xx[2];
  xx[51] = xx[3];
  xx[52] = xx[2];
  xx[53] = xx[2];
  xx[54] = xx[2];
  xx[55] = xx[2];
  xx[56] = xx[2];
  xx[57] = xx[2];
  xx[58] = xx[3];
  xx[59] = xx[2];
  xx[60] = xx[2];
  xx[61] = xx[2];
  xx[62] = xx[2];
  xx[63] = xx[2];
  xx[64] = xx[2];
  xx[65] = xx[3];
  ii[0] = factorSymmetricPosDef(xx + 30, 6, xx + 16);
  if (ii[0] != 0) {
    return sm_ssci_recordRunTimeError(
      "sm:compiler:messages:simulationErrors:DegenerateMass",
      "'main/6-DOF Joint' has a degenerate mass distribution on its follower side.",
      neDiagMgr);
  }

  xx[8] = state[10];
  xx[9] = state[11];
  xx[10] = state[12];
  xx[16] = - state[3];
  xx[17] = - state[4];
  xx[18] = - state[5];
  xx[19] = - state[6];
  xx[20] = state[7];
  xx[21] = state[8];
  xx[22] = state[9];
  pm_math_Quaternion_inverseXform_ra(xx + 16, xx + 20, xx + 23);
  pm_math_Vector3_cross_ra(xx + 8, xx + 23, xx + 16);
  xx[19] = - xx[23];
  xx[20] = - xx[24];
  xx[21] = - xx[25];
  pm_math_Vector3_cross_ra(xx + 8, xx + 19, xx + 22);
  xx[19] = (xx[16] + xx[22]) * xx[15] - input[0];
  xx[20] = (xx[17] + xx[23]) * xx[15] - input[1];
  xx[21] = (xx[18] + xx[24]) * xx[15] - input[2];
  xx[15] = xx[3] * state[10];
  xx[16] = xx[3] * state[11];
  xx[17] = xx[3] * state[12];
  pm_math_Vector3_cross_ra(xx + 8, xx + 15, xx + 22);
  xx[66] = - pm_math_Vector3_dot_ra(xx + 12, xx + 19);
  xx[67] = - pm_math_Vector3_dot_ra(xx + 27, xx + 19);
  xx[68] = - pm_math_Vector3_dot_ra(xx + 5, xx + 19);
  xx[69] = input[3] - xx[22];
  xx[70] = input[4] - xx[23];
  xx[71] = input[5] - xx[24];
  solveSymmetricPosDef(xx + 30, xx + 66, 6, 1, xx + 3, xx + 9);
  logVector[0] = state[0];
  logVector[1] = state[1];
  logVector[2] = state[2];
  logVector[3] = state[3];
  logVector[4] = state[4];
  logVector[5] = state[5];
  logVector[6] = state[6];
  logVector[7] = state[7];
  logVector[8] = state[8];
  logVector[9] = state[9];
  logVector[10] = xx[0] * state[10];
  logVector[11] = xx[0] * state[11];
  logVector[12] = xx[0] * state[12];
  logVector[13] = xx[3];
  logVector[14] = xx[4];
  logVector[15] = xx[5];
  logVector[16] = xx[0] * xx[6];
  logVector[17] = xx[0] * xx[7];
  logVector[18] = xx[0] * xx[8];
  errorResult[0] = xx[2];
  return NULL;
}
