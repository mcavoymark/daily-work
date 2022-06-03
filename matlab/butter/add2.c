static char mc_version[] = "MATLAB Compiler 1.2 Jan 17 1998 infun";
/*
 *  MATLAB Compiler: 1.2
 *  Date: Jan 17 1998
 *  Arguments: -e add2 
 */

#ifdef __cplusplus
extern "C" {
#endif

#ifndef ARRAY_ACCESS_INLINING
#error You must use the -inline option when compiling MATLAB compiler generated code with MEX or MBUILD
#endif
#ifndef MATLAB_COMPILER_GENERATED_CODE
#define MATLAB_COMPILER_GENERATED_CODE
#endif

#include <math.h>
#include "matrix.h"
#include "mcc.h"
#include "matlab.h"

/***************** Compiler Assumptions ****************
 *
 *       mlfAdd2     	<function being defined>
 *       result      	complex vector/matrix
 *       x           	complex vector/matrix
 *******************************************************/

mxArray *
mlfAdd2(mxArray *x_rhs_)
{
   int ci_;
   int i_;
   int nlhs_=1, nrhs_=0;
   mxArray *result_lhs_;
   mlfInitFcn();
   ci_ = 0;
   if (x_rhs_)
   {
      ++nrhs_;
      ci_ = ci_ || mccPI(x_rhs_);
   }
   if (ci_)
   {
      mxArray result;
      mxArray x;
      
      mccComplexInit(x);
      mccImport(&x, x_rhs_, 0, 0);
      mccComplexInit(result);
      
      /* result = x + 2 */
      if(mccNOTSET(&x))
      {
         mexErrMsgTxt( "variable x undefined, line 2" );
      }
      {
         int i_, j_;
         int m_=1, n_=1, cx_ = 0;
         double *p_result;
         int I_result=1;
         double *q_result;
         double *p_x;
         int I_x=1;
         double *q_x;
         m_ = mcmCalcResultSize(m_, &n_, mccM(&x), mccN(&x));
         mccAllocateMatrix(&result, m_, n_);
         I_result = (mccM(&result) != 1 || mccN(&result) != 1);
         p_result = mccPR(&result);
         q_result = mccPI(&result);
         I_x = (mccM(&x) != 1 || mccN(&x) != 1);
         p_x = mccPR(&x);
         q_x = mccPI(&x);
         if (m_ != 0)
         {
            for (j_=0; j_<n_; ++j_)
            {
               for (i_=0; i_<m_; ++i_, p_result+=I_result, q_result+=I_result, p_x+=I_x, q_x+=I_x)
               {
                  *p_result = (*p_x + 2);
                  *q_result = (*q_x + 0.);
               }
            }
         }
      }
      mccPrint (&result, "result");
      mccReturnFirstValue(&result_lhs_, &result);
      mlfCleanupOutputArray( result_lhs_ );
      mccFreeMatrix(&result);
      mccFreeMatrix(&x);
      mlfCleanupFcn();
      return(result_lhs_);
   }
   else
   {
/***************** Compiler Assumptions ****************
 *
 *       mlfAdd2     	<function being defined>
 *       result      	real vector/matrix
 *       x           	real vector/matrix
 *******************************************************/
      mxArray result;
      mxArray x;
      
      mccRealInit(x);
      mccImport(&x, x_rhs_, 0, 0);
      mccRealInit(result);
      
      /* result = x + 2 */
      if(mccNOTSET(&x))
      {
         mexErrMsgTxt( "variable x undefined, line 2" );
      }
      {
         int i_, j_;
         int m_=1, n_=1, cx_ = 0;
         double *p_result;
         int I_result=1;
         double *p_x;
         int I_x=1;
         m_ = mcmCalcResultSize(m_, &n_, mccM(&x), mccN(&x));
         mccAllocateMatrix(&result, m_, n_);
         I_result = (mccM(&result) != 1 || mccN(&result) != 1);
         p_result = mccPR(&result);
         I_x = (mccM(&x) != 1 || mccN(&x) != 1);
         p_x = mccPR(&x);
         if (m_ != 0)
         {
            for (j_=0; j_<n_; ++j_)
            {
               for (i_=0; i_<m_; ++i_, p_result+=I_result, p_x+=I_x)
               {
                  *p_result = (*p_x + 2);
               }
            }
         }
      }
      mccPrint (&result, "result");
      mccReturnFirstValue(&result_lhs_, &result);
      mlfCleanupOutputArray( result_lhs_ );
      mccFreeMatrix(&result);
      mccFreeMatrix(&x);
      mlfCleanupFcn();
      return(result_lhs_);
   }
}

#ifdef __cplusplus
}
#endif

