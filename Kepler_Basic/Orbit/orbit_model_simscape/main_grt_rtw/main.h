/*
 * main.h
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

#ifndef RTW_HEADER_main_h_
#define RTW_HEADER_main_h_
#ifndef main_COMMON_INCLUDES_
#define main_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#include "nesl_rtw.h"
#include "main_836bb176_1_gateway.h"
#endif                                 /* main_COMMON_INCLUDES_ */

#include "main_types.h"
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include <stddef.h>
#include <float.h>
#include <string.h>

/* Macros for accessing real-time model data structure */
#ifndef rtmGetContStateDisabled
#define rtmGetContStateDisabled(rtm)   ((rtm)->contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
#define rtmSetContStateDisabled(rtm, val) ((rtm)->contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
#define rtmGetContStates(rtm)          ((rtm)->contStates)
#endif

#ifndef rtmSetContStates
#define rtmSetContStates(rtm, val)     ((rtm)->contStates = (val))
#endif

#ifndef rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm) ((rtm)->CTOutputIncnstWithState)
#endif

#ifndef rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm, val) ((rtm)->CTOutputIncnstWithState = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
#define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
#define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetIntgData
#define rtmGetIntgData(rtm)            ((rtm)->intgData)
#endif

#ifndef rtmSetIntgData
#define rtmSetIntgData(rtm, val)       ((rtm)->intgData = (val))
#endif

#ifndef rtmGetOdeF
#define rtmGetOdeF(rtm)                ((rtm)->odeF)
#endif

#ifndef rtmSetOdeF
#define rtmSetOdeF(rtm, val)           ((rtm)->odeF = (val))
#endif

#ifndef rtmGetOdeY
#define rtmGetOdeY(rtm)                ((rtm)->odeY)
#endif

#ifndef rtmSetOdeY
#define rtmSetOdeY(rtm, val)           ((rtm)->odeY = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
#define rtmGetPeriodicContStateIndices(rtm) ((rtm)->periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
#define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
#define rtmGetPeriodicContStateRanges(rtm) ((rtm)->periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
#define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->periodicContStateRanges = (val))
#endif

#ifndef rtmGetRTWLogInfo
#define rtmGetRTWLogInfo(rtm)          ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetZCCacheNeedsReset
#define rtmGetZCCacheNeedsReset(rtm)   ((rtm)->zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
#define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetdX
#define rtmGetdX(rtm)                  ((rtm)->derivs)
#endif

