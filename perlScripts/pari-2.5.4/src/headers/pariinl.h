/* $Id$

Copyright (C) 2000-2010  The PARI group.

This file is part of the PARI/GP package.

PARI/GP is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation. It is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY WHATSOEVER.

Check the License for details. You should have received a copy of it, along
with the package; see the file 'COPYING'. If not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA. */

/*******************************************************************/
/*                                                                 */
/*                          CONSTRUCTORS                           */
/*                                                                 */
/*******************************************************************/
INLINE GEN
mkintmod(GEN x, GEN y) { GEN v = cgetg(3, t_INTMOD);
  gel(v,1) = y; gel(v,2) = x; return v; }
INLINE GEN
mkintmodu(ulong x, ulong y) {
  GEN v = cgetg(3,t_INTMOD);
  gel(v,1) = utoipos(y);
  gel(v,2) = utoi(x); return v;
}
INLINE GEN
mkpolmod(GEN x, GEN y) { GEN v = cgetg(3, t_POLMOD);
  gel(v,1) = y; gel(v,2) = x; return v; }
INLINE GEN
mkfrac(GEN x, GEN y) { GEN v = cgetg(3, t_FRAC);
  gel(v,1) = x; gel(v,2) = y; return v; }
INLINE GEN
mkfraccopy(GEN x, GEN y) { GEN v = cgetg(3, t_FRAC);
  gel(v,1) = icopy(x); gel(v,2) = icopy(y); return v; }
INLINE GEN
mkrfrac(GEN x, GEN y) { GEN v = cgetg(3, t_RFRAC);
  gel(v,1) = x; gel(v,2) = y; return v; }
INLINE GEN
mkcomplex(GEN x, GEN y) { GEN v = cgetg(3, t_COMPLEX);
  gel(v,1) = x; gel(v,2) = y; return v; }
INLINE GEN
gen_I(void) { return mkcomplex(gen_0, gen_1); }
INLINE GEN
cgetc(long l)
{
  GEN u = cgetg(3,t_COMPLEX);
  gel(u,1) = cgetr(l); gel(u,2) = cgetr(l); return u;
}
INLINE GEN
mkquad(GEN n, GEN x, GEN y) { GEN v = cgetg(4, t_QUAD);
  gel(v,1) = n; gel(v,2) = x; gel(v,3) = y; return v; }
/* vecsmall */
INLINE GEN
mkvecsmall(long x) { GEN v = cgetg(2, t_VECSMALL); v[1] = x; return v; }
INLINE GEN
mkvecsmall2(long x,long y) { GEN v = cgetg(3, t_VECSMALL);
  v[1]=x; v[2]=y; return v; }
INLINE GEN
mkvecsmall3(long x,long y,long z) { GEN v = cgetg(4, t_VECSMALL);
  v[1]=x; v[2]=y; v[3]=z; return v; }
INLINE GEN
mkvecsmall4(long x,long y,long z,long t) { GEN v = cgetg(5, t_VECSMALL);
  v[1]=x; v[2]=y; v[3]=z; v[4]=t; return v; }
/* vec */
INLINE GEN
mkvec(GEN x) { GEN v = cgetg(2, t_VEC); gel(v,1) = x; return v; }
INLINE GEN
mkvec2(GEN x, GEN y) {
  GEN v = cgetg(3,t_VEC); gel(v,1) = x; gel(v,2) = y; return v; }
INLINE GEN
mkvec3(GEN x, GEN y, GEN z) {
  GEN v=cgetg(4,t_VEC); gel(v,1) = x; gel(v,2) = y; gel(v,3) = z; return v; }
INLINE GEN
mkvec4(GEN x, GEN y, GEN z, GEN t) {
  GEN v=cgetg(5,t_VEC); gel(v,1) = x; gel(v,2) = y; gel(v,3) = z; gel(v,4) = t;
  return v; }
INLINE GEN
mkvec5(GEN x, GEN y, GEN z, GEN t, GEN u) {
  GEN v=cgetg(6,t_VEC); gel(v,1) = x; gel(v,2) = y; gel(v,3) = z;
  gel(v,4) = t; gel(v,5) = u; return v; }
INLINE GEN
mkvecs(long x) { GEN v = cgetg(2, t_VEC); gel(v,1) = stoi(x); return v; }
INLINE GEN
mkvec2s(long x, long y) {
  GEN v = cgetg(3,t_VEC); gel(v,1) = stoi(x); gel(v,2) = stoi(y); return v; }
INLINE GEN
mkvec3s(long x, long y, long z) {
  GEN v=cgetg(4,t_VEC);
  gel(v,1)=stoi(x); gel(v,2)=stoi(y); gel(v,3)=stoi(z); return v;
}
INLINE GEN
mkveccopy(GEN x) { GEN v = cgetg(2, t_VEC); gel(v,1) = gcopy(x); return v; }
INLINE GEN
mkvec2copy(GEN x, GEN y) {
  GEN v = cgetg(3,t_VEC); gel(v,1) = gcopy(x); gel(v,2) = gcopy(y); return v; }
/* col */
INLINE GEN
mkcol(GEN x) { GEN v = cgetg(2, t_COL); gel(v,1) = x; return v; }
INLINE GEN
mkcol2(GEN x, GEN y) {
  GEN v = cgetg(3,t_COL); gel(v,1) = x; gel(v,2) = y; return v; }
INLINE GEN
mkcolcopy(GEN x) { GEN v = cgetg(2, t_COL); gel(v,1) = gcopy(x); return v; }
/* mat */
INLINE GEN
mkmat(GEN x) { GEN v = cgetg(2, t_MAT); gel(v,1) = x; return v; }
INLINE GEN
mkmat2(GEN x, GEN y) { GEN v=cgetg(3,t_MAT); gel(v,1)=x; gel(v,2)=y; return v; }
INLINE GEN
mkmatcopy(GEN x) { GEN v = cgetg(2, t_MAT); gel(v,1) = gcopy(x); return v; }
/* pol */
INLINE GEN
pol_x(long v) {
  GEN p = cgetg(4, t_POL);
  p[1] = evalsigne(1)|evalvarn(v);
  gel(p,2) = gen_0;
  gel(p,3) = gen_1; return p;
}
INLINE GEN
pol_1(long v) {
  GEN p = cgetg(3, t_POL);
  p[1] = evalsigne(1)|evalvarn(v);
  gel(p,2) = gen_1; return p;
}
INLINE GEN
pol_0(long v)
{
  GEN x = cgetg(2,t_POL);
  x[1] = evalvarn(v); return x;
}
INLINE GEN
const_vec(long n, GEN x)
{
  GEN v = cgetg(n+1, t_VEC);
  long i;
  for (i = 1; i <= n; i++) gel(v,i) = x;
  return v;
}
INLINE GEN
const_col(long n, GEN x)
{
  GEN v = cgetg(n+1, t_COL);
  long i;
  for (i = 1; i <= n; i++) gel(v,i) = x;
  return v;
}
INLINE GEN
const_vecsmall(long n, long c)
{
  long i;
  GEN V = cgetg(n+1,t_VECSMALL);
  for(i=1;i<=n;i++) V[i] = c;
  return V;
}

/***   ZERO   ***/
/* O(p^e) */
INLINE GEN
zeropadic(GEN p, long e)
{
  GEN y = cgetg(5,t_PADIC);
  gel(y,4) = gen_0;
  gel(y,3) = gen_1;
  gel(y,2) = icopy(p);
  y[1] = evalvalp(e) | evalprecp(0);
  return y;
}
/* O(pol_x(v)^e) */
INLINE GEN
zeroser(long v, long e)
{
  GEN x = cgetg(2, t_SER);
  x[1] = evalvalp(e) | evalvarn(v); return x;
}
/* 0 * pol_x(v) */
INLINE GEN
zeropol(long v) { return pol_0(v); }
/* vector(n) */
INLINE GEN
zerocol(long n)
{
  GEN y = cgetg(n+1,t_COL);
  long i; for (i=1; i<=n; i++) gel(y,i) = gen_0;
  return y;
}
/* vectorv(n) */
INLINE GEN
zerovec(long n)
{
  GEN y = cgetg(n+1,t_VEC);
  long i; for (i=1; i<=n; i++) gel(y,i) = gen_0;
  return y;
}
/* matrix(m, n) */
INLINE GEN
zeromat(long m, long n)
{
  GEN y = cgetg(n+1,t_MAT);
  GEN v = zerocol(m);
  long i; for (i=1; i<=n; i++) gel(y,i) = v;
  return y;
}
/* = zero_zx, sv is a evalvarn()*/
INLINE GEN
zero_Flx(long sv) { return pol0_Flx(sv); }
INLINE GEN
zero_Flv(long n)
{
  GEN y = cgetg(n+1,t_VECSMALL);
  long i; for (i=1; i<=n; i++) y[i] = 0;
  return y;
}
/* matrix(m, n) */
INLINE GEN
zero_Flm(long m, long n)
{
  GEN y = cgetg(n+1,t_MAT);
  GEN v = zero_Flv(m);
  long i; for (i=1; i<=n; i++) gel(y,i) = v;
  return y;
}
/* matrix(m, n) */
INLINE GEN
zero_Flm_copy(long m, long n)
{
  GEN y = cgetg(n+1,t_MAT);
  long i; for (i=1; i<=n; i++) gel(y,i) = zero_Flv(m);
  return y;
}

INLINE GEN
zero_F2v(long m)
{
  long l = nbits2nlong(m);
  GEN v  = const_vecsmall(l+1, 0);
  v[1] = m;
  return v;
}

