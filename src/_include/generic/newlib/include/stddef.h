
#pragma once

#ifndef _INC_STDDEF
#define _INC_STDDEF

#if !defined(__cplusplus)
typedef unsigned short wchar_t;
#endif
typedef unsigned short wint_t;
typedef unsigned int size_t;
typedef int ptrdiff_t;

#if !defined(__INTPTR_TYPE__)
#define __INTPTR_TYPE__ long
#define __INT8_TYPE__ signed char
#define __UINT8_TYPE__ unsigned char
#define __INT16_TYPE__ short
#define __UINT16_TYPE__ unsigned short
#define __INT32_TYPE__ long
#define __UINT32_TYPE__ unsigned long
#endif

#if defined(_MSC_VER)
#define __INT64_TYPE__ __int64
#define __UINT64_TYPE__ unsigned __int64
#endif

#if defined(__GNUC_)
#define __INT64_TYPE__ long long
#define __UINT64_TYPE__ unsigned long long
#endif

#ifndef NULL
#ifdef __cplusplus
#define NULL    0
#else
#define NULL    ((void *)0)
#endif
#endif

#define __extension__
#define __inline__ __inline

#endif
