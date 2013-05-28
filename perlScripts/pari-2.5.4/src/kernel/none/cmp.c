#line 2 "../src/kernel/none/cmp.c"
/* $Id$

Copyright (C) 2002-2003  The PARI group.

This file is part of the PARI/GP package.

PARI/GP is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation. It is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY WHATSOEVER.

Check the License for details. You should have received a copy of it, along
with the package; see the file 'COPYING'. If not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA. */


/********************************************************************/
/**                                                                **/
/**                      Comparison routines                       **/
/**                                                                **/
/********************************************************************/

/*They depend on absi_cmp_lg and absi_equal_lg in mp.c*/

int
equalii(GEN x, GEN y)
{
  if ((x[1] & (LGBITS|SIGNBITS)) != (y[1] & (LGBITS|SIGNBITS))) return 0;
  return absi_equal_lg(x, y, lgefint(x));
}

int
cmpii(GEN x, GEN y)
{
  const long sx = signe(x), sy = signe(y);
  long lx,ly;

  if (sx<sy) return -1;
  if (sx>sy) return 1;
  if (!sx) return 0;

  lx=lgefint(x); ly=lgefint(y);
  if (lx>ly) return sx;
  if (lx<ly) return -sx;
  if (sx>0)
    return absi_cmp_lg(x, y, lx);
  else
    return -absi_cmp_lg(x, y, lx);
}

int
equalrr(GEN x, GEN y)
{
  long lx, ly, i;

  if (!signe(x)) return signe(y) == 0; /* all zeroes are equal */
  if (x[1] != y[1]) return 0; /* includes signe(y) = 0 */

  lx = lg(x);
  ly = lg(y);
  if (lx < ly)
  {
    i=2; while (i<lx && x[i]==y[i]) i++;
    if (i<lx) return 0;
    for (; i < ly; i++) if (y[i]) return 0;
  }
  else
  {
    i=2; while (i<ly && x[i]==y[i]) i++;
    if (i<ly) return 0;
    for (; i < lx; i++) if (x[i]) return 0;
  }
  return 1;
}

int
cmprr(GEN x, GEN y)
{
  const long sx = signe(x), sy = signe(y);
  long ex,ey,lx,ly,lz,i;

  if (sx<sy) return -1;
  if (sx>sy) return 1;
  if (!sx) return 0;

  ex=expo(x); ey=expo(y);
  if (ex>ey) return sx;
  if (ex<ey) return -sx;

  lx=lg(x); ly=lg(y); lz = (lx<ly)?lx:ly;
  i=2; while (i<lz && x[i]==y[i]) i++;
  if (i<lz) return ((ulong)x[i] > (ulong)y[i]) ? sx : -sx;
  if (lx>=ly)
  {
    while (i<lx && !x[i]) i++;
    return (i==lx) ? 0 : sx;
  }
  while (i<ly && !y[i]) i++;
  return (i==ly) ? 0 : -sx;
}

/* x and y are integers. Return 1 if |x| == |y|, 0 otherwise */
int
absi_equal(GEN x, GEN y)
{
  long lx;

  if (!signe(x)) return !signe(y);
  if (!signe(y)) return 0;

  lx=lgefint(x); if (lx != lgefint(y)) return 0;
  return absi_equal_lg(x, y, lx);
}

/* x and y are integers. Return sign(|x| - |y|) */
int
absi_cmp(GEN x, GEN y)
{
  long lx,ly;

  if (!signe(x)) return signe(y)? -1: 0;
  if (!signe(y)) return 1;

  lx=lgefint(x); ly=lgefint(y);
  if (lx>ly) return 1;
  if (lx<ly) return -1;
  return absi_cmp_lg(x, y, lx);
}

/* x and y are reals. Return sign(|x| - |y|) */
int
absr_cmp(GEN x, GEN y)
{
  long ex,ey,lx,ly,lz,i;

  if (!signe(x)) return signe(y)? -1: 0;
  if (!signe(y)) return 1;

  ex=expo(x); ey=expo(y);
  if (ex>ey) return  1;
  if (ex<ey) return -1;

  lx=lg(x); ly=lg(y); lz = (lx<ly)?lx:ly;
  i=2; while (i<lz && x[i]==y[i]) i++;
  if (i<lz) return ((ulong)x[i] > (ulong)y[i])? 1: -1;
  if (lx>=ly)
  {
    while (i<lx && !x[i]) i++;
    return (i==lx)? 0: 1;
  }
  while (i<ly && !y[i]) i++;
  return (i==ly)? 0: -1;
}