INLINE GEN
zero_F2m(long m, long n)
{
  long i;
  GEN M = cgetg(n+1, t_MAT);
  GEN v = zero_F2v(m);
  for (i = 1; i <= n; i++)
    gel(M,i) = v;
  return M;
}


INLINE GEN
zero_F2m_copy(long m, long n)
{
  long i;
  GEN M = cgetg(n+1, t_MAT);
  for (i = 1; i <= n; i++)
    gel(M,i)= zero_F2v(m);
  return M;
}

/* matrix(m, n) */
INLINE GEN
zeromatcopy(long m, long n)
{
  GEN y = cgetg(n+1,t_MAT);
  long i; for (i=1; i<=n; i++) gel(y,i) = zerocol(m);
  return y;
}

/* i-th vector in the standard basis */
INLINE GEN
col_ei(long n, long i) { GEN e = zerocol(n); gel(e,i) = gen_1; return e; }
INLINE GEN
vec_ei(long n, long i) { GEN e = zerovec(n); gel(e,i) = gen_1; return e; }
INLINE GEN
vecsmall_ei(long n, long i) { GEN e = const_vecsmall(n,0); e[i] = 1; return e; }
INLINE GEN
Rg_col_ei(GEN x, long n, long i) { GEN e = zerocol(n); gel(e,i) = x; return e; }

INLINE GEN
shallowcopy(GEN x)
{ return typ(x) == t_MAT ? RgM_shallowcopy(x): leafcopy(x); }

/* routines for naive growarrays */
INLINE GEN
vectrunc_init(long l)
{
  GEN z = new_chunk(l);
  z[0] = evaltyp(t_VEC) | _evallg(1); return z;
}
INLINE void
vectrunc_append(GEN x, GEN t)
{ long l = lg(x); gel(x,l) = t; setlg(x, l+1); }
INLINE GEN
vecsmalltrunc_init(long l)
{
  GEN z = new_chunk(l);
  z[0] = evaltyp(t_VECSMALL) | _evallg(1); return z;
}
INLINE void
vecsmalltrunc_append(GEN x, long t)
{ long l = lg(x); x[l] = t; setlg(x, l+1); }

/*******************************************************************/
/*                                                                 */
/*                        VEC / COL / VECSMALL                     */
/*                                                                 */
/*******************************************************************/
/* shallow*/
INLINE GEN
vec_shorten(GEN v, long n)
{
  long i;
  GEN V = cgetg(n+1,t_VEC);
  for(i=1;i<=n;i++) V[i] = v[i];
  return V;
}
/* shallow*/
INLINE GEN
vec_lengthen(GEN v, long n)
{
  long i;
  long l=lg(v);
  GEN V = cgetg(n+1,t_VEC);
  for(i=1;i<l;i++) V[i] = v[i];
  return V;
}
/* shallow*/
INLINE GEN
vec_setconst(GEN v, GEN x)
{
  long i, l = lg(v);
  for (i = 1; i < l; i++) gel(v,i) = x;
  return v;
}
INLINE GEN
vecsmall_shorten(GEN v, long n)
{
  long i;
  GEN V = cgetg(n+1,t_VECSMALL);
  for(i=1;i<=n;i++) V[i] = v[i];
  return V;
}
INLINE GEN
vecsmall_lengthen(GEN v, long n)
{
  long i, l = lg(v);
  GEN V = cgetg(n+1,t_VECSMALL);
  for(i=1;i<l;i++) V[i] = v[i];
  return V;
}

INLINE GEN
vec_to_vecsmall(GEN z)
{
  long i, l = lg(z);
  GEN x = cgetg(l, t_VECSMALL);
  for (i=1; i<l; i++) x[i] = itos(gel(z,i));
  return x;
}
INLINE GEN
vecsmall_to_vec(GEN z)
{
  long i, l = lg(z);
  GEN x = cgetg(l,t_VEC);
  for (i=1; i<l; i++) gel(x,i) = stoi(z[i]);
  return x;
}
INLINE GEN
vecsmall_to_col(GEN z)
{
  long i, l = lg(z);
  GEN x = cgetg(l,t_COL);
  for (i=1; i<l; i++) gel(x,i) = stoi(z[i]);
  return x;
}

INLINE int
vecsmall_lexcmp(GEN x, GEN y)
{
  long lx,ly,l,i;
  lx = lg(x);
  ly = lg(y); l = minss(lx,ly);
  for (i=1; i<l; i++)
    if (x[i] != y[i]) return x[i]<y[i]? -1: 1;
  if (lx == ly) return 0;
  return (lx < ly)? -1 : 1;
}

INLINE int
vecsmall_prefixcmp(GEN x, GEN y)
{
  long i, lx = lg(x), ly = lg(y), l = minss(lx,ly);
  for (i=1; i<l; i++)
    if (x[i] != y[i]) return x[i]<y[i]? -1: 1;
  return 0;
}

/*Can be used on t_VEC, but coeffs not gcopy-ed*/
INLINE GEN
vecsmall_prepend(GEN V, long s)
{
  long i, l2 = lg(V);
  GEN res = cgetg(l2+1, typ(V));
  res[1] = s;
  for (i = 2; i <= l2; ++i) res[i] = V[i - 1];
  return res;
}

/*Can be used on t_VEC, but coeffs not gcopy-ed*/
INLINE GEN
vecsmall_append(GEN V, long s)
{
  long i, l2 = lg(V);
  GEN res = cgetg(l2+1, typ(V));
  for (i = 1; i < l2; ++i) res[i] = V[i];
  res[l2] = s; return res;
}

INLINE GEN
vecsmall_concat(GEN u, GEN v)
{
  long i, l1 = lg(u)-1, l2 = lg(v)-1;
  GEN res = cgetg(l1+l2+1, t_VECSMALL);
  for (i = 1; i <= l1; ++i) res[i]    = u[i];
  for (i = 1; i <= l2; ++i) res[i+l1] = v[i];
  return res;
}

/* return the number of indices where u and v are equal */
INLINE long
vecsmall_coincidence(GEN u, GEN v)
{
  long i, s = 0, l = minss(lg(u),lg(v));
  for(i=1; i<l; i++)
    if(u[i] == v[i]) s++;
  return s;
}

/* returns the first index i<=n such that x=v[i] if it exists, 0 otherwise */
INLINE long
vecsmall_isin(GEN v, long x)
{
  long i, l = lg(v);
  for (i = 1; i < l; i++)
    if (v[i] == x) return i;
  return 0;
}

INLINE long
vecsmall_pack(GEN V, long base, long mod)
{
  long i, s = 0;
  for(i=1; i<lg(V); i++) s = (base*s + V[i]) % mod;
  return s;
}

INLINE long
vecsmall_max(GEN x)
{
  long i, t = x[1], lx = lg(x);
  for (i=2; i<lx; i++)
    if (x[i] > t) t = x[i];
  return t;
}

INLINE long
vecsmall_min(GEN x)
{
  long i, t = x[1], lx =lg(x);
  for (i=2; i<lx; i++)
    if (x[i] < t) t = x[i];
  return t;
}

INLINE int
ZV_isscalar(GEN x)
{
  long l = lg(x);
  while (--l > 1)
    if (signe(gel(x, l))) return 0;
  return 1;
}
INLINE int
QV_isscalar(GEN x)
{
  long lx = lg(x),i;
  for (i=2; i<lx; i++)
    if (!isintzero(gel(x, i))) return 0;
  return 1;
}
INLINE int
RgV_isscalar(GEN x)
{
  long lx = lg(x),i;
  for (i=2; i<lx; i++)
    if (!gequal0(gel(x, i))) return 0;
  return 1;
}
INLINE int
RgX_isscalar(GEN x)
{
  long i;
  for (i=lg(x)-1; i>2; i--)
    if (!gequal0(gel(x, i))) return 0;
  return 1;
}

INLINE int
RgX_is_rational(GEN x)
{
  long i;
  for (i = lg(x)-1; i > 1; i--)
    if (!is_rational_t(typ(gel(x,i)))) return 0;
  return 1;
}
INLINE int
RgX_is_ZX(GEN x)
{
  long i;
  for (i = lg(x)-1; i > 1; i--)
    if (typ(gel(x,i)) != t_INT) return 0;
  return 1;
}
INLINE int
RgX_is_monomial(GEN x)
{
  long i;
  if (!signe(x)) return 0;
  for (i=lg(x)-2; i>1; i--)
    if (!isexactzero(gel(x,i))) return 0;
  return 1;
}
INLINE int
RgM_is_ZM(GEN x)
{
  long i, j, h, l = lg(x);
  if (l == 1) return 1;
  h = lg(gel(x,1));
  for (j = l-1; j > 0; j--)
    for (i = h-1; i > 0; i--)
      if (typ(gcoeff(x,i,j)) != t_INT) return 0;
  return 1;
}

/********************************************************************/
/**                                                                **/
/**            Dynamic arrays implementation                       **/
/**                                                                **/
/********************************************************************/
INLINE void **
stack_base(pari_stack *s) { return (void **) ((ulong)s + (ulong)s->offset); }

INLINE void
stack_init(pari_stack *s, size_t size, void **data)
{
  s->offset = (ulong)data-(ulong)s;
  *data = NULL;
  s->n = 0;
  s->alloc = 0;
  s->size = size;
}

INLINE void
stack_alloc(pari_stack *s, long nb)
{
  void **sdat = stack_base(s);
  if (s->n+nb <= s->alloc) return;
  if (!s->alloc)
    s->alloc = nb;
  else
  {
    while (s->n+nb > s->alloc) s->alloc <<= 1;
  }
  *sdat = pari_realloc(*sdat,s->alloc*s->size);
}