#ifndef rtmSetdX
#define rtmSetdX(rtm, val)             ((rtm)->derivs = (val))
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                ((rtm)->Timing.t)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T STATE_1[13];                  /* '<S47>/STATE_1' */
  real_T OUTPUT_1_0[13];               /* '<S47>/OUTPUT_1_0' */
  real_T Gain5;                        /* '<Root>/Gain5' */
  real_T Gain4;                        /* '<Root>/Gain4' */
  real_T Gain3;                        /* '<Root>/Gain3' */
  real_T Gain[3];                      /* '<Root>/Gain' */
  real_T INPUT_1_1_1[4];               /* '<S47>/INPUT_1_1_1' */
  real_T INPUT_1_1_2[4];               /* '<S47>/INPUT_1_1_2' */
  real_T INPUT_1_1_3[4];               /* '<S47>/INPUT_1_1_3' */
  real_T Gain1[3];                     /* '<Root>/Gain1' */
  real_T INPUT_2_1_1[4];               /* '<S47>/INPUT_2_1_1' */
  real_T INPUT_2_1_2[4];               /* '<S47>/INPUT_2_1_2' */
  real_T INPUT_2_1_3[4];               /* '<S47>/INPUT_2_1_3' */
  real_T OUTPUT_1_1[6];                /* '<S47>/OUTPUT_1_1' */
  real_T Integrator2[6];               /* '<Root>/Integrator2' */
  real_T Clock1;                       /* '<Root>/Clock1' */
  real_T Gain2[3];                     /* '<Root>/Gain2' */
  real_T statvec[6];                   /* '<Root>/MATLAB Function2' */
  real_T dayf;                         /* '<Root>/Ephemerides Time1' */
  real_T diju;                         /* '<S2>/Modified Julian Date (mjd)' */
  real_T dfdt[6];                      /* '<Root>/Basic Kepler Propagator' */
} B_main_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T INPUT_1_1_1_Discrete[2];      /* '<S47>/INPUT_1_1_1' */
  real_T INPUT_1_1_2_Discrete[2];      /* '<S47>/INPUT_1_1_2' */
  real_T INPUT_1_1_3_Discrete[2];      /* '<S47>/INPUT_1_1_3' */
  real_T INPUT_2_1_1_Discrete[2];      /* '<S47>/INPUT_2_1_1' */
  real_T INPUT_2_1_2_Discrete[2];      /* '<S47>/INPUT_2_1_2' */
  real_T INPUT_2_1_3_Discrete[2];      /* '<S47>/INPUT_2_1_3' */
  real_T STATE_1_Discrete;             /* '<S47>/STATE_1' */
  real_T OUTPUT_1_0_Discrete;          /* '<S47>/OUTPUT_1_0' */
  real_T OUTPUT_1_1_Discrete;          /* '<S47>/OUTPUT_1_1' */
  void* STATE_1_Simulator;             /* '<S47>/STATE_1' */
  void* STATE_1_SimData;               /* '<S47>/STATE_1' */
  void* STATE_1_DiagMgr;               /* '<S47>/STATE_1' */
  void* STATE_1_ZcLogger;              /* '<S47>/STATE_1' */
  void* STATE_1_TsInfo;                /* '<S47>/STATE_1' */
  void* OUTPUT_1_0_Simulator;          /* '<S47>/OUTPUT_1_0' */
  void* OUTPUT_1_0_SimData;            /* '<S47>/OUTPUT_1_0' */
  void* OUTPUT_1_0_DiagMgr;            /* '<S47>/OUTPUT_1_0' */
  void* OUTPUT_1_0_ZcLogger;           /* '<S47>/OUTPUT_1_0' */
  void* OUTPUT_1_0_TsInfo;             /* '<S47>/OUTPUT_1_0' */
  void* OUTPUT_1_1_Simulator;          /* '<S47>/OUTPUT_1_1' */
  void* OUTPUT_1_1_SimData;            /* '<S47>/OUTPUT_1_1' */
  void* OUTPUT_1_1_DiagMgr;            /* '<S47>/OUTPUT_1_1' */
  void* OUTPUT_1_1_ZcLogger;           /* '<S47>/OUTPUT_1_1' */
  void* OUTPUT_1_1_TsInfo;             /* '<S47>/OUTPUT_1_1' */
  struct {
    void *LoggedData;
  } ToWorkspace_PWORK;                 /* '<Root>/To Workspace' */

  struct {
    void *LoggedData;
  } JD1_PWORK;                         /* '<Root>/JD1' */

  void* SINK_1_RtwLogger;              /* '<S47>/SINK_1' */
  void* SINK_1_RtwLogBuffer;           /* '<S47>/SINK_1' */
  void* SINK_1_RtwLogFcnManager;       /* '<S47>/SINK_1' */
  int_T STATE_1_Modes;                 /* '<S47>/STATE_1' */
  int_T OUTPUT_1_0_Modes;              /* '<S47>/OUTPUT_1_0' */
  int_T OUTPUT_1_1_Modes;              /* '<S47>/OUTPUT_1_1' */
  int_T Integrator2_IWORK;             /* '<Root>/Integrator2' */
  boolean_T STATE_1_FirstOutput;       /* '<S47>/STATE_1' */
  boolean_T OUTPUT_1_0_FirstOutput;    /* '<S47>/OUTPUT_1_0' */
  boolean_T OUTPUT_1_1_FirstOutput;    /* '<S47>/OUTPUT_1_1' */
} DW_main_T;

/* Continuous states (default storage) */
typedef struct {
  real_T mainx6_DOF_JointPxp[13];      /* '<S47>/STATE_1' */
  real_T Integrator2_CSTATE[6];        /* '<Root>/Integrator2' */
} X_main_T;

/* State derivatives (default storage) */
typedef struct {
  real_T mainx6_DOF_JointPxp[13];      /* '<S47>/STATE_1' */
  real_T Integrator2_CSTATE[6];        /* '<Root>/Integrator2' */
} XDot_main_T;

