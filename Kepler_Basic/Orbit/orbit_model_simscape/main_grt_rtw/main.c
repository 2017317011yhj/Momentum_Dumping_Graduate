/*
 * main.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "main".
 *
 * Model version              : 1.4
 * Simulink Coder version : 9.7 (R2022a) 13-Nov-2021
 * C source code generated on : Wed Oct  4 15:18:20 2023
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "main.h"
#include "rtwtypes.h"
#include "main_private.h"
#include <string.h>
#include <math.h>
#include <stddef.h>
#include "rt_nonfinite.h"

/* Block signals (default storage) */
B_main_T main_B;

/* Continuous states */
X_main_T main_X;

/* Block states (default storage) */
DW_main_T main_DW;

/* Real-time model */
static RT_MODEL_main_T main_M_;
RT_MODEL_main_T *const main_M = &main_M_;

/* Forward declaration for local functions */
static real_T main_mod(real_T x);

/* Projection for root system: '<Root>' */
void main_projection(void)
{
  NeslSimulationData *simulationData;
  NeuDiagnosticManager *diagnosticManager;
  NeuDiagnosticTree *diagnosticTree;
  real_T tmp_0[24];
  real_T time;
  int32_T tmp_2;
  int_T tmp_1[7];
  boolean_T tmp;

  /* Projection for SimscapeExecutionBlock: '<S47>/STATE_1' */
  simulationData = (NeslSimulationData *)main_DW.STATE_1_SimData;
  time = main_M->Timing.t[0];
  simulationData->mData->mTime.mN = 1;
  simulationData->mData->mTime.mX = &time;
  simulationData->mData->mContStates.mN = 13;
  simulationData->mData->mContStates.mX = &main_X.mainx6_DOF_JointPxp[0];
  simulationData->mData->mDiscStates.mN = 0;
  simulationData->mData->mDiscStates.mX = &main_DW.STATE_1_Discrete;
  simulationData->mData->mModeVector.mN = 0;
  simulationData->mData->mModeVector.mX = &main_DW.STATE_1_Modes;
  tmp = false;
  simulationData->mData->mFoundZcEvents = tmp;
  simulationData->mData->mIsMajorTimeStep = rtmIsMajorTimeStep(main_M);
  tmp = false;
  simulationData->mData->mIsSolverAssertCheck = tmp;
  simulationData->mData->mIsSolverCheckingCIC = false;
  tmp = rtsiIsSolverComputingJacobian(&main_M->solverInfo);
  simulationData->mData->mIsComputingJacobian = tmp;
  simulationData->mData->mIsEvaluatingF0 = false;
  simulationData->mData->mIsSolverRequestingReset = false;
  simulationData->mData->mIsModeUpdateTimeStep = rtsiIsModeUpdateTimeStep
    (&main_M->solverInfo);
  tmp_1[0] = 0;
  tmp_0[0] = main_B.INPUT_1_1_1[0];
  tmp_0[1] = main_B.INPUT_1_1_1[1];
  tmp_0[2] = main_B.INPUT_1_1_1[2];
  tmp_0[3] = main_B.INPUT_1_1_1[3];
  tmp_1[1] = 4;
  tmp_0[4] = main_B.INPUT_1_1_2[0];
  tmp_0[5] = main_B.INPUT_1_1_2[1];
  tmp_0[6] = main_B.INPUT_1_1_2[2];
  tmp_0[7] = main_B.INPUT_1_1_2[3];
  tmp_1[2] = 8;
  tmp_0[8] = main_B.INPUT_1_1_3[0];
  tmp_0[9] = main_B.INPUT_1_1_3[1];
  tmp_0[10] = main_B.INPUT_1_1_3[2];
  tmp_0[11] = main_B.INPUT_1_1_3[3];
  tmp_1[3] = 12;
  tmp_0[12] = main_B.INPUT_2_1_1[0];
  tmp_0[13] = main_B.INPUT_2_1_1[1];
  tmp_0[14] = main_B.INPUT_2_1_1[2];
  tmp_0[15] = main_B.INPUT_2_1_1[3];
  tmp_1[4] = 16;
  tmp_0[16] = main_B.INPUT_2_1_2[0];
  tmp_0[17] = main_B.INPUT_2_1_2[1];
  tmp_0[18] = main_B.INPUT_2_1_2[2];
  tmp_0[19] = main_B.INPUT_2_1_2[3];
  tmp_1[5] = 20;
  tmp_0[20] = main_B.INPUT_2_1_3[0];
  tmp_0[21] = main_B.INPUT_2_1_3[1];
  tmp_0[22] = main_B.INPUT_2_1_3[2];
  tmp_0[23] = main_B.INPUT_2_1_3[3];
  tmp_1[6] = 24;
  simulationData->mData->mInputValues.mN = 24;
  simulationData->mData->mInputValues.mX = &tmp_0[0];
  simulationData->mData->mInputOffsets.mN = 7;
  simulationData->mData->mInputOffsets.mX = &tmp_1[0];
  diagnosticManager = (NeuDiagnosticManager *)main_DW.STATE_1_DiagMgr;
  diagnosticTree = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
  tmp_2 = ne_simulator_method((NeslSimulator *)main_DW.STATE_1_Simulator,
    NESL_SIM_PROJECTION, simulationData, diagnosticManager);
  if (tmp_2 != 0) {
    tmp = error_buffer_is_empty(rtmGetErrorStatus(main_M));
    if (tmp) {
      char *msg;
      msg = rtw_diagnostics_msg(diagnosticTree);
      rtmSetErrorStatus(main_M, msg);
    }
  }

  /* End of Projection for SimscapeExecutionBlock: '<S47>/STATE_1' */
}

/*
 * This function updates continuous states using the ODE4 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE4_IntgData *id = (ODE4_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T *f3 = id->f[3];
  real_T temp;
  int_T i;
  int_T nXc = 19;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  main_derivatives();

  /* f1 = f(t + (h/2), y + (h/2)*f0) */
  temp = 0.5 * h;
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (temp*f0[i]);
  }

  rtsiSetT(si, t + temp);
  rtsiSetdX(si, f1);
  main_step();
  main_derivatives();

  /* f2 = f(t + (h/2), y + (h/2)*f1) */
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (temp*f1[i]);
  }

  rtsiSetdX(si, f2);
  main_step();
  main_derivatives();

  /* f3 = f(t + h, y + h*f2) */
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (h*f2[i]);
  }

  rtsiSetT(si, tnew);
  rtsiSetdX(si, f3);
  main_step();
  main_derivatives();

  /* tnew = t + h
     ynew = y + (h/6)*(f0 + 2*f1 + 2*f2 + 2*f3) */
  temp = h / 6.0;
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + temp*(f0[i] + 2.0*f1[i] + 2.0*f2[i] + f3[i]);
  }

  main_step();
  main_projection();
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Function for MATLAB Function: '<Root>/MATLAB Function2' */
static real_T main_mod(real_T x)
{
  real_T r;
  if (rtIsNaN(x) || rtIsInf(x)) {
    r = (rtNaN);
  } else if (x == 0.0) {
    r = 0.0;
  } else {
    boolean_T rEQ0;
    r = fmod(x, 6.2831853071795862);
    rEQ0 = (r == 0.0);
    if (!rEQ0) {
      real_T q;
      q = fabs(x / 6.2831853071795862);
      rEQ0 = !(fabs(q - floor(q + 0.5)) > 2.2204460492503131E-16 * q);
    }

    if (rEQ0) {
      r = 0.0;
    } else if (x < 0.0) {
      r += 6.2831853071795862;
    }
  }

  return r;
}

real_T rt_powd_snf(real_T u0, real_T u1)
{
  real_T y;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = (rtNaN);
  } else {
    real_T tmp;
    real_T tmp_0;
    tmp = fabs(u0);
    tmp_0 = fabs(u1);
    if (rtIsInf(u1)) {
      if (tmp == 1.0) {
        y = 1.0;
      } else if (tmp > 1.0) {
        if (u1 > 0.0) {
          y = (rtInf);
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = (rtInf);
      }
    } else if (tmp_0 == 0.0) {
      y = 1.0;
    } else if (tmp_0 == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > floor(u1))) {
      y = (rtNaN);
    } else {
      y = pow(u0, u1);
    }
  }

  return y;
}