INLINE long
stack_new(pari_stack *s) { stack_alloc(s, 1); return s->n++; }

INLINE void
stack_delete(pari_stack *s)
{
  void **sdat = stack_base(s);
  if (*sdat) free(*sdat);
}

INLINE void
stack_pushp(pari_stack *s, void *u)
{
  long n = stack_new(s);
  void **sdat =(void**) *stack_base(s);
  sdat[n] = u;
}

/*******************************************************************/
/*                                                                 */
/*                            EXTRACT                              */
/*                                                                 */
/*******************************************************************/
INLINE GEN
vecslice(GEN A, long y1, long y2)
{
  long i,lB = y2 - y1 + 2;
  GEN B = cgetg(lB, typ(A));
  for (i=1; i<lB; i++) B[i] = A[y1-1+i];
  return B;
}
INLINE GEN
vecslicepermute(GEN A, GEN p, long y1, long y2)
{
  long i,lB = y2 - y1 + 2;
  GEN B = cgetg(lB, typ(A));
  for (i=1; i<lB; i++) B[i] = A[p[y1-1+i]];
  return B;
}
/* rowslice(rowpermute(A,p), x1, x2) */
INLINE GEN
rowslicepermute(GEN A, GEN p, long x1, long x2)
{
  long i, lB = lg(A);
  GEN B = cgetg(lB, typ(A));
  for (i=1; i<lB; i++) gel(B,i) = vecslicepermute(gel(A,i),p,x1,x2);
  return B;
}
INLINE GEN
rowslice(GEN A, long x1, long x2)
{
  long i, lB = lg(A);
  GEN B = cgetg(lB, typ(A));
  for (i=1; i<lB; i++) gel(B,i) = vecslice(gel(A,i),x1,x2);
  return B;
}

/* shallow, remove coeff of index j */
INLINE GEN
vecsplice(GEN a, long j)
{
  long i, k, l = lg(a);
  GEN b;
  if (l == 1) pari_err(talker, "incorrect component in vecsplice");
  b = cgetg(l-1, typ(a));
  for (i = k = 1; i < l; i++)
    if (i != j) gel(b, k++) = gel(a,i);
  return b;
}
/* shallow */
INLINE GEN
RgM_minor(GEN a, long i, long j)
{
  GEN b = vecsplice(a, j);
  long k, l = lg(b);
  for (k = 1; k < l; k++) gel(b,k) = vecsplice(gel(b,k), i);
  return b;
}

/* A[x0,] */
INLINE GEN
row(GEN A, long x0)
{
  long i, lB = lg(A);
  GEN B  = cgetg(lB, t_VEC);
  for (i=1; i<lB; i++) gel(B, i) = gcoeff(A, x0, i);
  return B;
}
INLINE GEN
row_Flm(GEN A, long x0)
{
  long i, lB = lg(A);
  GEN B  = cgetg(lB, t_VECSMALL);
  for (i=1; i<lB; i++) B[i] = coeff(A, x0, i);
  return B;
}
/* A[x0,] */
INLINE GEN
rowcopy(GEN A, long x0)
{
  long i, lB = lg(A);
  GEN B  = cgetg(lB, t_VEC);
  for (i=1; i<lB; i++) gel(B, i) = gcopy(gcoeff(A, x0, i));
  return B;
}
/* A[x0, x1..x2] */
INLINE GEN
row_i(GEN A, long x0, long x1, long x2)
{
  long i, lB = x2 - x1 + 2;
  GEN B  = cgetg(lB, t_VEC);
  for (i=x1; i<=x2; i++) gel(B, i) = gcoeff(A, x0, i);
  return B;
}

INLINE GEN
vecreverse(GEN A)
{
  long i,l = lg(A);
  GEN B = cgetg(l, typ(A));
  for (i=1; i<l; i++) gel(B, i) = gel(A, l-i);
  return B;
}

INLINE GEN
vecpermute(GEN A, GEN p)
{
  long i,lB = lg(p);
  GEN B = cgetg(lB, typ(A));
  for (i=1; i<lB; i++) gel(B, i) = gel(A, p[i]);
  return B;
}
INLINE GEN
rowpermute(GEN A, GEN p)
{
  long i, lB = lg(A);
  GEN B = cgetg(lB, typ(A));
  for (i=1; i<lB; i++) gel(B, i) = vecpermute(gel(A, i), p);
  return B;
}
INLINE void
vecselect_p(GEN A, GEN B, GEN p, long init, long lB)
{
  long i; setlg(B, lB);
  for (i=init; i<lB; i++) B[i] = A[p[i]];
}
/* B := p . A = row selection according to permutation p. Treat only lower
 * right corner init x init */
INLINE void
rowselect_p(GEN A, GEN B, GEN p, long init)
{
  long i, lB = lg(A), lp = lg(p);
  for (i=1; i<init; i++) setlg(B[i],lp);
  for (   ; i<lB;   i++) vecselect_p(gel(A,i),gel(B,i),p,init,lp);
}
/*******************************************************************/
/*                                                                 */
/*                          PERMUTATIONS                           */
/*                                                                 */
/*******************************************************************/
/* identity permutation */
INLINE GEN
identity_perm(long n)
{
  GEN perm = cgetg(n+1, t_VECSMALL);
  long i;
  for (i = 1; i <= n; i++) perm[i] = i;
  return perm;
}

/* assume d <= n */
INLINE GEN
cyclic_perm(long n, long d)
{
  GEN perm = cgetg(n+1, t_VECSMALL);
  long i;
  for (i = 1; i <= n-d; i++) perm[i] = i+d;
  for (     ; i <= n;   i++) perm[i] = i-n+d;
  return perm;
}

/* Multiply (compose) two permutations */
INLINE GEN
perm_mul(GEN s, GEN t)
{
  GEN u;
  long i, l = lg(t);
  u = cgetg(l, t_VECSMALL);
  for (i = 1; i < l; i++) u[i] = s[ t[i] ];
  return u;
}
/* Compute the inverse (reciprocal) of a permutation. */
INLINE GEN
perm_inv(GEN x)
{
  long i, lx;
  GEN y = cgetg_copy(x, &lx);
  for (i=1; i<lx; i++) y[ x[i] ] = i;
  return y;
}
/* Return s*t*s^-1 */
INLINE GEN
perm_conj(GEN s, GEN t)
{
  long i, l;
  GEN v = cgetg_copy(s, &l);
  for (i = 1; i < l; i++) v[ s[i] ] = s[ t[i] ];
  return v;
}

/*********************************************************************/
/*                       MALLOC/FREE WRAPPERS                        */
/*********************************************************************/
#define BLOCK_SIGINT_START           \
{                                    \
  int block=PARI_SIGINT_block;       \
  PARI_SIGINT_block = 1;

#define BLOCK_SIGINT_END             \
  PARI_SIGINT_block = block;         \
  if (!block && PARI_SIGINT_pending) \
  {                                  \
    int sig = PARI_SIGINT_pending;   \
    PARI_SIGINT_pending = 0;         \
    raise(sig);                      \
  }                                  \
}

INLINE void
pari_free(void *pointer)
{
  BLOCK_SIGINT_START;
  free(pointer);
  BLOCK_SIGINT_END;
}
INLINE void*
pari_malloc(size_t size)
{
  if (size)
  {
    char *tmp;
    BLOCK_SIGINT_START;
    tmp = (char*)malloc(size);
    BLOCK_SIGINT_END;
    if (!tmp) pari_err(memer);
    return tmp;
  }
  if (DEBUGMEM) pari_warn(warner,"mallocing NULL object");
  return NULL;
}
INLINE void*
pari_realloc(void *pointer, size_t size)
{
  char *tmp;

  BLOCK_SIGINT_START;
  if (!pointer) tmp = (char *) malloc(size);
  else tmp = (char *) realloc(pointer,size);
  BLOCK_SIGINT_END;
  if (!tmp) pari_err(memer);
  return tmp;
}
INLINE void*
pari_calloc(size_t size)
{
  void *t = pari_malloc(size);
  memset(t, 0, size); return t;
}
INLINE GEN
cgetalloc(long t, size_t l)
{
  GEN x = (GEN)pari_malloc(l * sizeof(long));
  x[0] = evaltyp(t) | evallg(l); return x;
}

/*******************************************************************/
/*                                                                 */
/*                       GARBAGE COLLECTION                        */
/*                                                                 */
/*******************************************************************/
/* copy integer x as if we had avma = av */
INLINE GEN
icopy_avma(GEN x, pari_sp av)
{
  long lx = lgefint(x), lq = lx;
  GEN q = ((GEN)av) - lx;
  while (--lx > 0) q[lx] = x[lx];
  q[0] = evaltyp(t_INT)|evallg(lq);
  return q;
}
INLINE GEN
gerepileuptoleaf(pari_sp av, GEN x)
{
  long lx;
  GEN q;

  if (!isonstack(x) || (GEN)av<=x) { avma = av; return x; }
  lx = lg(x);
  q = ((GEN)av) - lx;
  avma = (pari_sp)q;
  while (--lx >= 0) q[lx] = x[lx];
  return q;
}
INLINE GEN
gerepileuptoint(pari_sp av, GEN x)
{
  if (!isonstack(x) || (GEN)av<=x) { avma = av; return x; }
  avma = (pari_sp)icopy_avma(x, av);
  return (GEN)avma;
}
INLINE GEN
gerepileupto(pari_sp av, GEN x)
{
  if (!isonstack(x) || (GEN)av<=x) { avma = av; return x; }
  switch(typ(x))
  { /* non-default = !is_recursive_t(tq) */
    case t_INT: return gerepileuptoint(av, x);
    case t_REAL:
    case t_STR:
    case t_VECSMALL: return gerepileuptoleaf(av,x);
    default:
      /* NB: x+i --> ((long)x) + i*sizeof(long) */
      return gerepile(av, (pari_sp) (x+lg(x)), x);
  }
}