/* State disabled  */
typedef struct {
  boolean_T mainx6_DOF_JointPxp[13];   /* '<S47>/STATE_1' */
  boolean_T Integrator2_CSTATE[6];     /* '<Root>/Integrator2' */
} XDis_main_T;

#ifndef ODE4_INTG
#define ODE4_INTG

/* ODE4 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[4];                        /* derivatives */
} ODE4_IntgData;

#endif

/* Parameters (default storage) */
struct P_main_T_ {
  real_T SineWave_Amp;                 /* Expression: 1
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Bias;                /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Freq;                /* Expression: 1
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Phase;               /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T Gain5_Gain;                   /* Expression: 0
                                        * Referenced by: '<Root>/Gain5'
                                        */
  real_T SineWave1_Amp;                /* Expression: 1
                                        * Referenced by: '<Root>/Sine Wave1'
                                        */
  real_T SineWave1_Bias;               /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave1'
                                        */
  real_T SineWave1_Freq;               /* Expression: 1
                                        * Referenced by: '<Root>/Sine Wave1'
                                        */
  real_T SineWave1_Phase;              /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave1'
                                        */
  real_T Gain4_Gain;                   /* Expression: 0
                                        * Referenced by: '<Root>/Gain4'
                                        */
  real_T SineWave2_Amp;                /* Expression: 100
                                        * Referenced by: '<Root>/Sine Wave2'
                                        */
  real_T SineWave2_Bias;               /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave2'
                                        */
  real_T SineWave2_Freq;               /* Expression: 0.01
                                        * Referenced by: '<Root>/Sine Wave2'
                                        */
  real_T SineWave2_Phase;              /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave2'
                                        */
  real_T Gain3_Gain;                   /* Expression: 1
                                        * Referenced by: '<Root>/Gain3'
                                        */
  real_T Gain_Gain;                    /* Expression: 1
                                        * Referenced by: '<Root>/Gain'
                                        */
  real_T Constant1_Value[3];           /* Expression: [0 0 0.1]
                                        * Referenced by: '<Root>/Constant1'
                                        */
  real_T Gain1_Gain;                   /* Expression: 0
                                        * Referenced by: '<Root>/Gain1'
                                        */
  real_T OrbitKeplerianElements_Value[6];
           /* Expression: [(6371.8 + 550)*1000 0 70*pi/180 0*pi/180 60*pi/180 0]
            * Referenced by: '<Root>/Orbit Keplerian Elements'
            */
  real_T Gain6_Gain;                   /* Expression: 0
                                        * Referenced by: '<Root>/Gain6'
                                        */
  real_T Gain2_Gain;                   /* Expression: 0
                                        * Referenced by: '<Root>/Gain2'
                                        */
  real_T Day_Value;                    /* Expression: 25
                                        * Referenced by: '<Root>/Day'
                                        */
  real_T Month_Value;                  /* Expression: 4
                                        * Referenced by: '<Root>/Month'
                                        */
  real_T Year_Value;                   /* Expression: 2023
                                        * Referenced by: '<Root>/Year'
                                        */
  real_T constant1_Value;              /* Expression: 2433282.50000
                                        * Referenced by: '<Root>/constant1'
                                        */
  real_T Bias_Bias;                    /* Expression: 1
                                        * Referenced by: '<S2>/Bias'
                                        */
  real_T Constant_Value;               /* Expression: 1
                                        * Referenced by: '<S2>/Constant'
                                        */
  real_T Constant1_Value_o;            /* Expression: 1
                                        * Referenced by: '<S2>/Constant1'
                                        */
  real_T UTChour1_Value;               /* Expression: 0
                                        * Referenced by: '<Root>/UTC hour1'
                                        */
  real_T UTCminute1_Value;             /* Expression: 0
                                        * Referenced by: '<Root>/UTC minute1'
                                        */
  real_T UTCsecond1_Value;             /* Expression: 0
                                        * Referenced by: '<Root>/UTC second1'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_main_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;
  RTWSolverInfo solverInfo;
  X_main_T *contStates;
  int_T *periodicContStateIndices;
  real_T *periodicContStateRanges;
  real_T *derivs;
  boolean_T *contStateDisabled;
  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;
  real_T odeY[19];
  real_T odeF[4][19];
  ODE4_IntgData intgData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    boolean_T firstInitCondFlag;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block parameters (default storage) */
extern P_main_T main_P;

/* Block signals (default storage) */
extern B_main_T main_B;

/* Continuous states (default storage) */
extern X_main_T main_X;

/* Block states (default storage) */
extern DW_main_T main_DW;

/* Model entry point functions */
extern void main_initialize(void);
extern void main_step(void);
extern void main_terminate(void);

/* Real-time Model object */
extern RT_MODEL_main_T *const main_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'main'
 * '<S1>'   : 'main/Basic Kepler Propagator'
 * '<S2>'   : 'main/Ephemerides Date1'
 * '<S3>'   : 'main/Ephemerides Time1'
 * '<S4>'   : 'main/Greenwich Aparent Mean Sideral Time'
 * '<S5>'   : 'main/Impulse Force'
 * '<S6>'   : 'main/MATLAB Function2'
 * '<S7>'   : 'main/PS-Simulink Converter'
 * '<S8>'   : 'main/PS-Simulink Converter1'
 * '<S9>'   : 'main/PS-Simulink Converter10'
 * '<S10>'  : 'main/PS-Simulink Converter11'
 * '<S11>'  : 'main/PS-Simulink Converter12'
 * '<S12>'  : 'main/PS-Simulink Converter13'
 * '<S13>'  : 'main/PS-Simulink Converter14'
 * '<S14>'  : 'main/PS-Simulink Converter15'
 * '<S15>'  : 'main/PS-Simulink Converter2'
 * '<S16>'  : 'main/PS-Simulink Converter3'
 * '<S17>'  : 'main/PS-Simulink Converter4'
 * '<S18>'  : 'main/PS-Simulink Converter5'
 * '<S19>'  : 'main/PS-Simulink Converter6'
 * '<S20>'  : 'main/PS-Simulink Converter7'
 * '<S21>'  : 'main/PS-Simulink Converter8'
 * '<S22>'  : 'main/PS-Simulink Converter9'
 * '<S23>'  : 'main/Simulink-PS Converter'
 * '<S24>'  : 'main/Simulink-PS Converter1'
 * '<S25>'  : 'main/Solver Configuration'
 * '<S26>'  : 'main/Ephemerides Date1/Modified Julian Date (mjd)'
 * '<S27>'  : 'main/Ephemerides Date1/Modified Julian Date (mjd0)'
 * '<S28>'  : 'main/Ephemerides Date1/Modified Julian Date (mjd1)'
 * '<S29>'  : 'main/PS-Simulink Converter/EVAL_KEY'
 * '<S30>'  : 'main/PS-Simulink Converter1/EVAL_KEY'
 * '<S31>'  : 'main/PS-Simulink Converter10/EVAL_KEY'
 * '<S32>'  : 'main/PS-Simulink Converter11/EVAL_KEY'
 * '<S33>'  : 'main/PS-Simulink Converter12/EVAL_KEY'
 * '<S34>'  : 'main/PS-Simulink Converter13/EVAL_KEY'
 * '<S35>'  : 'main/PS-Simulink Converter14/EVAL_KEY'
 * '<S36>'  : 'main/PS-Simulink Converter15/EVAL_KEY'
 * '<S37>'  : 'main/PS-Simulink Converter2/EVAL_KEY'
 * '<S38>'  : 'main/PS-Simulink Converter3/EVAL_KEY'
 * '<S39>'  : 'main/PS-Simulink Converter4/EVAL_KEY'
 * '<S40>'  : 'main/PS-Simulink Converter5/EVAL_KEY'
 * '<S41>'  : 'main/PS-Simulink Converter6/EVAL_KEY'
 * '<S42>'  : 'main/PS-Simulink Converter7/EVAL_KEY'
 * '<S43>'  : 'main/PS-Simulink Converter8/EVAL_KEY'
 * '<S44>'  : 'main/PS-Simulink Converter9/EVAL_KEY'
 * '<S45>'  : 'main/Simulink-PS Converter/EVAL_KEY'
 * '<S46>'  : 'main/Simulink-PS Converter1/EVAL_KEY'
 * '<S47>'  : 'main/Solver Configuration/EVAL_KEY'
 */
#endif                                 /* RTW_HEADER_main_h_ */
