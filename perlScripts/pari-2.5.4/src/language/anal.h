/* $Id$

Copyright (C) 2000  The PARI group.

This file is part of the PARI/GP package.

PARI/GP is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation. It is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY WHATSOEVER.

Check the License for details. You should have received a copy of it, along
with the package; see the file 'COPYING'. If not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA. */

/*************************************************************************/
/*                                                                       */
/*                 Declarations specific to the analyzer                 */
/*                                                                       */
/*************************************************************************/
BEGINEXTERN
/* GP control structures */
#define EXPR_WRAP(code, call) \
{ GEN z; GEN __E = code; \
  push_lex(gen_0, __E); z = call; pop_lex(1); return z; }
#define EXPR_ARG __E, &gp_eval

/* to manipulate 'blocs' */
#define BL_HEAD 4
#define bl_base(x) (void*)((x) - BL_HEAD)
#define bl_refc(x) (((GEN)x)[-4])
#define bl_next(x) (((GEN*)x)[-3])
#define bl_prev(x) (((GEN*)x)[-2])
#define bl_num(x)  (((GEN)x)[-1])

/* functions */
void   changevalue(entree *ep, GEN val);
void    freeep(entree *ep);
void   pari_fill_hashtable(entree **table, entree *ep);

void compile_err(const char *msg, const char *str);
void compile_varerr(const char *str);

extern void *foreignHandler;
extern GEN  (*foreignExprHandler)(char*);
extern char foreignExprSwitch;
extern entree * (*foreignAutoload)(const char*, long len);
extern void (*foreignFuncFree)(entree *);

#ifdef STACK_CHECK
extern THREAD void *PARI_stack_limit;
#endif

extern entree  **varentries;

struct node_loc
{
  const char *start,*end;
};

union token_value {
  int val;
  GEN gen;
};

int pari_lex(union token_value *yylval, struct node_loc *yylloc, char **lex);
int pari_parse(char **lex);
entree* fetch_entry(const char *s, long len);
entree* fetch_member(const char *s, long len);
void pari_close_parser(void);
void pari_close_compiler(void);
void pari_close_evaluator(void);
void pari_init_parser(void);
void pari_init_compiler(void);
void pari_init_evaluator(void);
void optimizenode(long n);
void push_frame(GEN C, long lpc);
const char * closure_func_err(void);
GEN  gp_closure(long n);
long eval_mnemonic(GEN str, const char *tmplate);

ENDEXTERN