/* gerepileupto(av, gcopy(x)) */
INLINE GEN
gerepilecopy(pari_sp av, GEN x)
{
  GENbin *p = copy_bin(x);
  avma = av; return bin_copy(p);
}

/* Takes an array of pointers to GENs, of length n. Copies all
 * objects to contiguous locations and cleans up the stack between
 * av and avma. */
INLINE void
gerepilemany(pari_sp av, GEN* gptr[], int n)
{
  int i;
  for (i=0; i<n; i++) *gptr[i] = (GEN)copy_bin(*gptr[i]);
  avma = av;
  for (i=0; i<n; i++) *gptr[i] = bin_copy((GENbin*)*gptr[i]);
}

INLINE void
gerepileall(pari_sp av, int n, ...)
{
  int i;
  va_list a; va_start(a, n);
  if (n < 10)
  {
    GEN *gptr[10];
    for (i=0; i<n; i++)
    { gptr[i] = va_arg(a,GEN*); *gptr[i] = (GEN)copy_bin(*gptr[i]); }
    avma = av;
    for (--i; i>=0; i--) *gptr[i] = bin_copy((GENbin*)*gptr[i]);

  }
  else
  {
    GEN **gptr = (GEN**)  pari_malloc(n*sizeof(GEN*));
    for (i=0; i<n; i++)
    { gptr[i] = va_arg(a,GEN*); *gptr[i] = (GEN)copy_bin(*gptr[i]); }
    avma = av;
    for (--i; i>=0; i--) *gptr[i] = bin_copy((GENbin*)*gptr[i]);
    pari_free(gptr);
  }
}

INLINE void
gerepilecoeffs(pari_sp av, GEN x, int n)
{
  int i;
  for (i=0; i<n; i++) gel(x,i) = (GEN)copy_bin(gel(x,i));
  avma = av;
  for (i=0; i<n; i++) gel(x,i) = bin_copy((GENbin*)x[i]);
}

INLINE void
gerepilecoeffs2(pari_sp av, GEN x, int n, GEN y, int o)
{
  int i;
  for (i=0; i<n; i++) gel(x,i) = (GEN)copy_bin(gel(x,i));
  for (i=0; i<o; i++) gel(y,i) = (GEN)copy_bin(gel(y,i));
  avma = av;
  for (i=0; i<n; i++) gel(x,i) = bin_copy((GENbin*)x[i]);
  for (i=0; i<o; i++) gel(y,i) = bin_copy((GENbin*)y[i]);
}

/* p from copy_bin. Copy p->x back to stack, then destroy p */
INLINE GEN
bin_copy(GENbin *p)
{
  GEN x, y, base;
  long dx, len;

  x   = p->x; if (!x) { pari_free(p); return gen_0; }
  len = p->len;
  base= p->base; dx = x - base;
  y = (GEN)memcpy((void*)new_chunk(len), (void*)GENbinbase(p), len*sizeof(long));
  y += dx;
  if (p->canon)
    shiftaddress_canon(y, (y-x)*sizeof(long));
  else
    shiftaddress(y, (y-x)*sizeof(long));
  pari_free(p); return y;
}

INLINE GEN
GENbinbase(GENbin *p) { return (GEN)(p + 1); }

INLINE void
cgiv(GEN x)
{
  pari_sp av = (pari_sp)(x+lg(x));
  if (isonstack((GEN)av)) avma = av;
}

INLINE void
killblock(GEN x) { gunclone(x); }

INLINE int
is_universal_constant(GEN x) { return (x >= gen_0 && x <= ghalf); }

/*******************************************************************/
/*                                                                 */
/*                    CONVERSION / ASSIGNMENT                      */
/*                                                                 */
/*******************************************************************/
/* z is a type which may be a t_COMPLEX component (not a t_QUAD) */
INLINE GEN
cxcompotor(GEN z, long prec)
{
  switch(typ(z))
  {
    case t_INT:  return itor(z, prec);
    case t_FRAC: return fractor(z, prec);
    case t_REAL: return rtor(z, prec);
    default: pari_err(typeer,"cxcompotor"); return NULL; /* not reached */
  }
}
INLINE GEN
cxtofp(GEN x, long prec) { GEN z = cgetg(3,t_COMPLEX);
  gel(z,1) = cxcompotor(gel(x,1),prec);
  gel(z,2) = cxcompotor(gel(x,2),prec); return z;
}

INLINE double
gtodouble(GEN x)
{
  if (typ(x)!=t_REAL) {
    pari_sp av = avma;
    x = gtofp(x, DEFAULTPREC);
    avma = av;
  }
  return rtodbl(x);
}
INLINE long
gtos(GEN x) {
  if (typ(x) != t_INT) pari_err(talker,"gtos expected an integer, got '%Ps'",x);
  return itos(x);
}

INLINE GEN
absfrac(GEN x)
{
  GEN y = cgetg(3, t_FRAC);
  gel(y,1) = absi(gel(x,1));
  gel(y,2) = icopy(gel(x,2)); return y;
}
INLINE GEN
Q_abs(GEN x) { return (typ(x) == t_INT)? absi(x): absfrac(x); }

/* Force z to be of type real/complex with floating point components */
INLINE GEN
gtofp(GEN z, long prec)
{
  switch(typ(z))
  {
    case t_INT:  return itor(z, prec);
    case t_FRAC: return fractor(z, prec);
    case t_REAL: return rtor(z, prec);
    case t_COMPLEX: {
      GEN a = gel(z,1), b = gel(z,2);
      if (isintzero(b)) return cxcompotor(a, prec);
      if (isintzero(a)) {
        GEN y = cgetg(3, t_COMPLEX);
        b = cxcompotor(b, prec);
        gel(y,1) = real_0_bit(expo(b) - bit_accuracy(prec));
        gel(y,2) = b; return y;
      }
      return cxtofp(z, prec);
    }
    case t_QUAD: return quadtofp(z, prec);
    default: pari_err(typeer,"gtofp"); return NULL; /* not reached */
  }
}

INLINE GEN
RgX_gtofp(GEN x, long prec)
{
  long l;
  GEN y = cgetg_copy(x, &l);
  while (--l > 1) gel(y,l) = gtofp(gel(x,l), prec);
  y[1] = x[1]; return y;
}
INLINE GEN
RgC_gtofp(GEN x, long prec)
{
  long l = lg(x);
  GEN y = cgetg(l, t_COL);
  while (--l > 0) gel(y,l) = gtofp(gel(x,l), prec);
  return y;
}
INLINE GEN
RgM_gtofp(GEN x, long prec)
{
  long l;
  GEN y = cgetg_copy(x, &l);
  while (--l > 0) gel(y,l) = RgC_gtofp(gel(x,l), prec);
  return y;
}

INLINE GEN
RgX_fpnorml2(GEN x, long prec)
{
  pari_sp av = avma;
  return gerepileupto(av, gnorml2(RgX_gtofp(x, prec)));
}
INLINE GEN
RgC_fpnorml2(GEN x, long prec)
{
  pari_sp av = avma;
  return gerepileupto(av, gnorml2(RgC_gtofp(x, prec)));
}
INLINE GEN
RgM_fpnorml2(GEN x, long prec)
{
  pari_sp av = avma;
  return gerepileupto(av, gnorml2(RgM_gtofp(x, prec)));
}

/* y a t_REAL */
INLINE void
affgr(GEN x, GEN y)
{
  pari_sp av;
  switch(typ(x)) {
    case t_INT:  affir(x,y); break;
    case t_REAL: affrr(x,y); break;
    case t_FRAC: rdiviiz(gel(x,1),gel(x,2), y); break;
    case t_QUAD: av = avma; affgr(quadtofp(x,lg(y)), y); avma = av; break;
    default: pari_err(operf,"",x,y);
  }
}

INLINE GEN
affc_fixlg(GEN x, GEN res)
{
  if (typ(x) == t_COMPLEX)
  {
    affrr_fixlg(gel(x,1), gel(res,1));
    affrr_fixlg(gel(x,2), gel(res,2));
  }
  else
  {
    avma = (pari_sp)(res+3);
    res = cgetr(lg(gel(res,1)));
    affrr_fixlg(x, res);
  }
  return res;
}

INLINE GEN
trunc_safe(GEN x) { long e; return gcvtoi(x,&e); }

/*******************************************************************/
/*                                                                 */
/*                          LENGTH CONVERSIONS                     */
/*                                                                 */
/*******************************************************************/
INLINE long
ndec2nlong(long x) { return 1 + (long)((x)*(LOG2_10/BITS_IN_LONG)); }
INLINE long
ndec2prec(long x) { return 2 + ndec2nlong(x); }
/* Fast implementation of ceil(x / (8*sizeof(long))); typecast to (ulong)
 * to avoid overflow. Faster than 1 + ((x-1)>>TWOPOTBITS_IN_LONG)) :
 *   addl, shrl instead of subl, sarl, addl */
