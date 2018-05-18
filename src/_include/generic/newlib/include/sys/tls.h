
#ifndef _INC_TLS_H
#define _INC_TLS_H

#if defined(__GNUC__)
# if defined(__ISense__)
#  define _tls_level    1
#  define _tls_decl     __declspec(thread)
#  define _tls_sp_imp() r = 0
#  define _tls_inline   __inline
# else
#  if defined(__linux__) || defined(_M_LINUX)
#    if defined(_M_X86)
#     define _tls_level    1
#     define _tls_decl     __thread
#     define _tls_sp_imp() __asm volatile ("mov %%esp, %0\n\t" : "=g"(r))
#     define _tls_inline   extern __inline __attribute__ ((always_inline))
#    else
#     define _tls_level    0
#     define _tls_decl     __thread
#     define _tls_sp_imp() __asm volatile ("mov %0, r13\n\t" : "=r"(r))
#     define _tls_inline   __inline __attribute__ ((always_inline))
#     endif
#  else
#    define _tls_level   2
#    define _tls_decl    
#   endif
#  endif
# endif

#if defined(_MSC_VER) && !defined(__GNUC__)
# define _tls_level 2
# define _tls_decl  __declspec(thread)
# endif

#if _tls_level < 2

typedef struct _tag_tls_data
{
	unsigned int  magic1;
	int           pid;
	void *        impure;
	void *        thread;
	void *	      exec;
	unsigned long addr1;
	unsigned long data1;
	unsigned long addr2;
	unsigned long data2;
	unsigned int  magic2;
	} _tls_data;

# define _tls_stack_size  0x10000
# define _tls_get_data() ((_tls_data *) (_tls_sp() & ~(_tls_stack_size-1)))
# define _tls_magic       'DSLT'

_tls_inline int _tls_sp(void)
{
int r;
_tls_sp_imp();
return r;
}

extern int _tls_valid;

#endif

#endif
