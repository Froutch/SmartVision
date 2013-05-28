/* $Id: whatnow.c 7526 2005-12-09 21:04:53Z kb $

Copyright (C) 2000  The PARI group.

This file is part of the PARI/GP package.

PARI/GP is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation. It is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY WHATSOEVER.

Check the License for details. You should have received a copy of it, along
with the package; see the file 'COPYING'. If not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. */

#include "pari.h"
#include "paripriv.h"
#include "../language/anal.h"

typedef struct whatnow_t
{
  char *name, *oldarg, *newarg;
} whatnow_t;

#define SAME NULL
#define REMOV (char *)1L
#define _REMOV {REMOV,NULL,NULL}
#define _SAME  {SAME,NULL,NULL}

/* generated by PERL script ../util/dico */
static const whatnow_t whatnowlist[]={
_SAME,
_SAME,
_SAME,
_SAME,
{"elladd","(e,z1,z2)","(e,z1,z2)"},
_SAME,
{"matadjoint","(x)","(x)"},
_SAME,
{"ellak","(e,n)","(e,n)"},
_SAME,
{"algdep","(x,n,dec)","(x,n,dec)"},
{"nfalgtobasis","(nf,x)","(nf,x)"},
{"ellan","(e,n)","(e,n)"},
{"ellap","(e,n)","(e,n)"},
{"ellap","(e,n)","(e,n,1)"},
{"padicappr","(x,a)","(x,a)"},
_SAME,
_SAME,
_SAME,
{"matcompanion","(x)","(x)"},
_SAME,
_SAME,
{"nfbasis","(x)","(x)"},
{"nfbasis","(x)","(x,2)"},
{"nfbasistoalg","(nf,x)","(nf,x)"},
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
{"ellbil","(e,z1,z2)","(e,z1,z2)"},
{"binomial","(x,y)","(x,y)"},
_SAME,
_SAME,
{"contfrac","(x,lmax)","(x,,lmax)"},
{"factor","(x,lim)","(x,lim)"},
{"bnfcertify","(bnf)","(bnf)"},
{"bnfunit","(bnf)","(bnf)"},
{"bnfclassunit","(P)","(P,2)"},
{"bnfclassunit","(P)","(P,1)"},
{"bnfclassunit","(P)","(P)"},
{"quadclassunit","(D,c1,c2,g)","(D,,[c1,c2,g])"},
{"bnfinit","(P)","(P,2)"},
{"bnfinit","(P)","(P,1)"},
{"bnfinit","(P)","(P)"},
{"bnfnarrow","(bnf)","(bnf)"},
{"bnrclass","(bnf,ideal)","(bnf,ideal)"},
{"bnrclass","(bnf,ideal)","(bnf,ideal,1)"},
{"bnrclass","(bnf,ideal)","(bnf,ideal,2)"},
{"quadclassunit","(D)","(D)"},
{"sizebyte","(x)","(x)"},
_SAME,
_SAME,
{"contfrac","(x)","(x)"},
{"contfrac","(b,x)","(x,b)"},
_SAME,
{"charpoly","(x,y)","(x,y)"},
{"charpoly","(x,y)","(x,y,1)"},
{"charpoly","(x,y)","(x,y,2)"},
{"ellchangecurve","(x,y)","(x,y)"},
_SAME,
{"ellchangepoint","(x,y)","(x,y)"},
{"qfbclassno","(x)","(x)"},
{"qfbclassno","(x)","(x,1)"},
{"polcoeff","(x,s)","(x,s)"},
{"x*y","(x,y)",""},
{"component","(x,s)","(x,s)"},
{"polcompositum","(pol1,pol2)","(pol1,pol2)"},
{"polcompositum","(pol1,pol2)","(pol1,pol2,1)"},
{"qfbcompraw","(x,y)","(x,y)"},
_SAME,
{"bnrconductor","(a1)","(a1)"},
{"bnrconductorofchar","(bnr,chi)","(bnr,chi)"},
_SAME,
_SAME,
_SAME,
{"serconvol","(x,y)","(x,y)"},
_SAME,
{"core","(x)","(x,1)"},
_SAME,
{"coredisc","(x)","(x,1)"},
_SAME,
_SAME,
{"truncate","(x)","(x,&e)"},
{"polcyclo","(n)","(n)"},
{"factorback","(fa)","(fa)"},
{"bnfdecodemodule","(nf,fa)","(nf,fa)"},
{"poldegree","(x)","(x)"},
{"denominator","(x)","(x)"},
{"lindep","(x)","(x,-1)"},
_SAME,
{"matdet","(x)","(x)"},
{"matdet","(x)","(x,1)"},
{"matdetint","(x)","(x)"},
{"matdiagonal","(x)","(x)"},
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
{"poldisc","(x)","(x)"},
{"nfdisc","(x)","(x)"},
{"nfdisc","(x)","(x,2)"},
{"bnrdisc","(bnr,subgroup)","(bnr,subgroup)"},
{"bnrdisc","(bnr)","(bnr,,,2)"},
{"bnrdisclist","(bnf,list)","(bnf,list)"},
{"bnrdisclist","(bnf,arch,bound)","(bnf,bound,arch)"},
{"bnrdisclist","(bnf,bound)","(bnf,bound,,1)"},
{"bnrdisclist","(bnf,bound)","(bnf,bound)"},
{"bnrdisc","(bnr,subgroup)","(bnr,subgroup,,1)"},
{"bnrdisc","(bnr,subgroup)","(bnr,subgroup,,3)"},
_SAME,
{"divrem","(x,y)","(x,y)"},
{"sumdiv","(n,X,expr)","(n,X,expr)"},
{"mateigen","(x)","(x)"},
_SAME,
_SAME,
_SAME,
{"Euler","",""},
_SAME,
_SAME,
{"vecextract","(x,y)","(x,y)"},
{"factorial","(x)","(x)"},
{"factorcantor","(x,p)","(x,p)"},
{"factorff","(x,p,a)","(x,p,a)"},
{"factormod","(x,p)","(x,p)"},
_SAME,
{"nfbasis","(x,p)","(x,,p)"},
{"nfdisc","(x,p)","(x,,p)"},
{"polred","(x,p)","(x,,p)"},
{"polred","(x,p)","(x,2,p)"},
_SAME,
_SAME,
{"factorpadic","(x,p,r)","(x,p,r,1)"},
{"factor","(x,l,hint)","(x)"},
{"factor","(x,l,hint)","(x)"},
{"fibonacci","(x)","(x)"},
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
{"ffinit","(p,n)","(p,n)"},
_SAME,
{"polgalois","(x)","(x)"},
{"nfgaloisapply","(nf,aut,x)","(nf,aut,x)"},
{"nfgaloisconj","(nf)","(nf)"},
{"nfgaloisconj","(nf)","(nf,2)"},
{"nfgaloisconj","","(nf,1)"},
{"gammah","(x)","(x)"},
_SAME,
{"matsolve","(a,b)","(a,b)"},
{"matsolvemod","(M,D,Y)","(M,D,Y)"},
{"matsolvemod","(M,D,Y)","(M,D,Y,1)"},
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
{"ellglobalred","(x,y)","(x,y)"},
_REMOV,
{"qfbhclassno","(x)","(x)"},
{"ellheight","(e,x)","(e,x)"},
{"ellheight","(e,x)","(e,x,1)"},
{"mathnf","(x)","(x)"},
{"mathnf","(x)","(x,1)"},
_REMOV,
{"mathnfmod","(x,d)","(x,d)"},
{"mathnfmodid","(x,d)","(x,d)"},
{"mathnf","(x)","(x,3)"},
{"mathess","(x)","(x)"},
{"hilbert","(x,y)","(x,y)"},
{"mathilbert","(n)","(n)"},
{"hilbert","(x,y,p)","(x,y,p)"},
{"vector","(n,X,expr)","(n,X,expr)"},
_SAME,
{"I","",""},
_SAME,
{"idealaddtoone","(nf,list)","(nf,list)"},
{"idealaddtoone","(nf,x,y)","(nf,x,y)"},
_SAME,
{"idealappr","(nf,x)","(nf,x,1)"},
_SAME,
_SAME,
_SAME,
{"idealdiv","(nf,x,y)","(nf,x,y,1)"},
_SAME,
{"idealhnf","(nf,x)","(nf,x)"},
{"idealhnf","(nf,x)","(nf,x)"},
_SAME,
_SAME,
{"idealinv","(nf,x)","(nf,x,1)"},
_SAME,
_SAME,
{"ideallistarch","(nf,list,arch)","(nf,list,arch)"},
{"ideallist","(nf,list)","(nf,list,2)"},
{"ideallistarch","","(nf,list,arch)"},
{"ideallistarch","","(nf,list,arch)"},
{"ideallist","","(nf,list,3)"},
{"ideallist","(nf,bound)","(nf,bound)"},
{"ideallist","(nf,bound)","(nf,bound,1)"},
{"idealred","(nf,x,vdir)","(nf,x,vdir)"},
_SAME,
{"idealmul","(nf,x,y)","(nf,x,y,1)"},
_SAME,
_SAME,
{"idealpow","(nf,x,y)","(nf,x,y,1)"},
_SAME,
{"idealtwoelt","(nf,x,a)","(nf,x,a)"},
_SAME,
{"matid","(n)","(n)"},
_SAME,
_SAME,
{"matimage","(x)","(x)"},
{"matimage","(x)","(x,1)"},
{"matimagecompl","(x)","(x)"},
_SAME,
_REMOV,
_REMOV,
_REMOV,
{"incgam","(s,x,y)","(s,x,y)"},
{"matindexrank","(x)","(x)"},
{"vecsort","(x)","(x,,1)"},
{"nfinit","(pol)","(pol)"},
{"nfinit","(x)","(x,2)"},
{"nfinit","(x)","(x,3)"},
{"ellinit","(x)","(x)"},
{"zetakinit","(x)","(x)"},
{"intformal","(x,y)","(x,y)"},
{"matintersect","(x,y)","(x,y)"},
{"intnum","(x=a,b,s)","(x=a,b,s,1)"},
{"intnum","(x=a,b,s)","(x=a,b,s,2)"},
_SAME,
{"intnum","(x=a,b,s)","(x=a,b,s,3)"},
{"matinverseimage","(x,y)","(x,y)"},
{"matisdiagonal","(x)","(x)"},
{"isfundamental","(x)","(x)"},
{"nfisideal","(nf,x)","(nf,x)"},
{"nfisincl","(x,y)","(x,y)"},
{"nfisincl","(nf1,nf2)","(nf1,nf2,1)"},
{"polisirreducible","(x)","(x)"},
{"nfisisom","(x,y)","(x,y)"},
{"nfisisom","(x,y)","(x,y)"},
{"ellisoncurve","(e,x)","(e,x)"},
_SAME,
{"bnfisprincipal","(bnf,x)","(bnf,x,0)"},
{"bnfisprincipal","(bnf,x)","(bnf,x,2)"},
{"bnfisprincipal","(bnf,x)","(bnf,x)"},
{"bnfisprincipal","(bnf,x)","(bnf,x,3)"},
{"bnrisprincipal","(bnf,x)","(bnf,x)"},
_SAME,
{"ispseudoprime","(x)","(x)"},
{"sqrtint","(x)","(x)"},
{"setisset","(x)","(x)"},
{"issquarefree","(x)","(x)"},
_SAME,
{"bnfisunit","(bnf,x)","(bnf,x)"},
{"qfjacobi","(x)","(x)"},
{"besseljh","(n,x)","(n,x)"},
{"ellj","(x)","(x)"},
_REMOV,
{"besselk","(nu,x)","(nu,x)"},
{"besselk","(nu,x)","(nu,x,1)"},
{"matker","(x)","(x)"},
{"matker","(x)","(x,1)"},
{"matkerint","(x)","(x)"},
{"matkerint","(x)","(x,1)"},
_REMOV,
{"kronecker","(x,y)","(x,y)"},
_REMOV,
{"zetak","(nfz,s)","(nfz,s,1)"},
{"serlaplace","(x)","(x)"},
_SAME,
{"pollegendre","(n)","(n)"},
_SAME,
_SAME,
{"vecsort","(x)","(x,,2)"},
_SAME,
_SAME,
{"lindep","(x)","(x,1)"},
{"qflll","(x)","(x)"},
_REMOV,
{"qflll","(x)","(x,8)"},
{"qflllgram","(x)","(x)"},
_REMOV,
{"qflllgram","(x)","(x,8)"},
{"qflllgram","(x)","(x,1)"},
{"qflllgram","(x)","(x,4)"},
{"qflllgram","(x)","(x,5)"},
{"qflll","(x)","(x,1)"},
{"qflll","(x)","(x,2)"},
{"qflll","(x)","(x,4)"},
{"qflll","(x)","(x,5)"},
_REMOV,
{"log","(x)","(x)"},
_SAME,
{"elllocalred","(e)","(e)"},
_SAME,
{"log","(x)","(x,1)"},
{"elllseries","(e,s,N,A)","(e,s,A)"},
{"bnfmake","(sbnf)","(sbnf)"},
{"Mat","(x)","(x)"},
{"vecextract","(x,y,z)","(x,y,z)"},
{"ellheightmatrix","(e,x)","(e,x)"},
_SAME,
_SAME,
{"matrixqz","(x,p)","(x,-1)"},
{"matrixqz","(x,p)","(x,-2)"},
_SAME,
_SAME,
_SAME,
{"idealmin","(nf,ix,vdir)","(nf,ix,vdir)"},
{"qfminim","(x,bound,maxnum)","(x,bound,maxnum)"},
{"qfminim","(x,bound)","(x,bound,,1)"},
{"Mod","(x,y)","(x,y)"},
{"Mod","(x,y,p)","(x,y,1)"},
_SAME,
{"gcd","(x,y)","(x,y,1)"},
{"moebius","(n)","(n)"},
_SAME,
_SAME,
_SAME,
{"nfeltdiv","(nf,a,b)","(nf,a,b)"},
{"nfeltdiveuc","(nf,a,b)","(nf,a,b)"},
{"nfeltdivrem","(nf,a,b)","(nf,a,b)"},
{"nfhnf","(nf,x)","(nf,x)"},
{"nfhnfmod","(nf,x,detx)","(nf,x,detx)"},
{"nfeltmod","(nf,a,b)","(nf,a,b)"},
{"nfeltmul","(nf,a,b)","(nf,a,b)"},
{"nfeltpow","(nf,a,k)","(nf,a,k)"},
{"nfeltreduce","(nf,a,id)","(nf,a,id)"},
{"nfsnf","(nf,x)","(nf,x)"},
{"nfeltval","(nf,a,pr)","(nf,a,pr)"},
_SAME,
_SAME,
{"qfbnucomp","(x,y,l)","(x,y,l)"},
_SAME,
{"numerator","(x)","(x)"},
{"qfbnupow","(x,n)","(x,n)"},
{"O","(x)","(x)"},
_SAME,
{"ellordinate","(e,x)","(e,x)"},
{"znorder","(x)","(x)"},
{"ellorder","(e,x)","(e,x)"},
{"polredord","(x)","(x)"},
_SAME,
{"matpascal","(n)","(n)"},
{"qfperfection","(a)","(a)"},
{"numtoperm","(n,k)","(n,k)"},
{"permtonum","(vect)","(vect)"},
{"qfbprimeform","(x,p)","(x,p)"},
{"eulerphi","(x)","(x)"},
{"Pi","",""},
{"contfracpnqn","(x)","(x)"},
{"ellztopoint","(e,z)","(e,z)"},
{"polinterpolate","(xa,ya,x)","(xa,ya,p)"},
_SAME,
{"polred","(x)","(x,2)"},
_SAME,
{"polredabs","(x)","(x,1)"},
{"polredabs","(x)","(x,4)"},
{"polredabs","(x)","(x,8)"},
{"polredabs","(x)","(x,2)"},
_SAME,
{"variable","(x)","(x)"},
{"Pol","(x,v)","(x,v)"},
_SAME,
{"polylog","(m,x)","(m,x,1)"},
{"polylog","(m,x)","(m,x,2)"},
{"polylog","(m,x)","(m,x,3)"},
{"Polrev","(x,v)","(x,v)"},
{"polzagier","(n,m)","(n,m)"},
{"ellpow","(e,x,n)","(e,x,n)"},
{"qfbpowraw","(x,n)","(x,n)"},
{"precision","(x,n)","(x,n)"},
_SAME,
_SAME,
{"idealprimedec","(nf,p)","(nf,p)"},
_SAME,
{"znprimroot","(n)","(n)"},
{"idealprincipal","(nf,x)","(nf,x)"},
{"ideleprincipal","(nf,x)","(nf,x)"},
{"prod","(x,X=a,b,expr)","(X=a,b,expr,x)"},
_SAME,
_SAME,
{"prodinf","(X=a,expr)","(X=a,expr,1)"},
_SAME,
{"Qfb","(a,b,c)","(a,b,c)"},
{"Qfb","(a,b,c,d)","(a,b,c,d)"},
_SAME,
_SAME,
_SAME,
_SAME,
{"matrank","(x)","(x)"},
{"bnrclassno","(bnf,x)","(bnf,x)"},
{"bnrclassnolist","(bnf,liste)","(bnf,liste)"},
_SAME,
{"polrecip","(x)","(x)"},
{"qfbred","(x)","(x)"},
{"qfbred","(x)","(x)"},
{"qfbred","(x,d)","(x,2,,d)"},
{"poldiscreduced","(f)","(f)"},
{"quadregulator","(x)","(x)"},
_SAME,
{"polresultant","(x,y)","(x,y)"},
{"polresultant","(x,y)","(x,y,1)"},
{"serreverse","(x)","(x)"},
{"qfbred","(x)","(x,1)"},
{"qfbred","(x,d)","(x,3,,d)"},
{"round","(x)","(x,&e)"},
_SAME,
{"rnfdisc","(nf,pol)","(nf,pol)"},
_SAME,
{"rnfequation","(nf,pol)","(nf,pol,1)"},
{"rnfhnfbasis","(bnf,order)","(bnf,order)"},
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
{"polrootsmod","(x,p)","(x,p)"},
{"polrootsmod","(x,p)","(x,p,1)"},
{"polrootspadic","(x,p,r)","(x,p,r)"},
{"polroots","(x)","(x)"},
{"nfrootsof1","(nf)","(nf)"},
{"polroots","(x)","(x,1)"},
_SAME,
{"round","(x)","(x,&e)"},
{"Ser","(x,v)","(x,v)"},
{"Set","(x)","(x)"},
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
_SAME,
{"sigma","(k,x)","(x,k)"},
_SAME,
{"qfsign","(x)","(x)"},
{"bnfsignunit","(bnf)","(bnf)"},
{"factormod","(x,p)","(x,p,1)"},
_SAME,
_SAME,
_SAME,
{"sizedigit","(x)","(x)"},
{"nfbasis","(x)","(x,1)"},
{"bnfinit","(x)","(x,3)"},
{"nfdisc","(x)","(x,1)"},
{"factor","(x)","(x,0)"},
{"ellinit","(x)","(x,1)"},
{"polred","(x)","(x,1)"},
{"polred","(x)","(x,3)"},
{"matsnf","(x)","(x)"},
{"matsnf","(x)","(x,1)"},
{"matsnf","(x)","(x,4)"},
{"matsnf","(x)","(x,2)"},
_SAME,
{"vecsort","(x)","(x)"},
_SAME,
{"qfgaussred","(x)","(x)"},
_SAME,
{"gcd","(x,y)","(x,y,2)"},
{"polsturm","(x)","(x)"},
{"polsturm","(x,a,b)","(x,a,b)"},
{"polsubcyclo","(p,d)","(p,d)"},
{"ellsub","(e,a,b)","(e,a,b)"},
_SAME,
{"sum","(x,X=a,b,expr)","(X=a,b,expr,x)"},
_SAME,
{"sumalt","(X=a,expr)","(X=a,expr,1)"},
_SAME,
_SAME,
{"sumpos","(X=a,expr)","(X=a,expr,1)"},
{"matsupplement","(x)","(x)"},
{"polsylvestermatrix","(x,y)","(x,y)"},
_SAME,
_SAME,
{"elltaniyama","(e)","(e)"},
_SAME,
{"poltchebi","(n)","(n)"},
{"teichmuller","(x)","(x)"},
_SAME,
_SAME,
_REMOV,
_REMOV,
{"elltors","(e)","(e)"},
_SAME,
{"mattranspose","(x)","(x)"},
{"truncate","(x)","(x)"},
{"poltschirnhaus","(x)","(x)"},
_REMOV,
{"quadunit","(x)","(x)"},
_SAME,
_SAME,
{"Vec","(x)","(x)"},
{"vecsort","(x)","(x,,1)"},
{"vecsort","(x)","(x,,2)"},
_SAME,
_SAME,
_SAME,
_SAME,
{"vectorv","(n,X,expr)","(n,X,expr)"},
{"ellwp","(e)","(e)"},
{"weber","(x)","(x)"},
{"weber","(x)","(x,2)"},
_SAME,
{"ellpointtoz","(e,P)","(e,P)"},
_SAME,
_SAME,
{"ideallog","(nf,x,bid)","(nf,x,bid)"},
{"idealstar","(nf,I)","(nf,I)"},
{"idealstar","(nf,id)","(nf,id,1)"},
{"idealstar","(nf,id)","(nf,id,2)"},
_SAME,

_SAME,
{"plotbox","(x,a)","(x,a)"},
{"plotcolor","(w,c)","(w,c)"},
{"plotcursor","(w)","(w)"},
_SAME,
{"plotdraw","(list)","(list)"},
{"plotinit","(w,x,y)","(w,x,y)"},
_SAME,
{"plotkill","(w)","(w)"},
{"plotlines","(w,x2,y2)","(w,x2,y2)"},
{"plotlines","(w,x2,y2)","(w,x2,y2)"},
{"plotmove","(w,x,y)","(w,x,y)"},
_SAME,
_SAME,
{"ploth","(X=a,b,expr)","(X=a,b,expr,1)"},
{"ploth","(X=a,b,expr)","(X=a,b,expr)"},
_SAME,
{"plotpoints","(w,x,y)","(w,x,y)"},
{"plotpoints","(w,x,y)","(w,x,y)"},
{"psdraw","(list)","(list)"},
{"psploth","(X=a,b,expr)","(X=a,b,expr)"},
{"psploth","(X=a,b,expr)","(X=a,b,expr,1)"},
{"psplothraw","(listx,listy)","(listx,listy)"},
{"printp","(x)","(x)"},
{"printp1","(x)","(x)"},
_SAME,
_SAME,
{"plotrbox","(w,dx,dy)","(w,dx,dy)"},
{"input","(x)","(x)"},
{"plotrline","(w,dx,dy)","(w,dx,dy)"},
{"plotrlines","(w,dx,dy)","(w,dx,dy,1)"},
{"plotrmove","(w,dx,dy)","(w,dx,dy)"},
{"plotrpoint","(w,dx,dy)","(w,dx,dy)"},
{"plotrpoints","(w,dx,dy)","(w,dx,dy)"},
{"plotscale","(w,x1,x2,y1,y2)","(w,x1,x2,y1,y2)"},
{"default","(n)","(realprecision,n)"},
{"default","(n)","(seriesprecision,n)"},
{"type","(x,t)","(x,t)"},
{"plotstring","(w,x)","(w,x)"},
_SAME,
{"printtex","(x)","(x)"},
_SAME
};