INLINE long
nbits2nlong(long x) {
  return (long)(((ulong)x+BITS_IN_LONG-1) >> TWOPOTBITS_IN_LONG);
}
/* Fast implementation of 2 + nbits2nlong(x) */
INLINE long
nbits2prec(long x) {
  return (long)(((ulong)x+3*BITS_IN_LONG-1) >> TWOPOTBITS_IN_LONG);
}
/* ceil(x / sizeof(long)) */
INLINE long
nchar2nlong(long x) {
  return (long)(((ulong)x+sizeof(long)-1) >> (TWOPOTBITS_IN_LONG-3L));
}
INLINE long
bit_accuracy(long x) { return (x-2) * BITS_IN_LONG; }
INLINE double
bit_accuracy_mul(long x, double y) { return (x-2) * (BITS_IN_LONG*y); }
INLINE long
prec2ndec(long x) { return (long)bit_accuracy_mul(x, LOG10_2); }
INLINE long
divsBIL(long n) { return n >> TWOPOTBITS_IN_LONG; }
INLINE long
remsBIL(long n) { return n & (BITS_IN_LONG-1); }

/*********************************************************************/
/**                                                                 **/
/**                      OPERATIONS MODULO m                        **/
/**                                                                 **/
/*********************************************************************/
/* Assume m > 0, more efficient if 0 <= a, b < m */

INLINE GEN
Fp_red(GEN a, GEN m) { return modii(a, m); }

INLINE GEN
Fp_add(GEN a, GEN b, GEN m)
{
  pari_sp av=avma;
  GEN p = addii(a,b);
  long s = signe(p);
  if (!s) return p; /* = gen_0 */
  if (s > 0) /* general case */
  {
    GEN t = subii(p, m);
    s = signe(t);
    if (!s) { avma = av; return gen_0; }
    if (s < 0) { avma = (pari_sp)p; return p; }
    if (cmpii(t, m) < 0) return gerepileuptoint(av, t); /* general case ! */
    p = remii(t, m);
  }
  else
    p = modii(p, m);
  return gerepileuptoint(av, p);
}
INLINE GEN
Fp_sub(GEN a, GEN b, GEN m)
{
  pari_sp av=avma;
  GEN p = subii(a,b);
  long s = signe(p);
  if (!s) return p; /* = gen_0 */
  if (s > 0)
  {
    if (cmpii(p, m) < 0) return p; /* general case ! */
    p = remii(p, m);
  }
  else
  {
    GEN t = addii(p, m);
    if (!s) { avma = av; return gen_0; }
    if (s > 0) return gerepileuptoint(av, t); /* general case ! */
    p = modii(t, m);
  }
  return gerepileuptoint(av, p);
}
INLINE GEN
Fp_neg(GEN b, GEN m)
{
  pari_sp av = avma;
  long s = signe(b);
  GEN p;
  if (!s) return gen_0;
  if (s > 0)
  {
    p = subii(m, b);
    if (signe(p) >= 0) return p; /* general case ! */
    p = modii(p, m);
  } else
    p = remii(negi(b), m);
  return gerepileuptoint(av, p);
}
/* assume 0 <= u < p and ps2 = p>>1 */
INLINE GEN
Fp_center(GEN u, GEN p, GEN ps2)
{ return absi_cmp(u,ps2)<=0? icopy(u): subii(u,p); }

INLINE GEN
Fp_mul(GEN a, GEN b, GEN m)
{
  pari_sp av=avma;
  GEN p; /*HACK: assume modii use <=lg(p)+(lg(m)<<1) space*/
  (void)new_chunk(lg(a)+lg(b)+(lg(m)<<1));
  p = mulii(a,b);
  avma = av; return modii(p,m);
}
INLINE GEN
Fp_sqr(GEN a, GEN m)
{
  pari_sp av=avma;
  GEN p; /*HACK: assume modii use <=lg(p)+(lg(m)<<1) space*/
  (void)new_chunk((lg(a)+lg(m))<<1);
  p = sqri(a);
  avma = av; return modii(p,m);
}
INLINE GEN
Fp_mulu(GEN a, ulong b, GEN m)
{
  long l = lgefint(m);
  if (l == 3)
  {
    ulong mm = m[2];
    return utoi( Fl_mul(umodiu(a, mm), b, mm) );
  } else {
    pari_sp av = avma;
    GEN p; /*HACK: assume modii use <=lg(p)+(lg(m)<<1) space*/
    (void)new_chunk(lg(a)+1+(l<<1));
    p = muliu(a,b);
    avma = av; return modii(p,m);
  }
}

INLINE GEN
Fp_inv(GEN a, GEN m)
{
  GEN res;
  if (! invmod(a,m,&res)) pari_err(invmoder, gmodulo(res,m));
  return res;
}
INLINE GEN
Fp_invsafe(GEN a, GEN m)
{
  GEN res;
  if (! invmod(a,m,&res)) return NULL;
  return res;
}
INLINE GEN
Fp_div(GEN a, GEN b, GEN m)
{
  pari_sp av=avma;
  GEN p; /*HACK: assume modii use <=lg(p)+(lg(m)<<1) space*/
  (void)new_chunk(lg(a)+(lg(m)<<1));
  p = mulii(a, Fp_inv(b,m));
  avma = av; return modii(p,m);
}

/*******************************************************************/
/*                                                                 */
/*                          GEN SUBTYPES                           */
/*                                                                 */
/*******************************************************************/

INLINE int
is_const_t(long t) { return (t < t_POLMOD); }
INLINE int
is_extscalar_t(long t) { return (t <= t_POL); }
INLINE int
is_intreal_t(long t) { return (t <= t_REAL); }
INLINE int
is_matvec_t(long t) { return (t >= t_VEC && t <= t_MAT); }
INLINE int
is_noncalc_t(long tx) { return (tx) >= t_LIST; }
INLINE int
is_rational_t(long t) { return (t == t_INT || t == t_FRAC); }
INLINE int
is_recursive_t(long t) { return lontyp[t]; }
INLINE int
is_scalar_t(long t) { return (t < t_POL); }
INLINE int
is_vec_t(long t) { return (t == t_VEC || t == t_COL); }

/*******************************************************************/
/*                                                                 */
/*                         TRANSCENDENTAL                          */
/*                                                                 */
/*******************************************************************/
INLINE GEN
sqrtr(GEN x) {
  long s = signe(x);
  GEN y;
  if (s == 0) return real_0_bit(expo(x) >> 1);
  if (s >= 0) return sqrtr_abs(x);
  y = cgetg(3,t_COMPLEX);
  gel(y,2) = sqrtr_abs(x);
  gel(y,1) = gen_0; return y;
}
/* x^(1/n) */
INLINE GEN
sqrtnr(GEN x, long n) { return mpexp(divrs(mplog(x), n)); }

/*******************************************************************/
/*                                                                 */
/*                         MISCELLANEOUS                           */
/*                                                                 */
/*******************************************************************/
INLINE int ismpzero(GEN x) { return is_intreal_t(typ(x)) && !signe(x); }
INLINE int isintzero(GEN x) { return typ(x) == t_INT && !signe(x); }
INLINE int isint1(GEN x) { return typ(x)==t_INT && equali1(x); }
INLINE int isintm1(GEN x){ return typ(x)==t_INT && equalim1(x);}
INLINE int equali1(GEN n)
{ return (ulong) n[1] == (evallgefint(3UL) | evalsigne(1)) && n[2] == 1; }
INLINE int equalim1(GEN n)
{ return (ulong) n[1] == (evallgefint(3UL) | evalsigne(-1)) && n[2] == 1; }
/* works only for POSITIVE integers */
INLINE int is_pm1(GEN n)
{ return lgefint(n) == 3 && n[2] == 1; }
INLINE int is_bigint(GEN n)
{ long l = lgefint(n); return l > 3 || (l == 3 && (n[2] & HIGHBIT)); }

INLINE int odd(long x) { return x & 1; }
INLINE int both_odd(long x, long y) { return x & y & 1; }

INLINE int
isonstack(GEN x) { return ((pari_sp)x >= bot && (pari_sp)x < top); }

/* assume 0 <= k <= BITS_IN_LONG. Return uniform random 0 <= x < (1<<k) */
INLINE long
random_bits(long k) { return pari_rand() >> (BITS_IN_LONG - k); }

/* assume x != 0 and x t_REAL, return an approximation to log2(|x|) */
INLINE double
dbllog2r(GEN x)
{ return log2((double)(ulong)x[2]) + (double)(expo(x) - (BITS_IN_LONG-1)); }

INLINE GEN
mul_content(GEN cx, GEN cy)
{
  if (!cx) return cy;
  if (!cy) return cx;
  return gmul(cx,cy);
}
INLINE GEN
mul_denom(GEN dx, GEN dy)
{
  if (!dx) return dy;
  if (!dy) return dx;
  return mulii(dx,dy);
}


/* POLYNOMIALS */
INLINE GEN
constant_term(GEN x) { return signe(x)? gel(x,2): gen_0; }
INLINE GEN
leading_term(GEN x) { return lg(x) == 2? gen_0: gel(x,lg(x)-1); }
INLINE long
degpol(GEN x) { return lg(x)-3; }
INLINE long
lgpol(GEN x) { return lg(x)-2; }
INLINE GEN
truecoeff(GEN x, long n) { return polcoeff0(x,n,-1); }

INLINE GEN
RgXQ_mul(GEN y, GEN x, GEN T) { return RgX_rem(RgX_mul(y, x), T); }
INLINE GEN
RgXQ_sqr(GEN x, GEN T) { return RgX_rem(RgX_sqr(x), T); }

INLINE GEN
ZXQ_mul(GEN y, GEN x, GEN T) { return ZX_rem(ZX_mul(y, x), T); }
INLINE GEN
ZXQ_sqr(GEN x, GEN T) { return ZX_rem(ZX_sqr(x), T); }