/* Model step function */
void main_step(void)
{
  /* local block i/o variables */
  real_T rtb_Bias;
  if (rtmIsMajorTimeStep(main_M)) {
    /* set solver stop time */
    if (!(main_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&main_M->solverInfo, ((main_M->Timing.clockTickH0 +
        1) * main_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&main_M->solverInfo, ((main_M->Timing.clockTick0 + 1)
        * main_M->Timing.stepSize0 + main_M->Timing.clockTickH0 *
        main_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(main_M)) {
    main_M->Timing.t[0] = rtsiGetT(&main_M->solverInfo);
  }

  {
    NeslSimulationData *simulationData;
    NeuDiagnosticManager *diagnosticManager;
    NeuDiagnosticTree *diagnosticTree;
    NeuDiagnosticTree *diagnosticTree_0;
    NeuDiagnosticTree *diagnosticTree_1;
    real_T tmp_4[37];
    real_T tmp_6[37];
    real_T tmp_1[24];
    real_T c[9];
    real_T c_coan_0[9];
    real_T coan_0[9];
    real_T coan_1[9];
    real_T rtb_Gain6[3];
    real_T c1;
    real_T c1_tmp;
    real_T coan;
    real_T time;
    real_T time_0;
    real_T time_1;
    real_T time_2;
    real_T time_3;
    real_T time_4;
    int32_T i;
    int32_T ic;
    int_T tmp_5[8];
    int_T tmp_7[8];
    int_T tmp_2[7];
    boolean_T tmp;
    boolean_T tmp_0;
    boolean_T tmp_3;

    /* SimscapeExecutionBlock: '<S47>/STATE_1' incorporates:
     *  Clock: '<Root>/Clock1'
     *  SimscapeExecutionBlock: '<S47>/OUTPUT_1_0'
     *  SimscapeExecutionBlock: '<S47>/OUTPUT_1_1'
     *  Sin: '<Root>/Sine Wave'
     *  Sin: '<Root>/Sine Wave1'
     *  Sin: '<Root>/Sine Wave2'
     */
    simulationData = (NeslSimulationData *)main_DW.STATE_1_SimData;
    c1_tmp = main_M->Timing.t[0];
    c1 = c1_tmp;
    time = c1;
    simulationData->mData->mTime.mN = 1;
    simulationData->mData->mTime.mX = &time;
    simulationData->mData->mContStates.mN = 13;
    simulationData->mData->mContStates.mX = &main_X.mainx6_DOF_JointPxp[0];
    simulationData->mData->mDiscStates.mN = 0;
    simulationData->mData->mDiscStates.mX = &main_DW.STATE_1_Discrete;
    simulationData->mData->mModeVector.mN = 0;
    simulationData->mData->mModeVector.mX = &main_DW.STATE_1_Modes;
    tmp = false;
    simulationData->mData->mFoundZcEvents = tmp;
    tmp = rtmIsMajorTimeStep(main_M);
    simulationData->mData->mIsMajorTimeStep = tmp;
    tmp_0 = false;
    simulationData->mData->mIsSolverAssertCheck = tmp_0;
    simulationData->mData->mIsSolverCheckingCIC = false;
    tmp_0 = rtsiIsSolverComputingJacobian(&main_M->solverInfo);
    simulationData->mData->mIsComputingJacobian = tmp_0;
    simulationData->mData->mIsEvaluatingF0 = false;
    simulationData->mData->mIsSolverRequestingReset = false;
    tmp_0 = rtsiIsModeUpdateTimeStep(&main_M->solverInfo);
    simulationData->mData->mIsModeUpdateTimeStep = tmp_0;
    tmp_2[0] = 0;
    tmp_1[0] = main_B.INPUT_1_1_1[0];
    tmp_1[1] = main_B.INPUT_1_1_1[1];
    tmp_1[2] = main_B.INPUT_1_1_1[2];
    tmp_1[3] = main_B.INPUT_1_1_1[3];
    tmp_2[1] = 4;
    tmp_1[4] = main_B.INPUT_1_1_2[0];
    tmp_1[5] = main_B.INPUT_1_1_2[1];
    tmp_1[6] = main_B.INPUT_1_1_2[2];
    tmp_1[7] = main_B.INPUT_1_1_2[3];
    tmp_2[2] = 8;
    tmp_1[8] = main_B.INPUT_1_1_3[0];
    tmp_1[9] = main_B.INPUT_1_1_3[1];
    tmp_1[10] = main_B.INPUT_1_1_3[2];
    tmp_1[11] = main_B.INPUT_1_1_3[3];
    tmp_2[3] = 12;
    tmp_1[12] = main_B.INPUT_2_1_1[0];
    tmp_1[13] = main_B.INPUT_2_1_1[1];
    tmp_1[14] = main_B.INPUT_2_1_1[2];
    tmp_1[15] = main_B.INPUT_2_1_1[3];
    tmp_2[4] = 16;
    tmp_1[16] = main_B.INPUT_2_1_2[0];
    tmp_1[17] = main_B.INPUT_2_1_2[1];
    tmp_1[18] = main_B.INPUT_2_1_2[2];
    tmp_1[19] = main_B.INPUT_2_1_2[3];
    tmp_2[5] = 20;
    tmp_1[20] = main_B.INPUT_2_1_3[0];
    tmp_1[21] = main_B.INPUT_2_1_3[1];
    tmp_1[22] = main_B.INPUT_2_1_3[2];
    tmp_1[23] = main_B.INPUT_2_1_3[3];
    tmp_2[6] = 24;
    simulationData->mData->mInputValues.mN = 24;
    simulationData->mData->mInputValues.mX = &tmp_1[0];
    simulationData->mData->mInputOffsets.mN = 7;
    simulationData->mData->mInputOffsets.mX = &tmp_2[0];
    simulationData->mData->mOutputs.mN = 13;
    simulationData->mData->mOutputs.mX = &main_B.STATE_1[0];
    simulationData->mData->mTolerances.mN = 0;
    simulationData->mData->mTolerances.mX = NULL;
    simulationData->mData->mCstateHasChanged = false;
    coan = main_M->Timing.t[0];
    time_0 = coan;
    simulationData->mData->mTime.mN = 1;
    simulationData->mData->mTime.mX = &time_0;
    simulationData->mData->mSampleHits.mN = 0;
    simulationData->mData->mSampleHits.mX = NULL;
    simulationData->mData->mIsFundamentalSampleHit = false;
    diagnosticManager = (NeuDiagnosticManager *)main_DW.STATE_1_DiagMgr;
    diagnosticTree = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
    ic = ne_simulator_method((NeslSimulator *)main_DW.STATE_1_Simulator,
      NESL_SIM_OUTPUTS, simulationData, diagnosticManager);
    if (ic != 0) {
      tmp_3 = error_buffer_is_empty(rtmGetErrorStatus(main_M));
      if (tmp_3) {
        char *msg;
        msg = rtw_diagnostics_msg(diagnosticTree);
        rtmSetErrorStatus(main_M, msg);
      }
    }

    /* End of SimscapeExecutionBlock: '<S47>/STATE_1' */

    /* SimscapeExecutionBlock: '<S47>/OUTPUT_1_0' */
    simulationData = (NeslSimulationData *)main_DW.OUTPUT_1_0_SimData;
    time_1 = c1;
    simulationData->mData->mTime.mN = 1;
    simulationData->mData->mTime.mX = &time_1;
    simulationData->mData->mContStates.mN = 0;
    simulationData->mData->mContStates.mX = NULL;
    simulationData->mData->mDiscStates.mN = 0;
    simulationData->mData->mDiscStates.mX = &main_DW.OUTPUT_1_0_Discrete;
    simulationData->mData->mModeVector.mN = 0;
    simulationData->mData->mModeVector.mX = &main_DW.OUTPUT_1_0_Modes;
    tmp_3 = false;
    simulationData->mData->mFoundZcEvents = tmp_3;
    simulationData->mData->mIsMajorTimeStep = tmp;
    tmp_3 = false;
    simulationData->mData->mIsSolverAssertCheck = tmp_3;
    simulationData->mData->mIsSolverCheckingCIC = false;
    simulationData->mData->mIsComputingJacobian = false;
    simulationData->mData->mIsEvaluatingF0 = false;
    simulationData->mData->mIsSolverRequestingReset = false;
    simulationData->mData->mIsModeUpdateTimeStep = tmp_0;
    tmp_5[0] = 0;
    tmp_4[0] = main_B.INPUT_1_1_1[0];
    tmp_4[1] = main_B.INPUT_1_1_1[1];
    tmp_4[2] = main_B.INPUT_1_1_1[2];
    tmp_4[3] = main_B.INPUT_1_1_1[3];
    tmp_5[1] = 4;
    tmp_4[4] = main_B.INPUT_1_1_2[0];
    tmp_4[5] = main_B.INPUT_1_1_2[1];
    tmp_4[6] = main_B.INPUT_1_1_2[2];
    tmp_4[7] = main_B.INPUT_1_1_2[3];
    tmp_5[2] = 8;
    tmp_4[8] = main_B.INPUT_1_1_3[0];
    tmp_4[9] = main_B.INPUT_1_1_3[1];
    tmp_4[10] = main_B.INPUT_1_1_3[2];
    tmp_4[11] = main_B.INPUT_1_1_3[3];
    tmp_5[3] = 12;
    tmp_4[12] = main_B.INPUT_2_1_1[0];
    tmp_4[13] = main_B.INPUT_2_1_1[1];
    tmp_4[14] = main_B.INPUT_2_1_1[2];
    tmp_4[15] = main_B.INPUT_2_1_1[3];
    tmp_5[4] = 16;
    tmp_4[16] = main_B.INPUT_2_1_2[0];
    tmp_4[17] = main_B.INPUT_2_1_2[1];
    tmp_4[18] = main_B.INPUT_2_1_2[2];
    tmp_4[19] = main_B.INPUT_2_1_2[3];
    tmp_5[5] = 20;
    tmp_4[20] = main_B.INPUT_2_1_3[0];
    tmp_4[21] = main_B.INPUT_2_1_3[1];
    tmp_4[22] = main_B.INPUT_2_1_3[2];
    tmp_4[23] = main_B.INPUT_2_1_3[3];
    tmp_5[6] = 24;
    memcpy(&tmp_4[24], &main_B.STATE_1[0], 13U * sizeof(real_T));
    tmp_5[7] = 37;
    simulationData->mData->mInputValues.mN = 37;
    simulationData->mData->mInputValues.mX = &tmp_4[0];
    simulationData->mData->mInputOffsets.mN = 8;
    simulationData->mData->mInputOffsets.mX = &tmp_5[0];
    simulationData->mData->mOutputs.mN = 13;
    simulationData->mData->mOutputs.mX = &main_B.OUTPUT_1_0[0];
    simulationData->mData->mTolerances.mN = 0;
    simulationData->mData->mTolerances.mX = NULL;
    simulationData->mData->mCstateHasChanged = false;
    time_2 = coan;
    simulationData->mData->mTime.mN = 1;
    simulationData->mData->mTime.mX = &time_2;
    simulationData->mData->mSampleHits.mN = 0;
    simulationData->mData->mSampleHits.mX = NULL;
    simulationData->mData->mIsFundamentalSampleHit = false;
    diagnosticManager = (NeuDiagnosticManager *)main_DW.OUTPUT_1_0_DiagMgr;
    diagnosticTree_0 = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
    ic = ne_simulator_method((NeslSimulator *)main_DW.OUTPUT_1_0_Simulator,
      NESL_SIM_OUTPUTS, simulationData, diagnosticManager);
    if (ic != 0) {
      tmp_3 = error_buffer_is_empty(rtmGetErrorStatus(main_M));
      if (tmp_3) {
        char *msg_0;
        msg_0 = rtw_diagnostics_msg(diagnosticTree_0);
        rtmSetErrorStatus(main_M, msg_0);
      }
    }

    /* Gain: '<Root>/Gain5' incorporates:
     *  Sin: '<Root>/Sine Wave'
     */
    main_B.Gain5 = (sin(main_P.SineWave_Freq * coan + main_P.SineWave_Phase) *
                    main_P.SineWave_Amp + main_P.SineWave_Bias) *
      main_P.Gain5_Gain;

    /* Gain: '<Root>/Gain4' incorporates:
     *  Sin: '<Root>/Sine Wave1'
     */
    main_B.Gain4 = (sin(main_P.SineWave1_Freq * coan + main_P.SineWave1_Phase) *
                    main_P.SineWave1_Amp + main_P.SineWave1_Bias) *
      main_P.Gain4_Gain;

    /* Gain: '<Root>/Gain3' incorporates:
     *  Sin: '<Root>/Sine Wave2'
     */
    main_B.Gain3 = (sin(main_P.SineWave2_Freq * coan + main_P.SineWave2_Phase) *
                    main_P.SineWave2_Amp + main_P.SineWave2_Bias) *
      main_P.Gain3_Gain;

    /* Gain: '<Root>/Gain' incorporates:
     *  Reshape: '<Root>/Reshape9'
     */
    main_B.Gain[0] = main_P.Gain_Gain * main_B.Gain5;
    main_B.Gain[1] = main_P.Gain_Gain * main_B.Gain4;
    main_B.Gain[2] = main_P.Gain_Gain * main_B.Gain3;

    /* SimscapeInputBlock: '<S47>/INPUT_1_1_1' */
    main_B.INPUT_1_1_1[0] = main_B.Gain[0];
    main_B.INPUT_1_1_1[1] = 0.0;
    main_B.INPUT_1_1_1[2] = 0.0;
    main_B.INPUT_1_1_1[3] = 0.0;

    /* SimscapeInputBlock: '<S47>/INPUT_1_1_2' */
    main_B.INPUT_1_1_2[0] = main_B.Gain[1];
    main_B.INPUT_1_1_2[1] = 0.0;
    main_B.INPUT_1_1_2[2] = 0.0;
    main_B.INPUT_1_1_2[3] = 0.0;

    /* SimscapeInputBlock: '<S47>/INPUT_1_1_3' */
    main_B.INPUT_1_1_3[0] = main_B.Gain[2];
    main_B.INPUT_1_1_3[1] = 0.0;
    main_B.INPUT_1_1_3[2] = 0.0;
    main_B.INPUT_1_1_3[3] = 0.0;
    if (rtmIsMajorTimeStep(main_M)) {
      /* Gain: '<Root>/Gain1' incorporates:
       *  Constant: '<Root>/Constant1'
       */
      main_B.Gain1[0] = main_P.Gain1_Gain * main_P.Constant1_Value[0];
      main_B.Gain1[1] = main_P.Gain1_Gain * main_P.Constant1_Value[1];
      main_B.Gain1[2] = main_P.Gain1_Gain * main_P.Constant1_Value[2];
    }

    /* SimscapeInputBlock: '<S47>/INPUT_2_1_1' */
    main_B.INPUT_2_1_1[0] = main_B.Gain1[0];
    main_B.INPUT_2_1_1[1] = 0.0;
    main_B.INPUT_2_1_1[2] = 0.0;
    if (rtmIsMajorTimeStep(main_M)) {
      main_DW.INPUT_2_1_1_Discrete[0] = !(main_B.INPUT_2_1_1[0] ==
        main_DW.INPUT_2_1_1_Discrete[1]);
      main_DW.INPUT_2_1_1_Discrete[1] = main_B.INPUT_2_1_1[0];
    }

    main_B.INPUT_2_1_1[0] = main_DW.INPUT_2_1_1_Discrete[1];
    main_B.INPUT_2_1_1[3] = main_DW.INPUT_2_1_1_Discrete[0];

    /* End of SimscapeInputBlock: '<S47>/INPUT_2_1_1' */

    /* SimscapeInputBlock: '<S47>/INPUT_2_1_2' */
    main_B.INPUT_2_1_2[0] = main_B.Gain1[1];
    main_B.INPUT_2_1_2[1] = 0.0;
    main_B.INPUT_2_1_2[2] = 0.0;
    if (rtmIsMajorTimeStep(main_M)) {
      main_DW.INPUT_2_1_2_Discrete[0] = !(main_B.INPUT_2_1_2[0] ==
        main_DW.INPUT_2_1_2_Discrete[1]);
      main_DW.INPUT_2_1_2_Discrete[1] = main_B.INPUT_2_1_2[0];
    }

    main_B.INPUT_2_1_2[0] = main_DW.INPUT_2_1_2_Discrete[1];
    main_B.INPUT_2_1_2[3] = main_DW.INPUT_2_1_2_Discrete[0];

    /* End of SimscapeInputBlock: '<S47>/INPUT_2_1_2' */

    /* SimscapeInputBlock: '<S47>/INPUT_2_1_3' */
    main_B.INPUT_2_1_3[0] = main_B.Gain1[2];
    main_B.INPUT_2_1_3[1] = 0.0;
    main_B.INPUT_2_1_3[2] = 0.0;
    if (rtmIsMajorTimeStep(main_M)) {
      main_DW.INPUT_2_1_3_Discrete[0] = !(main_B.INPUT_2_1_3[0] ==
        main_DW.INPUT_2_1_3_Discrete[1]);
      main_DW.INPUT_2_1_3_Discrete[1] = main_B.INPUT_2_1_3[0];
    }

    main_B.INPUT_2_1_3[0] = main_DW.INPUT_2_1_3_Discrete[1];
    main_B.INPUT_2_1_3[3] = main_DW.INPUT_2_1_3_Discrete[0];

    /* End of SimscapeInputBlock: '<S47>/INPUT_2_1_3' */

    /* SimscapeExecutionBlock: '<S47>/OUTPUT_1_1' */
    simulationData = (NeslSimulationData *)main_DW.OUTPUT_1_1_SimData;
    time_3 = c1;
    simulationData->mData->mTime.mN = 1;
    simulationData->mData->mTime.mX = &time_3;
    simulationData->mData->mContStates.mN = 0;
    simulationData->mData->mContStates.mX = NULL;
    simulationData->mData->mDiscStates.mN = 0;
    simulationData->mData->mDiscStates.mX = &main_DW.OUTPUT_1_1_Discrete;
    simulationData->mData->mModeVector.mN = 0;
    simulationData->mData->mModeVector.mX = &main_DW.OUTPUT_1_1_Modes;
    tmp_3 = false;
    simulationData->mData->mFoundZcEvents = tmp_3;
    simulationData->mData->mIsMajorTimeStep = tmp;
    tmp = false;
    simulationData->mData->mIsSolverAssertCheck = tmp;
    simulationData->mData->mIsSolverCheckingCIC = false;
    simulationData->mData->mIsComputingJacobian = false;
    simulationData->mData->mIsEvaluatingF0 = false;
    simulationData->mData->mIsSolverRequestingReset = false;
    simulationData->mData->mIsModeUpdateTimeStep = tmp_0;
    tmp_7[0] = 0;
    tmp_6[0] = main_B.INPUT_1_1_1[0];
    tmp_6[1] = main_B.INPUT_1_1_1[1];
    tmp_6[2] = main_B.INPUT_1_1_1[2];
    tmp_6[3] = main_B.INPUT_1_1_1[3];
    tmp_7[1] = 4;
    tmp_6[4] = main_B.INPUT_1_1_2[0];
    tmp_6[5] = main_B.INPUT_1_1_2[1];
    tmp_6[6] = main_B.INPUT_1_1_2[2];
    tmp_6[7] = main_B.INPUT_1_1_2[3];
    tmp_7[2] = 8;
    tmp_6[8] = main_B.INPUT_1_1_3[0];
    tmp_6[9] = main_B.INPUT_1_1_3[1];
    tmp_6[10] = main_B.INPUT_1_1_3[2];
    tmp_6[11] = main_B.INPUT_1_1_3[3];
    tmp_7[3] = 12;
    tmp_6[12] = main_B.INPUT_2_1_1[0];
    tmp_6[13] = main_B.INPUT_2_1_1[1];
    tmp_6[14] = main_B.INPUT_2_1_1[2];
    tmp_6[15] = main_B.INPUT_2_1_1[3];
    tmp_7[4] = 16;
    tmp_6[16] = main_B.INPUT_2_1_2[0];
    tmp_6[17] = main_B.INPUT_2_1_2[1];
    tmp_6[18] = main_B.INPUT_2_1_2[2];
    tmp_6[19] = main_B.INPUT_2_1_2[3];
    tmp_7[5] = 20;
    tmp_6[20] = main_B.INPUT_2_1_3[0];
    tmp_6[21] = main_B.INPUT_2_1_3[1];
    tmp_6[22] = main_B.INPUT_2_1_3[2];
    tmp_6[23] = main_B.INPUT_2_1_3[3];
    tmp_7[6] = 24;
    memcpy(&tmp_6[24], &main_B.STATE_1[0], 13U * sizeof(real_T));
    tmp_7[7] = 37;
    simulationData->mData->mInputValues.mN = 37;
    simulationData->mData->mInputValues.mX = &tmp_6[0];
    simulationData->mData->mInputOffsets.mN = 8;
    simulationData->mData->mInputOffsets.mX = &tmp_7[0];
    simulationData->mData->mOutputs.mN = 6;
    simulationData->mData->mOutputs.mX = &main_B.OUTPUT_1_1[0];
    simulationData->mData->mTolerances.mN = 0;
    simulationData->mData->mTolerances.mX = NULL;
    simulationData->mData->mCstateHasChanged = false;
    time_4 = coan;
    simulationData->mData->mTime.mN = 1;
    simulationData->mData->mTime.mX = &time_4;
    simulationData->mData->mSampleHits.mN = 0;
    simulationData->mData->mSampleHits.mX = NULL;
    simulationData->mData->mIsFundamentalSampleHit = false;
    diagnosticManager = (NeuDiagnosticManager *)main_DW.OUTPUT_1_1_DiagMgr;
    diagnosticTree_1 = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
    ic = ne_simulator_method((NeslSimulator *)main_DW.OUTPUT_1_1_Simulator,
      NESL_SIM_OUTPUTS, simulationData, diagnosticManager);
    if (ic != 0) {
      tmp = error_buffer_is_empty(rtmGetErrorStatus(main_M));
      if (tmp) {
        char *msg_1;
        msg_1 = rtw_diagnostics_msg(diagnosticTree_1);
        rtmSetErrorStatus(main_M, msg_1);
      }
    }

    if (rtmIsMajorTimeStep(main_M)) {
      real_T am1;
      real_T am2;
      real_T b_coan;
      real_T b_sian;
      real_T c_coan;
      real_T c_sian;
      real_T exc;
      real_T exc2;
      real_T sian;
      int32_T coan_tmp;

      /* MATLAB Function: '<Root>/MATLAB Function2' incorporates:
       *  Constant: '<Root>/Orbit Keplerian Elements'
       */
      exc = main_P.OrbitKeplerianElements_Value[1];
      exc2 = main_P.OrbitKeplerianElements_Value[1] *
        main_P.OrbitKeplerianElements_Value[1];
      c1 = sqrt(1.0 - exc2);
      coan = cos(-main_P.OrbitKeplerianElements_Value[3]);
      sian = sin(-main_P.OrbitKeplerianElements_Value[3]);
      b_coan = cos(-main_P.OrbitKeplerianElements_Value[2]);
      b_sian = sin(-main_P.OrbitKeplerianElements_Value[2]);
      c_coan = cos(-main_P.OrbitKeplerianElements_Value[4]);
      c_sian = sin(-main_P.OrbitKeplerianElements_Value[4]);
      rtb_Gain6[0] = 0.0;
      rtb_Gain6[1] = 0.0;
      rtb_Gain6[2] = 1.0;
      am1 = main_mod(main_P.OrbitKeplerianElements_Value[5]);
      am2 = am1 + am1;
      exc2 = main_mod(((1.0 - 0.125 * exc2) *
                       main_P.OrbitKeplerianElements_Value[1] * sin(am1) + am1)
                      + (0.75 * main_P.OrbitKeplerianElements_Value[1] * sin(am1
        + am2) + sin(am2)) * (0.5 * exc2));
      am2 = 1.0;
      ic = 0;
      while ((fabs(am2) > 1.0E-12) && (ic <= 10)) {
        am2 = ((exc2 - am1) - exc * sin(exc2)) / (1.0 - exc * cos(exc2));
        exc2 -= am2;
        ic++;
      }

      exc = sin(exc2);
      am1 = cos(exc2);
      exc2 = sqrt(3.9860064E+14 / main_P.OrbitKeplerianElements_Value[0]) / (1.0
        - main_P.OrbitKeplerianElements_Value[1] * am1);
      coan_0[0] = coan;
      coan_0[3] = sian;
      coan_0[6] = 0.0;
      coan_0[1] = -sian;
      coan_0[4] = coan;
      coan_0[7] = 0.0;
      coan_0[2] = 0.0;
      c[0] = 1.0;
      coan_0[5] = 0.0;
      c[3] = 0.0;
      coan_0[8] = 1.0;
      c[6] = 0.0;
      c[1] = 0.0;
      c[4] = b_coan;
      c[7] = b_sian;
      c[2] = 0.0;
      c[5] = -b_sian;
      c[8] = b_coan;
      c_coan_0[0] = c_coan;
      c_coan_0[3] = c_sian;
      c_coan_0[6] = 0.0;
      c_coan_0[1] = -c_sian;
      c_coan_0[4] = c_coan;
      c_coan_0[7] = 0.0;
      for (ic = 0; ic < 3; ic++) {
        for (i = 0; i < 3; i++) {
          coan_tmp = 3 * i + ic;
          coan_1[coan_tmp] = 0.0;
          coan_1[coan_tmp] += c[3 * i] * coan_0[ic];
          coan_1[coan_tmp] += c[3 * i + 1] * coan_0[ic + 3];
          coan_1[coan_tmp] += c[3 * i + 2] * coan_0[ic + 6];
        }

        c_coan_0[3 * ic + 2] = rtb_Gain6[ic];
      }

      for (ic = 0; ic < 3; ic++) {
        for (i = 0; i < 3; i++) {
          coan_tmp = 3 * ic + i;
          coan_0[coan_tmp] = 0.0;
          coan_0[coan_tmp] += c_coan_0[3 * i] * coan_1[ic];
          coan_0[coan_tmp] += c_coan_0[3 * i + 1] * coan_1[ic + 3];
          coan_0[coan_tmp] += c_coan_0[3 * i + 2] * coan_1[ic + 6];
        }
      }

      coan = (am1 - main_P.OrbitKeplerianElements_Value[1]) *
        main_P.OrbitKeplerianElements_Value[0];
      sian = main_P.OrbitKeplerianElements_Value[0] * c1 * exc;
      exc *= -exc2;
      c1 = c1 * exc2 * am1;
      for (ic = 0; ic < 3; ic++) {
        am1 = coan_0[3 * ic];
        b_coan = coan * am1;
        exc2 = exc * am1;
        am1 = coan_0[3 * ic + 1];
        b_coan += sian * am1;
        exc2 += c1 * am1;
        am1 = coan_0[3 * ic + 2];
        main_B.statvec[ic] = 0.0 * am1 + b_coan;
        main_B.statvec[ic + 3] = 0.0 * am1 + exc2;
      }

      /* End of MATLAB Function: '<Root>/MATLAB Function2' */
    }

    for (ic = 0; ic < 6; ic++) {
      /* Integrator: '<Root>/Integrator2' */
      if (main_DW.Integrator2_IWORK != 0) {
        main_X.Integrator2_CSTATE[ic] = main_B.statvec[ic];
      }

      /* Integrator: '<Root>/Integrator2' */
      main_B.Integrator2[ic] = main_X.Integrator2_CSTATE[ic];
    }

    if (rtmIsMajorTimeStep(main_M)) {
      /* ToWorkspace: '<Root>/To Workspace' */
      if (rtmIsMajorTimeStep(main_M)) {
        rt_UpdateLogVar((LogVar *)(LogVar*)
                        (main_DW.ToWorkspace_PWORK.LoggedData),
                        &main_B.Integrator2[0], 0);
      }
    }

    /* Gain: '<Root>/Gain6' */
    rtb_Gain6[0] = main_P.Gain6_Gain * main_B.OUTPUT_1_1[3];
    rtb_Gain6[1] = main_P.Gain6_Gain * main_B.OUTPUT_1_1[4];
    rtb_Gain6[2] = main_P.Gain6_Gain * main_B.OUTPUT_1_1[5];

    /* Clock: '<Root>/Clock1' */
    main_B.Clock1 = c1_tmp;
    if (rtmIsMajorTimeStep(main_M)) {
      /* MATLAB Function: '<Root>/Impulse Force' */
      tmp = ((main_B.Clock1 >= 1000.0) && (main_B.Clock1 <= 1050.0));
      tmp_0 = ((main_B.Clock1 >= 1100.0) && (main_B.Clock1 <= 1150.0));
      if (tmp) {
        ic = -10000;
      } else if (tmp_0) {
        ic = 20000;
      } else {
        ic = 0;
      }

      /* Gain: '<Root>/Gain2' incorporates:
       *  MATLAB Function: '<Root>/Impulse Force'
       */
      main_B.Gain2[0] = main_P.Gain2_Gain * (real_T)ic;

      /* MATLAB Function: '<Root>/Impulse Force' */
      if (tmp) {
        ic = 10000;
      } else {
        ic = 0;
        if (tmp_0) {
          ic = -10000;
        }
      }

      /* Gain: '<Root>/Gain2' incorporates:
       *  MATLAB Function: '<Root>/Impulse Force'
       */
      main_B.Gain2[1] = main_P.Gain2_Gain * 0.0;
      main_B.Gain2[2] = main_P.Gain2_Gain * (real_T)ic;
    }

    /* MATLAB Function: '<Root>/Basic Kepler Propagator' incorporates:
     *  Gain: '<Root>/Gain2'
     *  Gain: '<Root>/Gain6'
     *  Integrator: '<Root>/Integrator2'
     */
    main_B.dfdt[0] = main_B.Integrator2[3];
    main_B.dfdt[1] = main_B.Integrator2[4];
    main_B.dfdt[2] = main_B.Integrator2[5];
    c1 = rt_powd_snf(sqrt((main_B.Integrator2[0] * main_B.Integrator2[0] +
      main_B.Integrator2[1] * main_B.Integrator2[1]) + main_B.Integrator2[2] *
                          main_B.Integrator2[2]), 3.0);
    main_B.dfdt[3] = (-3.9865E+14 * main_B.Integrator2[0] / c1 + rtb_Gain6[0]) +
      main_B.Gain2[0] / 100.0;
    main_B.dfdt[4] = (-3.9865E+14 * main_B.Integrator2[1] / c1 + rtb_Gain6[1]) +
      main_B.Gain2[1] / 100.0;
    main_B.dfdt[5] = (-3.9865E+14 * main_B.Integrator2[2] / c1 + rtb_Gain6[2]) +
      main_B.Gain2[2] / 100.0;
    if (rtmIsMajorTimeStep(main_M)) {
      /* MATLAB Function: '<S2>/Modified Julian Date (mjd)' incorporates:
       *  Constant: '<Root>/Day'
       *  Constant: '<Root>/Month'
       *  Constant: '<Root>/Year'
       */
      main_B.diju = (((367.0 * main_P.Year_Value + main_P.Day_Value) - 712269.0)
                     + trunc(275.0 * main_P.Month_Value / 9.0)) - trunc((trunc
        ((main_P.Month_Value + 9.0) / 12.0) + main_P.Year_Value) * 7.0 / 4.0);

      /* Sum: '<Root>/Sum2' incorporates:
       *  Constant: '<Root>/constant1'
       */
      c1 = main_B.diju + main_P.constant1_Value;

      /* ToWorkspace: '<Root>/JD1' */
      if (rtmIsMajorTimeStep(main_M)) {
        rt_UpdateLogVar((LogVar *)(LogVar*) (main_DW.JD1_PWORK.LoggedData), &c1,
                        0);
      }

      /* Bias: '<S2>/Bias' incorporates:
       *  Constant: '<Root>/Year'
       */
      rtb_Bias = main_P.Year_Value + main_P.Bias_Bias;

      /* MATLAB Function: '<Root>/Ephemerides Time1' incorporates:
       *  Constant: '<Root>/UTC hour1'
       *  Constant: '<Root>/UTC minute1'
       *  Constant: '<Root>/UTC second1'
       */
      main_B.dayf = (60.0 * main_P.UTChour1_Value + main_P.UTCminute1_Value) *
        60.0 + main_P.UTCsecond1_Value;
    }
  }

  if (rtmIsMajorTimeStep(main_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(main_M->rtwLogInfo, (main_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(main_M)) {
    NeslSimulationData *simulationData;
    NeuDiagnosticManager *diagnosticManager;
    NeuDiagnosticTree *diagnosticTree;
    real_T tmp_0[24];
    real_T time;
    int32_T tmp_2;
    int_T tmp_1[7];
    boolean_T tmp;

    /* Update for SimscapeExecutionBlock: '<S47>/STATE_1' */
    simulationData = (NeslSimulationData *)main_DW.STATE_1_SimData;
    time = main_M->Timing.t[0];
    simulationData->mData->mTime.mN = 1;
    simulationData->mData->mTime.mX = &time;
    simulationData->mData->mContStates.mN = 13;
    simulationData->mData->mContStates.mX = &main_X.mainx6_DOF_JointPxp[0];
    simulationData->mData->mDiscStates.mN = 0;
    simulationData->mData->mDiscStates.mX = &main_DW.STATE_1_Discrete;
    simulationData->mData->mModeVector.mN = 0;
    simulationData->mData->mModeVector.mX = &main_DW.STATE_1_Modes;
    tmp = false;
    simulationData->mData->mFoundZcEvents = tmp;
    simulationData->mData->mIsMajorTimeStep = rtmIsMajorTimeStep(main_M);
    tmp = false;
    simulationData->mData->mIsSolverAssertCheck = tmp;
    simulationData->mData->mIsSolverCheckingCIC = false;
    tmp = rtsiIsSolverComputingJacobian(&main_M->solverInfo);
    simulationData->mData->mIsComputingJacobian = tmp;
    simulationData->mData->mIsEvaluatingF0 = false;
    simulationData->mData->mIsSolverRequestingReset = false;
    simulationData->mData->mIsModeUpdateTimeStep = rtsiIsModeUpdateTimeStep
      (&main_M->solverInfo);
    tmp_1[0] = 0;
    tmp_0[0] = main_B.INPUT_1_1_1[0];
    tmp_0[1] = main_B.INPUT_1_1_1[1];
    tmp_0[2] = main_B.INPUT_1_1_1[2];
    tmp_0[3] = main_B.INPUT_1_1_1[3];
    tmp_1[1] = 4;
    tmp_0[4] = main_B.INPUT_1_1_2[0];
    tmp_0[5] = main_B.INPUT_1_1_2[1];
    tmp_0[6] = main_B.INPUT_1_1_2[2];
    tmp_0[7] = main_B.INPUT_1_1_2[3];
    tmp_1[2] = 8;
    tmp_0[8] = main_B.INPUT_1_1_3[0];
    tmp_0[9] = main_B.INPUT_1_1_3[1];
    tmp_0[10] = main_B.INPUT_1_1_3[2];
    tmp_0[11] = main_B.INPUT_1_1_3[3];
    tmp_1[3] = 12;
    tmp_0[12] = main_B.INPUT_2_1_1[0];
    tmp_0[13] = main_B.INPUT_2_1_1[1];
    tmp_0[14] = main_B.INPUT_2_1_1[2];
    tmp_0[15] = main_B.INPUT_2_1_1[3];
    tmp_1[4] = 16;
    tmp_0[16] = main_B.INPUT_2_1_2[0];
    tmp_0[17] = main_B.INPUT_2_1_2[1];
    tmp_0[18] = main_B.INPUT_2_1_2[2];
    tmp_0[19] = main_B.INPUT_2_1_2[3];
    tmp_1[5] = 20;
    tmp_0[20] = main_B.INPUT_2_1_3[0];
    tmp_0[21] = main_B.INPUT_2_1_3[1];
    tmp_0[22] = main_B.INPUT_2_1_3[2];
    tmp_0[23] = main_B.INPUT_2_1_3[3];
    tmp_1[6] = 24;
    simulationData->mData->mInputValues.mN = 24;
    simulationData->mData->mInputValues.mX = &tmp_0[0];
    simulationData->mData->mInputOffsets.mN = 7;
    simulationData->mData->mInputOffsets.mX = &tmp_1[0];
    diagnosticManager = (NeuDiagnosticManager *)main_DW.STATE_1_DiagMgr;
    diagnosticTree = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
    tmp_2 = ne_simulator_method((NeslSimulator *)main_DW.STATE_1_Simulator,
      NESL_SIM_UPDATE, simulationData, diagnosticManager);
    if (tmp_2 != 0) {
      tmp = error_buffer_is_empty(rtmGetErrorStatus(main_M));
      if (tmp) {
        char *msg;
        msg = rtw_diagnostics_msg(diagnosticTree);
        rtmSetErrorStatus(main_M, msg);
      }
    }

    /* End of Update for SimscapeExecutionBlock: '<S47>/STATE_1' */

    /* Update for Integrator: '<Root>/Integrator2' */
    main_DW.Integrator2_IWORK = 0;
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(main_M)) {
    /* signal main to stop simulation */
    {                                  /* Sample time: [0.0s, 0.0s] */
      if ((rtmGetTFinal(main_M)!=-1) &&
          !((rtmGetTFinal(main_M)-(((main_M->Timing.clockTick1+
               main_M->Timing.clockTickH1* 4294967296.0)) * 0.01)) >
            (((main_M->Timing.clockTick1+main_M->Timing.clockTickH1*
               4294967296.0)) * 0.01) * (DBL_EPSILON))) {
        rtmSetErrorStatus(main_M, "Simulation finished");
      }
    }

    rt_ertODEUpdateContinuousStates(&main_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++main_M->Timing.clockTick0)) {
      ++main_M->Timing.clockTickH0;
    }

    main_M->Timing.t[0] = rtsiGetSolverStopTime(&main_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.01s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.01, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       * Timer of this task consists of two 32 bit unsigned integers.
       * The two integers represent the low bits Timing.clockTick1 and the high bits
       * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
       */
      main_M->Timing.clockTick1++;
      if (!main_M->Timing.clockTick1) {
        main_M->Timing.clockTickH1++;
      }
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void main_derivatives(void)
{
  NeslSimulationData *simulationData;
  NeuDiagnosticManager *diagnosticManager;
  NeuDiagnosticTree *diagnosticTree;
  XDot_main_T *_rtXdot;
  real_T tmp_0[24];
  real_T time;
  int32_T i;
  int_T tmp_1[7];
  boolean_T tmp;
  _rtXdot = ((XDot_main_T *) main_M->derivs);

  /* Derivatives for SimscapeExecutionBlock: '<S47>/STATE_1' */
  simulationData = (NeslSimulationData *)main_DW.STATE_1_SimData;
  time = main_M->Timing.t[0];
  simulationData->mData->mTime.mN = 1;
  simulationData->mData->mTime.mX = &time;
  simulationData->mData->mContStates.mN = 13;
  simulationData->mData->mContStates.mX = &main_X.mainx6_DOF_JointPxp[0];
  simulationData->mData->mDiscStates.mN = 0;
  simulationData->mData->mDiscStates.mX = &main_DW.STATE_1_Discrete;
  simulationData->mData->mModeVector.mN = 0;
  simulationData->mData->mModeVector.mX = &main_DW.STATE_1_Modes;
  tmp = false;
  simulationData->mData->mFoundZcEvents = tmp;
  simulationData->mData->mIsMajorTimeStep = rtmIsMajorTimeStep(main_M);
  tmp = false;
  simulationData->mData->mIsSolverAssertCheck = tmp;
  simulationData->mData->mIsSolverCheckingCIC = false;
  tmp = rtsiIsSolverComputingJacobian(&main_M->solverInfo);
  simulationData->mData->mIsComputingJacobian = tmp;
  simulationData->mData->mIsEvaluatingF0 = false;
  simulationData->mData->mIsSolverRequestingReset = false;
  simulationData->mData->mIsModeUpdateTimeStep = rtsiIsModeUpdateTimeStep
    (&main_M->solverInfo);
  tmp_1[0] = 0;
  tmp_0[0] = main_B.INPUT_1_1_1[0];
  tmp_0[1] = main_B.INPUT_1_1_1[1];
  tmp_0[2] = main_B.INPUT_1_1_1[2];
  tmp_0[3] = main_B.INPUT_1_1_1[3];
  tmp_1[1] = 4;
  tmp_0[4] = main_B.INPUT_1_1_2[0];
  tmp_0[5] = main_B.INPUT_1_1_2[1];
  tmp_0[6] = main_B.INPUT_1_1_2[2];
  tmp_0[7] = main_B.INPUT_1_1_2[3];
  tmp_1[2] = 8;
  tmp_0[8] = main_B.INPUT_1_1_3[0];
  tmp_0[9] = main_B.INPUT_1_1_3[1];
  tmp_0[10] = main_B.INPUT_1_1_3[2];
  tmp_0[11] = main_B.INPUT_1_1_3[3];
  tmp_1[3] = 12;
  tmp_0[12] = main_B.INPUT_2_1_1[0];
  tmp_0[13] = main_B.INPUT_2_1_1[1];
  tmp_0[14] = main_B.INPUT_2_1_1[2];
  tmp_0[15] = main_B.INPUT_2_1_1[3];
  tmp_1[4] = 16;
  tmp_0[16] = main_B.INPUT_2_1_2[0];
  tmp_0[17] = main_B.INPUT_2_1_2[1];
  tmp_0[18] = main_B.INPUT_2_1_2[2];
  tmp_0[19] = main_B.INPUT_2_1_2[3];
  tmp_1[5] = 20;
  tmp_0[20] = main_B.INPUT_2_1_3[0];
  tmp_0[21] = main_B.INPUT_2_1_3[1];
  tmp_0[22] = main_B.INPUT_2_1_3[2];
  tmp_0[23] = main_B.INPUT_2_1_3[3];
  tmp_1[6] = 24;
  simulationData->mData->mInputValues.mN = 24;
  simulationData->mData->mInputValues.mX = &tmp_0[0];
  simulationData->mData->mInputOffsets.mN = 7;
  simulationData->mData->mInputOffsets.mX = &tmp_1[0];
  simulationData->mData->mDx.mN = 13;
  simulationData->mData->mDx.mX = &_rtXdot->mainx6_DOF_JointPxp[0];
  diagnosticManager = (NeuDiagnosticManager *)main_DW.STATE_1_DiagMgr;
  diagnosticTree = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
  i = ne_simulator_method((NeslSimulator *)main_DW.STATE_1_Simulator,
    NESL_SIM_DERIVATIVES, simulationData, diagnosticManager);
  if (i != 0) {
    tmp = error_buffer_is_empty(rtmGetErrorStatus(main_M));
    if (tmp) {
      char *msg;
      msg = rtw_diagnostics_msg(diagnosticTree);
      rtmSetErrorStatus(main_M, msg);
    }
  }

  /* End of Derivatives for SimscapeExecutionBlock: '<S47>/STATE_1' */

  /* Derivatives for Integrator: '<Root>/Integrator2' */
  for (i = 0; i < 6; i++) {
    _rtXdot->Integrator2_CSTATE[i] = main_B.dfdt[i];
  }

  /* End of Derivatives for Integrator: '<Root>/Integrator2' */
}

/* Model initialize function */
void main_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)main_M, 0,
                sizeof(RT_MODEL_main_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&main_M->solverInfo, &main_M->Timing.simTimeStep);
    rtsiSetTPtr(&main_M->solverInfo, &rtmGetTPtr(main_M));
    rtsiSetStepSizePtr(&main_M->solverInfo, &main_M->Timing.stepSize0);
    rtsiSetdXPtr(&main_M->solverInfo, &main_M->derivs);
    rtsiSetContStatesPtr(&main_M->solverInfo, (real_T **) &main_M->contStates);
    rtsiSetNumContStatesPtr(&main_M->solverInfo, &main_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&main_M->solverInfo,
      &main_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&main_M->solverInfo,
      &main_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&main_M->solverInfo,
      &main_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&main_M->solverInfo, (&rtmGetErrorStatus(main_M)));
    rtsiSetRTModelPtr(&main_M->solverInfo, main_M);
  }

  rtsiSetSimTimeStep(&main_M->solverInfo, MAJOR_TIME_STEP);
  main_M->intgData.y = main_M->odeY;
  main_M->intgData.f[0] = main_M->odeF[0];
  main_M->intgData.f[1] = main_M->odeF[1];
  main_M->intgData.f[2] = main_M->odeF[2];
  main_M->intgData.f[3] = main_M->odeF[3];
  main_M->contStates = ((X_main_T *) &main_X);
  rtsiSetSolverData(&main_M->solverInfo, (void *)&main_M->intgData);
  rtsiSetIsMinorTimeStepWithModeChange(&main_M->solverInfo, false);
  rtsiSetSolverName(&main_M->solverInfo,"ode4");
  rtmSetTPtr(main_M, &main_M->Timing.tArray[0]);
  rtmSetTFinal(main_M, 5730.76);
  main_M->Timing.stepSize0 = 0.01;
  rtmSetFirstInitCond(main_M, 1);

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = (NULL);
    main_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(main_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(main_M->rtwLogInfo, (NULL));
    rtliSetLogT(main_M->rtwLogInfo, "tout");
    rtliSetLogX(main_M->rtwLogInfo, "");
    rtliSetLogXFinal(main_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(main_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(main_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(main_M->rtwLogInfo, 0);
    rtliSetLogDecimation(main_M->rtwLogInfo, 1);
    rtliSetLogY(main_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(main_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(main_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &main_B), 0,
                sizeof(B_main_T));

  /* states (continuous) */
  {
    (void) memset((void *)&main_X, 0,
                  sizeof(X_main_T));
  }

  /* states (dwork) */
  (void) memset((void *)&main_DW, 0,
                sizeof(DW_main_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(main_M->rtwLogInfo, 0.0, rtmGetTFinal(main_M),
    main_M->Timing.stepSize0, (&rtmGetErrorStatus(main_M)));

  {
    NeModelParameters modelParameters;
    NeModelParameters modelParameters_0;
    NeModelParameters modelParameters_1;
    NeslSimulationData *tmp_1;
    NeslSimulator *tmp;
    NeuDiagnosticManager *diagnosticManager;
    NeuDiagnosticTree *diagnosticTree;
    NeuDiagnosticTree *diagnosticTree_0;
    NeuDiagnosticTree *diagnosticTree_1;
    real_T tmp_2;
    int32_T tmp_3;
    boolean_T tmp_0;

    /* SetupRuntimeResources for ToWorkspace: '<Root>/To Workspace' */
    {
      int_T dimensions[2] = { 1, 6 };

      main_DW.ToWorkspace_PWORK.LoggedData = rt_CreateLogVar(
        main_M->rtwLogInfo,
        0.0,
        rtmGetTFinal(main_M),
        main_M->Timing.stepSize0,
        (&rtmGetErrorStatus(main_M)),
        "T_statevec",
        SS_DOUBLE,
        0,
        0,
        1,
        6,
        2,
        dimensions,
        NO_LOGVALDIMS,
        (NULL),
        (NULL),
        0,
        1,
        0.01,
        1);
      if (main_DW.ToWorkspace_PWORK.LoggedData == (NULL))
        return;
    }

    /* SetupRuntimeResources for ToWorkspace: '<Root>/JD1' */
    {
      int_T dimensions[1] = { 1 };

      main_DW.JD1_PWORK.LoggedData = rt_CreateLogVar(
        main_M->rtwLogInfo,
        0.0,
        rtmGetTFinal(main_M),
        main_M->Timing.stepSize0,
        (&rtmGetErrorStatus(main_M)),
        "Julian_date1",
        SS_DOUBLE,
        0,
        0,
        0,
        1,
        1,
        dimensions,
        NO_LOGVALDIMS,
        (NULL),
        (NULL),
        0,
        1,
        0.01,
        1);
      if (main_DW.JD1_PWORK.LoggedData == (NULL))
        return;
    }

    /* Start for SimscapeExecutionBlock: '<S47>/STATE_1' */
    tmp = nesl_lease_simulator("main/Solver Configuration_1", 0, 0);
    main_DW.STATE_1_Simulator = (void *)tmp;
    tmp_0 = pointer_is_null(main_DW.STATE_1_Simulator);
    if (tmp_0) {
      main_836bb176_1_gateway();
      tmp = nesl_lease_simulator("main/Solver Configuration_1", 0, 0);
      main_DW.STATE_1_Simulator = (void *)tmp;
    }

    tmp_1 = nesl_create_simulation_data();
    main_DW.STATE_1_SimData = (void *)tmp_1;
    diagnosticManager = rtw_create_diagnostics();
    main_DW.STATE_1_DiagMgr = (void *)diagnosticManager;
    modelParameters.mSolverType = NE_SOLVER_TYPE_ODE;
    modelParameters.mSolverTolerance = 0.001;
    modelParameters.mSolverAbsTol = 0.001;
    modelParameters.mSolverRelTol = 0.001;
    modelParameters.mVariableStepSolver = false;
    modelParameters.mIsUsingODEN = false;
    modelParameters.mSolverModifyAbsTol = NE_MODIFY_ABS_TOL_NO;
    modelParameters.mFixedStepSize = 0.01;
    modelParameters.mStartTime = 0.0;
    modelParameters.mLoadInitialState = false;
    modelParameters.mUseSimState = false;
    modelParameters.mLinTrimCompile = false;
    modelParameters.mLoggingMode = SSC_LOGGING_NONE;
    modelParameters.mRTWModifiedTimeStamp = 6.18333489E+8;
    modelParameters.mZcDisabled = true;
    tmp_2 = 0.001;
    modelParameters.mSolverTolerance = tmp_2;
    tmp_2 = 0.01;
    modelParameters.mFixedStepSize = tmp_2;
    tmp_0 = false;
    modelParameters.mVariableStepSolver = tmp_0;
    tmp_0 = false;
    modelParameters.mIsUsingODEN = tmp_0;
    modelParameters.mLoadInitialState = false;
    modelParameters.mZcDisabled = true;
    diagnosticManager = (NeuDiagnosticManager *)main_DW.STATE_1_DiagMgr;
    diagnosticTree = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
    tmp_3 = nesl_initialize_simulator((NeslSimulator *)main_DW.STATE_1_Simulator,
      &modelParameters, diagnosticManager);
    if (tmp_3 != 0) {
      tmp_0 = error_buffer_is_empty(rtmGetErrorStatus(main_M));
      if (tmp_0) {
        char *msg;
        msg = rtw_diagnostics_msg(diagnosticTree);
        rtmSetErrorStatus(main_M, msg);
      }
    }

    /* End of Start for SimscapeExecutionBlock: '<S47>/STATE_1' */

    /* Start for SimscapeExecutionBlock: '<S47>/OUTPUT_1_0' */
    tmp = nesl_lease_simulator("main/Solver Configuration_1", 1, 0);
    main_DW.OUTPUT_1_0_Simulator = (void *)tmp;
    tmp_0 = pointer_is_null(main_DW.OUTPUT_1_0_Simulator);
    if (tmp_0) {
      main_836bb176_1_gateway();
      tmp = nesl_lease_simulator("main/Solver Configuration_1", 1, 0);
      main_DW.OUTPUT_1_0_Simulator = (void *)tmp;
    }

    tmp_1 = nesl_create_simulation_data();
    main_DW.OUTPUT_1_0_SimData = (void *)tmp_1;
    diagnosticManager = rtw_create_diagnostics();
    main_DW.OUTPUT_1_0_DiagMgr = (void *)diagnosticManager;
    modelParameters_0.mSolverType = NE_SOLVER_TYPE_ODE;
    modelParameters_0.mSolverTolerance = 0.001;
    modelParameters_0.mSolverAbsTol = 0.001;
    modelParameters_0.mSolverRelTol = 0.001;
    modelParameters_0.mVariableStepSolver = false;
    modelParameters_0.mIsUsingODEN = false;
    modelParameters_0.mSolverModifyAbsTol = NE_MODIFY_ABS_TOL_NO;
    modelParameters_0.mFixedStepSize = 0.01;
    modelParameters_0.mStartTime = 0.0;
    modelParameters_0.mLoadInitialState = false;
    modelParameters_0.mUseSimState = false;
    modelParameters_0.mLinTrimCompile = false;
    modelParameters_0.mLoggingMode = SSC_LOGGING_NONE;
    modelParameters_0.mRTWModifiedTimeStamp = 6.18333489E+8;
    modelParameters_0.mZcDisabled = true;
    tmp_2 = 0.001;
    modelParameters_0.mSolverTolerance = tmp_2;
    tmp_2 = 0.01;
    modelParameters_0.mFixedStepSize = tmp_2;
    tmp_0 = false;
    modelParameters_0.mVariableStepSolver = tmp_0;
    tmp_0 = false;
    modelParameters_0.mIsUsingODEN = tmp_0;
    modelParameters_0.mLoadInitialState = false;
    modelParameters_0.mZcDisabled = true;
    diagnosticManager = (NeuDiagnosticManager *)main_DW.OUTPUT_1_0_DiagMgr;
    diagnosticTree_0 = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
    tmp_3 = nesl_initialize_simulator((NeslSimulator *)
      main_DW.OUTPUT_1_0_Simulator, &modelParameters_0, diagnosticManager);
    if (tmp_3 != 0) {
      tmp_0 = error_buffer_is_empty(rtmGetErrorStatus(main_M));
      if (tmp_0) {
        char *msg_0;
        msg_0 = rtw_diagnostics_msg(diagnosticTree_0);
        rtmSetErrorStatus(main_M, msg_0);
      }
    }

    /* End of Start for SimscapeExecutionBlock: '<S47>/OUTPUT_1_0' */

    /* Start for SimscapeExecutionBlock: '<S47>/OUTPUT_1_1' */
    tmp = nesl_lease_simulator("main/Solver Configuration_1", 1, 1);
    main_DW.OUTPUT_1_1_Simulator = (void *)tmp;
    tmp_0 = pointer_is_null(main_DW.OUTPUT_1_1_Simulator);
    if (tmp_0) {
      main_836bb176_1_gateway();
      tmp = nesl_lease_simulator("main/Solver Configuration_1", 1, 1);
      main_DW.OUTPUT_1_1_Simulator = (void *)tmp;
    }

    tmp_1 = nesl_create_simulation_data();
    main_DW.OUTPUT_1_1_SimData = (void *)tmp_1;
    diagnosticManager = rtw_create_diagnostics();
    main_DW.OUTPUT_1_1_DiagMgr = (void *)diagnosticManager;
    modelParameters_1.mSolverType = NE_SOLVER_TYPE_ODE;
    modelParameters_1.mSolverTolerance = 0.001;
    modelParameters_1.mSolverAbsTol = 0.001;
    modelParameters_1.mSolverRelTol = 0.001;
    modelParameters_1.mVariableStepSolver = false;
    modelParameters_1.mIsUsingODEN = false;
    modelParameters_1.mSolverModifyAbsTol = NE_MODIFY_ABS_TOL_NO;
    modelParameters_1.mFixedStepSize = 0.01;
    modelParameters_1.mStartTime = 0.0;
    modelParameters_1.mLoadInitialState = false;
    modelParameters_1.mUseSimState = false;
    modelParameters_1.mLinTrimCompile = false;
    modelParameters_1.mLoggingMode = SSC_LOGGING_NONE;
    modelParameters_1.mRTWModifiedTimeStamp = 6.18333489E+8;
    modelParameters_1.mZcDisabled = true;
    tmp_2 = 0.001;
    modelParameters_1.mSolverTolerance = tmp_2;
    tmp_2 = 0.01;
    modelParameters_1.mFixedStepSize = tmp_2;
    tmp_0 = false;
    modelParameters_1.mVariableStepSolver = tmp_0;
    tmp_0 = false;
    modelParameters_1.mIsUsingODEN = tmp_0;
    modelParameters_1.mLoadInitialState = false;
    modelParameters_1.mZcDisabled = true;
    diagnosticManager = (NeuDiagnosticManager *)main_DW.OUTPUT_1_1_DiagMgr;
    diagnosticTree_1 = neu_diagnostic_manager_get_initial_tree(diagnosticManager);
    tmp_3 = nesl_initialize_simulator((NeslSimulator *)
      main_DW.OUTPUT_1_1_Simulator, &modelParameters_1, diagnosticManager);
    if (tmp_3 != 0) {
      tmp_0 = error_buffer_is_empty(rtmGetErrorStatus(main_M));
      if (tmp_0) {
        char *msg_1;
        msg_1 = rtw_diagnostics_msg(diagnosticTree_1);
        rtmSetErrorStatus(main_M, msg_1);
      }
    }

    /* End of Start for SimscapeExecutionBlock: '<S47>/OUTPUT_1_1' */
  }

  /* InitializeConditions for Integrator: '<Root>/Integrator2' */
  if (rtmIsFirstInitCond(main_M)) {
    main_X.Integrator2_CSTATE[0] = 0.0;
    main_X.Integrator2_CSTATE[1] = 0.0;
    main_X.Integrator2_CSTATE[2] = 0.0;
    main_X.Integrator2_CSTATE[3] = 0.0;
    main_X.Integrator2_CSTATE[4] = 0.0;
    main_X.Integrator2_CSTATE[5] = 0.0;
  }

  main_DW.Integrator2_IWORK = 1;

  /* End of InitializeConditions for Integrator: '<Root>/Integrator2' */

  /* set "at time zero" to false */
  if (rtmIsFirstInitCond(main_M)) {
    rtmSetFirstInitCond(main_M, 0);
  }
}

/* Model terminate function */
void main_terminate(void)
{
  /* Terminate for SimscapeExecutionBlock: '<S47>/STATE_1' */
  neu_destroy_diagnostic_manager((NeuDiagnosticManager *)main_DW.STATE_1_DiagMgr);
  nesl_destroy_simulation_data((NeslSimulationData *)main_DW.STATE_1_SimData);
  nesl_erase_simulator("main/Solver Configuration_1");
  nesl_destroy_registry();

  /* Terminate for SimscapeExecutionBlock: '<S47>/OUTPUT_1_0' */
  neu_destroy_diagnostic_manager((NeuDiagnosticManager *)
    main_DW.OUTPUT_1_0_DiagMgr);
  nesl_destroy_simulation_data((NeslSimulationData *)main_DW.OUTPUT_1_0_SimData);
  nesl_erase_simulator("main/Solver Configuration_1");
  nesl_destroy_registry();

  /* Terminate for SimscapeExecutionBlock: '<S47>/OUTPUT_1_1' */
  neu_destroy_diagnostic_manager((NeuDiagnosticManager *)
    main_DW.OUTPUT_1_1_DiagMgr);
  nesl_destroy_simulation_data((NeslSimulationData *)main_DW.OUTPUT_1_1_SimData);
  nesl_erase_simulator("main/Solver Configuration_1");
  nesl_destroy_registry();
}