/* If flag = 0 (default): check if s existed in 1.39.15 and print verbosely
 * the answer.
 * If flag > 0: silently return n+1 if function changed, 0 otherwise.
 *   (where n is the index of s in whatnowlist).
 * If flag < 0: -flag-1 is the index in whatnowlist
 */
int
whatnow(char *s, int flag)
{
  int n;
  char *def;
  whatnow_t wp;
  entree *ep;

  if (flag < 0) { n = -flag; flag = 0; }
  else
  {
    if (flag && strlen(s)==1) return 0; /* special case "i" and "o" */
    if (!is_identifier(s) || !is_entry_intern(s,funct_old_hash,NULL))
    {
      if (flag) return 0;
      pari_err(talker,"as far as I can recall, this function never existed");
    }
    n = 0;
    do
      def = (oldfonctions[n++]).name;
    while (def && strcmp(def,s));
    if (!def)
    {
      int m=0;
      do
        def = (functions_oldgp[m++]).name;
      while (def && strcmp(def,s));
      n += m - 1;
    }
  }

  wp=whatnowlist[n-1]; def=wp.name;
  if (def == SAME)
  {
    if (flag) return 0;
    pari_err(talker,"this function did not change");
  }
  if (flag) return n;

  if (def == REMOV)
    pari_err(talker,"this function was suppressed");
  if (!strcmp(def,"x*y"))
  {
    pariprintf("  %s is now called *.\n\n",s);
    pariprintf("    %s%s ===> %s%s\n\n",s,wp.oldarg,wp.name,wp.newarg);
    return 1;
  }
  ep = is_entry(wp.name);
  if (!ep) pari_err(bugparier,"whatnow");
  pariputs("New syntax: "); term_color(c_ERR);
  pariprintf("%s%s ===> %s%s\n\n",s,wp.oldarg,wp.name,wp.newarg);
  term_color(c_HELP);
  print_text(ep->help); pariputc('\n');
  term_color(c_NONE); return 1;
}