INLINE GEN
RgX_div(GEN x, GEN y) { return RgX_divrem(x,y,NULL); }
INLINE GEN
RgX_rem(GEN x, GEN y) { return RgX_divrem(x,y,ONLY_REM); }
INLINE GEN
RgXQX_div(GEN x, GEN y, GEN T) { return RgXQX_divrem(x,y,T,NULL); }
INLINE GEN
RgXQX_rem(GEN x, GEN y, GEN T) { return RgXQX_divrem(x,y,T,ONLY_REM); }
INLINE GEN
FpX_div(GEN x, GEN y, GEN p) { return FpX_divrem(x,y,p, NULL); }
INLINE GEN
Flx_div(GEN x, GEN y, ulong p) { return Flx_divrem(x,y,p, NULL); }
INLINE GEN
F2x_div(GEN x, GEN y) { return F2x_divrem(x,y, NULL); }
INLINE GEN
FpV_FpC_mul(GEN x, GEN y, GEN p) { return FpV_dotproduct(x,y,p); }
INLINE GEN
pol0_Flx(long sv) { return mkvecsmall(sv); }
INLINE GEN
pol1_Flx(long sv) { return mkvecsmall2(sv, 1); }
INLINE GEN
polx_Flx(long sv) { return mkvecsmall3(sv, 0, 1); }
INLINE GEN
zero_zx(long sv) { return zero_Flx(sv); }
INLINE GEN
polx_zx(long sv) { return polx_Flx(sv); }
INLINE GEN
zx_shift(GEN x, long n) { return Flx_shift(x,n); }
INLINE GEN
zx_renormalize(GEN x, long l) { return Flx_renormalize(x,l); }
INLINE GEN
zero_F2x(long sv) { return zero_Flx(sv); }
INLINE GEN
pol0_F2x(long sv) { return pol0_Flx(sv); }
INLINE GEN
pol1_F2x(long sv) { return pol1_Flx(sv); }
INLINE GEN
polx_F2x(long sv) { return mkvecsmall2(sv, 2); }
INLINE int
F2x_equal1(GEN x) { return Flx_equal1(x); }
INLINE GEN
Flv_copy(GEN x) { return leafcopy(x); }
INLINE GEN
Flx_copy(GEN x) { return leafcopy(x); }
INLINE GEN
vecsmall_copy(GEN x) { return leafcopy(x); }
INLINE int
Flx_equal1(GEN x) { return degpol(x)==0 && x[2] == 1; }

INLINE GEN
FpX_renormalize(GEN x, long lx)   { return ZX_renormalize(x,lx); }
INLINE GEN
FpXX_renormalize(GEN x, long lx)  { return ZX_renormalize(x,lx); }
INLINE GEN
FpXQX_renormalize(GEN x, long lx) { return ZX_renormalize(x,lx); }
INLINE GEN
F2x_renormalize(GEN x, long lx)   { return Flx_renormalize(x,lx); }

INLINE GEN
ZX_ZXY_resultant(GEN a, GEN b) { return ZX_ZXY_rnfequation(a,b,NULL); }
INLINE long
sturm(GEN x) { return sturmpart(x, NULL, NULL); }
INLINE GEN
resultant(GEN x, GEN y) { return resultant_all(x,y,NULL); }

INLINE long
gval(GEN x, long v) {
  pari_sp av = avma;
  long n = ggval(x, pol_x(v));
  avma = av; return n;
}

INLINE void
RgX_shift_inplace_init(long v)
{ if (v) (void)cgetg(v, t_VECSMALL); }
/* shift polynomial in place. assume v free cells have been left before x */
INLINE GEN
RgX_shift_inplace(GEN x, long v)
{
  long i, lx;
  GEN y, z;
  if (!v) return x;
  lx = lg(x);
  if (lx == 2) return x;
  y = x + v;
  z = x + lx;
  /* stackdummy from normalizepol: move it up */
  if (lg(z) != v) x[lx + v] = z[0];
  for (i = lx-1; i >= 2; i--) y[i] = x[i];
  for (i = v+1;  i >= 2; i--) gel(x,i) = gen_0;
  /* leave x[1] alone: it is correct */
  x[0] = evaltyp(t_POL) | evallg(lx+v); return x;
}


/* LINEAR ALGEBRA */
INLINE GEN
zv_to_ZV(GEN x) { return vecsmall_to_vec(x); }
INLINE GEN
zc_to_ZC(GEN x) { return vecsmall_to_col(x); }
INLINE GEN
ZV_to_zv(GEN x) { return vec_to_vecsmall(x); }
INLINE GEN
zx_to_zv(GEN x, long N) { return Flx_to_Flv(x,N); }
INLINE GEN
zv_to_zx(GEN x, long sv) { return Flv_to_Flx(x,sv); }
INLINE GEN
zm_to_zxV(GEN x, long sv) { return Flm_to_FlxV(x,sv); }
INLINE GEN
zero_zm(long x, long y) { return zero_Flm(x,y); }
INLINE GEN
zero_zv(long x) { return zero_Flv(x); }
INLINE GEN
zm_transpose(GEN x) { return Flm_transpose(x); }
INLINE GEN
zm_copy(GEN x) { return Flm_copy(x); }
INLINE GEN
zv_copy(GEN x) { return Flv_copy(x); }
INLINE GEN
row_zm(GEN x, long i) { return row_Flm(x,i); }

INLINE GEN
ZC_hnfrem(GEN x, GEN y) { return ZC_hnfremdiv(x,y,NULL); }
INLINE GEN
ZM_hnfrem(GEN x, GEN y) { return ZM_hnfremdiv(x,y,NULL); }
INLINE GEN
ZM_lll(GEN x, double D, long f) { return ZM_lll_norms(x,D,f,NULL); }
INLINE GEN
RgM_inv(GEN a) { return RgM_solve(a, NULL); }
INLINE GEN
RgM_shallowcopy(GEN x)
{
  long l;
  GEN y = cgetg_copy(x, &l);
  while (--l > 0) gel(y,l) = leafcopy(gel(x,l));
  return y;
}
INLINE GEN
F2m_copy(GEN x) { return RgM_shallowcopy(x); }

INLINE GEN
Flm_copy(GEN x) { return RgM_shallowcopy(x); }

/* divisibility: return 1 if y[i] | x[i] for all i, 0 otherwise. Assume
 * x,y are ZV of the same length */
INLINE int
ZV_dvd(GEN x, GEN y)
{
  long i, l = lg(x);
  for (i=1; i < l; i++)
    if ( ! dvdii( gel(x,i), gel(y,i) ) ) return 0;
  return 1;
}

/* Fq */
INLINE GEN
Fq_red(GEN x, GEN T, GEN p)
{ return typ(x)==t_INT? Fp_red(x,p): FpXQ_red(x,T,p); }

/* FpXQX */
INLINE GEN
FpXQX_rem(GEN x, GEN y, GEN T, GEN p) { return FpXQX_divrem(x, y, T, p, ONLY_REM); }
INLINE GEN
FpXQX_div(GEN x, GEN y, GEN T, GEN p) { return FpXQX_divrem(x, y, T, p, NULL); }
INLINE GEN
FlxqX_rem(GEN x, GEN y, GEN T, ulong p) { return FlxqX_divrem(x, y, T, p, ONLY_REM); }
INLINE GEN
FlxqX_div(GEN x, GEN y, GEN T, ulong p) { return FlxqX_divrem(x, y, T, p, NULL); }

/* FqX */
INLINE GEN
FqX_red(GEN z, GEN T, GEN p) { return T? FpXQX_red(z, T, p): FpX_red(z, p); }
INLINE GEN
FqX_add(GEN x,GEN y,GEN T,GEN p) { return T? FpXX_add(x,y,p): FpX_add(x,y,p); }
INLINE GEN
FqX_sub(GEN x,GEN y,GEN T,GEN p) { return T? FpXX_sub(x,y,p): FpX_sub(x,y,p); }
INLINE GEN
FqX_Fp_mul(GEN P, GEN u, GEN T, GEN p)
{ return T? FpXX_Fp_mul(P, u, p): FpX_Fp_mul(P, u, p); }
INLINE GEN
FqX_Fq_mul(GEN P, GEN U, GEN T, GEN p)
{ return typ(U)==t_INT ? FqX_Fp_mul(P, U, T, p): FpXQX_FpXQ_mul(P, U, T, p); }
INLINE GEN
FqX_mul(GEN x, GEN y, GEN T, GEN p)
{ return T? FpXQX_mul(x, y, T, p): FpX_mul(x, y, p); }
INLINE GEN
FqX_sqr(GEN x, GEN T, GEN p)
{ return T? FpXQX_sqr(x, T, p): FpX_sqr(x, p); }
INLINE GEN
FqX_div(GEN x, GEN y, GEN T, GEN p)
{ return T? FpXQX_divrem(x,y,T,p,NULL): FpX_divrem(x,y,p,NULL); }
INLINE GEN
FqX_rem(GEN x, GEN y, GEN T, GEN p)
{ return T? FpXQX_rem(x,y,T,p): FpX_rem(x,y,p); }
INLINE GEN
FqX_divrem(GEN x, GEN y, GEN T, GEN p, GEN *z)
{ return T? FpXQX_divrem(x,y,T,p,z): FpX_divrem(x,y,p,z); }
INLINE GEN
FqX_gcd(GEN P,GEN Q,GEN T,GEN p)
{return T? FpXQX_gcd(P,Q,T,p): FpX_gcd(P,Q,p);}
INLINE GEN
FqX_extgcd(GEN P,GEN Q,GEN T,GEN p, GEN *U, GEN *V)
{ return T? FpXQX_extgcd(P,Q,T,p,U,V): FpX_extgcd(P,Q,p,U,V); }

