/***
*stdarg.h - defines ANSI-style macros for variable argument functions
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file defines ANSI-style macros for accessing arguments
*       of functions which take a variable number of arguments.
*       [ANSI]
*
*       [Public]
*
****/

#pragma once

#ifndef _INC_STDARG
#define _INC_STDARG

#if defined(__ISense__)
#define _VA_LIST_DECLARED
#define _VA_LIST_DEFINED
typedef char *   va_list;
#define va_arg   va_list
#define va_start (void)
#define va_end   (void)
#endif

#if defined(_MSC_VER)
#if !defined(_WIN32)
#error ERROR: Only Win32 target supported!
#endif
#include <vadefs.h>
#define va_start _crt_va_start
#define va_arg   _crt_va_arg
#define va_end   _crt_va_end
#endif

#if defined(__XGNUC__)
#define _VA_LIST_DEFINED
typedef __builtin_va_list __gnuc_va_list;
typedef __gnuc_va_list    va_list;
#define va_start __builtin_va_start
#define va_arg   __builtin_va_arg
#define va_end   __builtin_va_end
#endif

#endif  /* _INC_STDARG */