/*FqXQ*/
INLINE GEN
FqXQ_add(GEN x, GEN y, GEN S/*unused*/, GEN T, GEN p)
{ (void)S; return T? FpXX_add(x,y,p): FpX_add(x,y,p); }
INLINE GEN
FqXQ_sub(GEN x, GEN y, GEN S/*unused*/, GEN T, GEN p)
{ (void)S; return T? FpXX_sub(x,y,p): FpX_sub(x,y,p); }
INLINE GEN
FqXQ_div(GEN x, GEN y, GEN S, GEN T, GEN p)
{ return T? FpXQXQ_div(x,y,S,T,p): FpXQ_div(x,y,S,p); }
INLINE GEN
FqXQ_inv(GEN x, GEN S, GEN T, GEN p)
{ return T? FpXQXQ_inv(x,S,T,p): FpXQ_inv(x,S,p); }
INLINE GEN
FqXQ_invsafe(GEN x, GEN S, GEN T, GEN p)
{ return T? FpXQXQ_invsafe(x,S,T,p): FpXQ_inv(x,S,p); }
INLINE GEN
FqXQ_mul(GEN x, GEN y, GEN S, GEN T, GEN p)
{ return T? FpXQXQ_mul(x,y,S,T,p): FpXQ_mul(x,y,S,p); }
INLINE GEN
FqXQ_sqr(GEN x, GEN S, GEN T, GEN p)
{ return T? FpXQXQ_sqr(x,S,T,p): FpXQ_sqr(x,S,p); }
INLINE GEN
FqXQ_pow(GEN x, GEN n, GEN S, GEN T, GEN p)
{ return T? FpXQXQ_pow(x,n,S,T,p): FpXQ_pow(x,n,S,p); }

/*FpXQ*/
INLINE GEN
FpXQ_add(GEN x,GEN y,GEN T/*unused*/,GEN p)
{ (void)T; return FpX_add(x,y,p); }
INLINE GEN
FpXQ_sub(GEN x,GEN y,GEN T/*unused*/,GEN p)
{ (void)T; return FpX_sub(x,y,p); }

/*Flxq*/
INLINE GEN
Flxq_add(GEN x,GEN y,GEN T/*unused*/,ulong p)
{ (void)T; return Flx_add(x,y,p); }
INLINE GEN
Flxq_sub(GEN x,GEN y,GEN T/*unused*/,ulong p)
{ (void)T; return Flx_sub(x,y,p); }

/* F2x */

INLINE ulong
F2x_coeff(GEN x,long v)
{
   ulong u=(ulong)x[2+divsBIL(v)];
   return (u>>remsBIL(v))&1UL;
}

INLINE void
F2x_clear(GEN x,long v)
{
   ulong* u=(ulong*)&x[2+divsBIL(v)];
   *u&=~(1UL<<remsBIL(v));
}

INLINE void
F2x_set(GEN x,long v)
{
   ulong* u=(ulong*)&x[2+divsBIL(v)];
   *u|=1UL<<remsBIL(v);
}

INLINE void
F2x_flip(GEN x,long v)
{
   ulong* u=(ulong*)&x[2+divsBIL(v)];
   *u^=1UL<<remsBIL(v);
}

/* F2v */

INLINE ulong
F2v_coeff(GEN x,long v) { return F2x_coeff(x,v-1); }

INLINE void
F2v_clear(GEN x,long v) { F2x_clear(x,v-1); }

INLINE void
F2v_set(GEN x,long v)   { F2x_set(x,v-1); }

INLINE void
F2v_flip(GEN x,long v) { F2x_flip(x,v-1); }

/* F2m */

INLINE ulong
F2m_coeff(GEN x, long a, long b) { return F2v_coeff(gel(x,b), a); }

INLINE void
F2m_clear(GEN x, long a, long b) { F2v_clear(gel(x,b), a); }

INLINE void
F2m_set(GEN x, long a, long b) { F2v_set(gel(x,b), a); }

INLINE void
F2m_flip(GEN x, long a, long b) { F2v_flip(gel(x,b), a); }

/* ARITHMETIC */
INLINE GEN
matpascal(long n) { return matqpascal(n, NULL); }
INLINE long
Z_issquare(GEN x) { return Z_issquareall(x, NULL); }
INLINE long
Z_ispower(GEN x, ulong k) { return Z_ispowerall(x, k, NULL); }
INLINE GEN
sqrti(GEN x) { return sqrtremi(x,NULL); }
INLINE GEN
gaddgs(GEN y, long s) { return gaddsg(s,y); }
INLINE int
gcmpgs(GEN y, long s) { return -gcmpsg(s,y); }
INLINE int
gequalgs(GEN y, long s) { return gequalsg(s,y); }
INLINE GEN
gmaxsg(long s, GEN y) { return gmaxgs(y,s); }
INLINE GEN
gminsg(long s, GEN y) { return gmings(y,s); }
INLINE GEN
gmulgs(GEN y, long s) { return gmulsg(s,y); }
INLINE GEN
gsubgs(GEN y, long s) { return gaddgs(y, -s); }
INLINE GEN
gdivsg(long s, GEN y) { return gdiv(stoi(s), y); }

/* x t_COMPLEX */
INLINE GEN
cxnorm(GEN x) { return gadd(gsqr(gel(x,1)), gsqr(gel(x,2))); }
/* q t_QUAD */
INLINE GEN
quadnorm(GEN q)
{
  GEN X = gel(q,1), b = gel(X,3), c = gel(X,2);
  GEN z, u = gel(q,3), v = gel(q,2);
  if (typ(u) == t_INT && typ(v) == t_INT) /* generic case */
  {
    z = signe(b)? mulii(v, addii(u,v)): sqri(v);
    return addii(z, mulii(c, sqri(u)));
  }
  else
  {
    z = signe(b)? gmul(v, gadd(u,v)): gsqr(v);
    return gadd(z, gmul(c, gsqr(u)));
  }
}
/* x a t_QUAD, return the associated discriminant */
INLINE GEN
quad_disc(GEN x)
{
  GEN Q = gel(x,1), b = gel(Q,3), c = gel(Q,2), c4;
  if (is_pm1(b))
  {
    pari_sp av = avma; (void)new_chunk(lgefint(c) + 1);
    c4 = shifti(c,2); avma = av; return subsi(1, c4);
  }
  c4 = shifti(c,2); togglesign_safe(&c4); return c4;
}
INLINE GEN
qfb_disc3(GEN x, GEN y, GEN z) { return subii(sqri(y), shifti(mulii(x,z),2)); }
INLINE GEN
qfb_disc(GEN x) { return qfb_disc3(gel(x,1), gel(x,2), gel(x,3)); }

INLINE GEN
sqrfrac(GEN x)
{
  GEN z = cgetg(3,t_FRAC);
  gel(z,1) = sqri(gel(x,1));
  gel(z,2) = sqri(gel(x,2)); return z;
}

INLINE void
normalize_frac(GEN z) {
  if (signe(z[2]) < 0) { togglesign(gel(z,1)); setabssign(gel(z,2)); }
}

INLINE GEN
powii(GEN x, GEN n)
{
  long ln = lgefint(n);
  if (ln == 3) {
    GEN z;
    if (signe(n) > 0) return powiu(x, n[2]);
    z = cgetg(3, t_FRAC);
    gel(z,1) = gen_1;
    gel(z,2) = powiu(x, n[2]);
    return z;
  }
  if (ln == 2) return gen_1; /* rare */
  /* should never happen */
  return powgi(x, n); /* overflow unless x = 0, 1, -1 */
}
INLINE GEN
powIs(long n) {
  switch(n & 3)
  {
    case 1: return mkcomplex(gen_0,gen_1);
    case 2: return gen_m1;
    case 3: return mkcomplex(gen_0,gen_m1);
  }
  return gen_1;
}

/*******************************************************************/
/*                                                                 */
/*                             ASSIGNMENTS                         */
/*                                                                 */
/*******************************************************************/
INLINE void mpexpz(GEN x, GEN z)
{ pari_sp av = avma; gaffect(mpexp(x), z); avma = av; }
INLINE void mplogz(GEN x, GEN z)
{ pari_sp av = avma; gaffect(mplog(x), z); avma = av; }
INLINE void mpcosz(GEN x, GEN z)
{ pari_sp av = avma; gaffect(mpcos(x), z); avma = av; }
INLINE void mpsinz(GEN x, GEN z)
{ pari_sp av = avma; gaffect(mpsin(x), z); avma = av; }
INLINE void gnegz(GEN x, GEN z)
{ pari_sp av = avma; gaffect(gneg(x), z); avma = av; }
INLINE void gabsz(GEN x, long prec, GEN z)
{ pari_sp av = avma; gaffect(gabs(x,prec), z); avma = av; }
INLINE void gaddz(GEN x, GEN y, GEN z)
{ pari_sp av = avma; gaffect(gadd(x,y), z); avma = av; }
INLINE void gsubz(GEN x, GEN y, GEN z)
{ pari_sp av = avma; gaffect(gsub(x,y), z); avma = av; }
INLINE void gmulz(GEN x, GEN y, GEN z)
{ pari_sp av = avma; gaffect(gmul(x,y), z); avma = av; }
INLINE void gdivz(GEN x, GEN y, GEN z)
{ pari_sp av = avma; gaffect(gdiv(x,y), z); avma = av; }
INLINE void gdiventz(GEN x, GEN y, GEN z)
{ pari_sp av = avma; gaffect(gdivent(x,y), z); avma = av; }
INLINE void gmodz(GEN x, GEN y, GEN z)
{ pari_sp av = avma; gaffect(gmod(x,y), z); avma = av; }
INLINE void gmul2nz(GEN x, long s, GEN z)
{ pari_sp av = avma; gaffect(gmul2n(x,s), z); avma = av; }
INLINE void gshiftz(GEN x, long s, GEN z)
{ pari_sp av = avma; gaffect(gshift(x,s), z); avma = av; }

/*******************************************************************/
/*                                                                 */
/*                       ELLIPTIC CURVES                           */
/*                                                                 */
/*******************************************************************/
INLINE GEN ell_get_a1(GEN e) { return gel(e,1); }
INLINE GEN ell_get_a2(GEN e) { return gel(e,2); }
INLINE GEN ell_get_a3(GEN e) { return gel(e,3); }
INLINE GEN ell_get_a4(GEN e) { return gel(e,4); }
INLINE GEN ell_get_a6(GEN e) { return gel(e,5); }
INLINE GEN ell_get_b2(GEN e) { return gel(e,6); }
INLINE GEN ell_get_b4(GEN e) { return gel(e,7); }
INLINE GEN ell_get_b6(GEN e) { return gel(e,8); }
INLINE GEN ell_get_b8(GEN e) { return gel(e,9); }
INLINE GEN ell_get_c4(GEN e) { return gel(e,10); }
INLINE GEN ell_get_c6(GEN e) { return gel(e,11); }
INLINE GEN ell_get_disc(GEN e) { return gel(e,12); }
INLINE GEN ell_get_j(GEN e) { return gel(e,13); }
INLINE GEN ell_get_roots(GEN e) { return gel(e,14); }

INLINE int
ell_is_inf(GEN z) { return lg(z) < 3; }
INLINE int
ell_is_padic(GEN x) { return lg(x) == 20 && typ(gel(x,19)) == t_INT; }
INLINE int
ell_is_real(GEN x) { return lg(x) == 20 && typ(gel(x,19)) != t_INT; }
INLINE GEN
ellinf(void) { return mkvec(gen_0); }

/*******************************************************************/
/*                                                                 */
/*                    ALGEBRAIC NUMBER THEORY                      */
/*                                                                 */
/*******************************************************************/
INLINE GEN pr_get_p(GEN pr)  { return gel(pr,1); }
INLINE GEN pr_get_gen(GEN pr){ return gel(pr,2); }
/* .[2] instead of itos works: e and f are small positive integers */
INLINE long pr_get_e(GEN pr) { return gel(pr,3)[2]; }
INLINE long pr_get_f(GEN pr) { return gel(pr,4)[2]; }
INLINE GEN pr_get_tau(GEN pr){ return gel(pr,5); }
INLINE int
pr_is_inert(GEN P) { return pr_get_f(P) == lg(pr_get_gen(P))-1; }
INLINE GEN
pr_norm(GEN pr) { return powiu(pr_get_p(pr), pr_get_f(pr)); }

/* assume nf a genuine nf */
INLINE long
nf_get_varn(GEN nf) { return varn(gel(nf,1)); }
INLINE GEN
nf_get_pol(GEN nf) { return gel(nf,1); }
INLINE long
nf_get_degree(GEN nf) { return degpol( nf_get_pol(nf) ); }
INLINE long
nf_get_r1(GEN nf) { GEN x = gel(nf,2); return itou(gel(x,1)); }
INLINE long
nf_get_r2(GEN nf) { GEN x = gel(nf,2); return itou(gel(x,2)); }
INLINE GEN
nf_get_disc(GEN nf) { return gel(nf,3); }
INLINE GEN
nf_get_index(GEN nf) { return gel(nf,4); }
INLINE GEN
nf_get_M(GEN nf) { return gmael(nf,5,1); }
INLINE GEN
nf_get_G(GEN nf) { return gmael(nf,5,2); }
INLINE GEN
nf_get_roundG(GEN nf) { return gmael(nf,5,3); }
INLINE GEN
nf_get_Tr(GEN nf) { return gmael(nf,5,4); }
INLINE GEN
nf_get_diff(GEN nf) { return gmael(nf,5,5); }
INLINE GEN
nf_get_roots(GEN nf) { return gel(nf,6); }
INLINE GEN
nf_get_zk(GEN nf) { return gel(nf,7); }
INLINE GEN
nf_get_invzk(GEN nf) { return gel(nf,8); }
INLINE void
nf_get_sign(GEN nf, long *r1, long *r2)
{
  GEN x = gel(nf,2);
  *r1 = itou(gel(x,1));
  *r2 = itou(gel(x,2));
}

INLINE GEN
bnf_get_nf(GEN bnf) { return gel(bnf,7); }
INLINE GEN
bnf_get_clgp(GEN bnf) { return gmael(bnf,8,1); }
INLINE GEN
bnf_get_no(GEN bnf) { return gmael3(bnf,8,1,1); }
INLINE GEN
bnf_get_cyc(GEN bnf) { return gmael3(bnf,8,1,2); }
INLINE GEN
bnf_get_gen(GEN bnf) { return gmael3(bnf,8,1,3); }
INLINE GEN
bnf_get_reg(GEN bnf) { return gmael(bnf,8,2); }
INLINE GEN
bnf_get_logfu(GEN bnf) { return gel(bnf,3); }
INLINE GEN
bnf_get_tuU(GEN bnf) { return gmael3(bnf,8,4,2); }
INLINE long
bnf_get_tuN(GEN bnf) { return gmael3(bnf,8,4,1)[2]; }
INLINE GEN
bnf_get_fu(GEN bnf) {
  GEN fu = bnf_get_fu_nocheck(bnf);
  if (typ(fu) == t_MAT) pari_err(talker,"missing units in bnf");
  return fu;
}
INLINE GEN
bnf_get_fu_nocheck(GEN bnf) { return gmael(bnf,8,5); }

INLINE GEN
bnr_get_bnf(GEN bnr) { return gel(bnr,1); }
INLINE GEN
bnr_get_bid(GEN bnr) { return gel(bnr,2); }
INLINE GEN
bnr_get_mod(GEN bnr) { return gmael(bnr,2,1); }
INLINE GEN
bnr_get_nf(GEN bnr) { return gmael(bnr,1,7); }
INLINE GEN
bnr_get_clgp(GEN bnr) { return gel(bnr,5); }
INLINE GEN
bnr_get_no(GEN bnr) { return gmael(bnr,5,1); }
INLINE GEN
bnr_get_cyc(GEN bnr) { return gmael(bnr,5,2); }
INLINE GEN
bnr_get_gen_nocheck(GEN bnr) { return gmael(bnr,5,3); }
INLINE GEN
bnr_get_gen(GEN bnr) {
  GEN G = bnr_get_clgp(bnr);
  if (lg(G) !=  4)
    pari_err(talker,"missing bnr generators: please use bnrinit(,,1)");
  return gel(G,3);
}

INLINE GEN
bid_get_mod(GEN bid) { return gel(bid,1); }
INLINE GEN
bid_get_ideal(GEN bid) { return gmael(bid,1,1); }
INLINE GEN
bid_get_arch(GEN bid) { return gmael(bid,1,2); }
INLINE GEN
bid_get_cyc(GEN bid) { return gmael(bid,2,2); }
INLINE GEN
bid_get_gen_nocheck(GEN bid) { return gmael(bid,2,3); }
INLINE GEN
bid_get_gen(GEN bid) {
  GEN G = gel(bid, 2);
  if (lg(G) != 4) pari_err(talker,"missing bid generators. Use idealstar(,,2)");
  return gel(G,3);
}
INLINE GEN
gal_get_pol(GEN gal) { return gel(gal,1); }
INLINE GEN
gal_get_p(GEN gal) { return gmael(gal,2,1); }
INLINE GEN
gal_get_e(GEN gal) { return gmael(gal,2,2); }
INLINE GEN
gal_get_mod(GEN gal) { return gmael(gal,2,3); }
INLINE GEN
gal_get_roots(GEN gal) { return gel(gal,3); }
INLINE GEN
gal_get_invvdm(GEN gal) { return gel(gal,4); }
INLINE GEN
gal_get_den(GEN gal) { return gel(gal,5); }
INLINE GEN
gal_get_group(GEN gal) { return gel(gal,6); }
INLINE GEN
gal_get_gen(GEN gal) { return gel(gal,7); }
INLINE GEN
gal_get_orders(GEN gal) { return gel(gal,8); }

/* assume rnf a genuine rnf */
INLINE long
rnf_get_degree(GEN rnf) { return degpol(gel(rnf,1)); }

/* I integral (not necessarily HNF), G ZM, rounded Cholesky form of a weighted
 * T2 matrix. Return m in I with T2(m) small */
INLINE GEN
idealpseudomin(GEN I, GEN G)
{
  GEN u = ZM_lll(ZM_mul(G, I), 0.99, LLL_IM);
  return ZM_ZC_mul(I, gel(u,1));
}
/* I, G as in idealpseudomin. Return an irrational m in I with T2(m) small */
INLINE GEN
idealpseudomin_nonscalar(GEN I, GEN G)
{
  GEN u = ZM_lll(ZM_mul(G, I), 0.99, LLL_IM);
  GEN m = ZM_ZC_mul(I, gel(u,1));
  if (ZV_isscalar(m) && lg(u) > 2) m = ZM_ZC_mul(I, gel(u,2));
  return m;
}

INLINE GEN
idealred_elt(GEN nf, GEN I) {
  pari_sp av = avma;
  GEN u = idealpseudomin(I, nf_get_roundG(nf));
  return gerepileupto(av, u);
}
INLINE GEN
idealred(GEN nf, GEN I) { return idealred0(nf, I, NULL); }
