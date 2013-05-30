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
#include "pari.h"
#include "paripriv.h"

/********************************************************************/
/*                                                                  */
/*                    GENERAL HASHTABLES                            */
/*                                                                  */
/********************************************************************/
/* http://planetmath.org/encyclopedia/GoodHashTablePrimes.html */
static const ulong hashprimes[] = {
  53, 97, 193, 389, 769, 1543, 3079, 6151, 12289, 24593, 49157, 98317, 196613,
  393241, 786433, 1572869, 3145739, 6291469, 12582917, 25165843, 50331653,
  100663319, 201326611, 402653189, 805306457, 1610612741
};
static const int hashprimes_len = sizeof(hashprimes) / sizeof(hashprimes[0]);

INLINE void
setlen(hashtable *h, ulong len) {
  h->maxnb = (ulong)ceil(len * 0.65);
  h->len  = len;
}

static int
get_prime_index(ulong len)
{
  int i;
  for (i=0; i < hashprimes_len; i++)
    if (hashprimes[i] > len) return i;
  pari_err(talker, "hash table too large");
  return -1; /* not reached */
}

/* link hashentry e to hashtable h, setting e->hash / e->next */
INLINE void
hash_link(hashtable *h, hashentry *e)
{
  ulong index;
  e->hash = h->hash(e->key); index = e->hash % h->len;
  e->next = h->table[index]; h->table[index] = e;
}

hashtable *
hash_create(ulong minsize, ulong (*hash)(void*), int (*eq)(void*,void*))
{
  hashtable *h = (hashtable*)pari_malloc(sizeof(hashtable));
  int i = get_prime_index(minsize);
  ulong len = hashprimes[i];

  h->table = (hashentry**)pari_calloc(len * sizeof(hashentry*));
  h->pindex = i;
  h->nb = 0;
  h->hash = hash;
  h->eq   = eq;
  setlen(h, len); return h;
}

void
hash_insert(hashtable *h, void *k, void *v)
{
  hashentry *e = (hashentry*) pari_malloc(sizeof(hashentry));
  ulong index;

  if (++(h->nb) > h->maxnb && h->pindex < hashprimes_len-1)
  { /* double table size */
    ulong i, newlen = hashprimes[++(h->pindex)];
    hashentry *E, **newtable = (hashentry**)pari_calloc(newlen*sizeof(hashentry*));
    for (i = 0; i < h->len; i++)
      while ( (E = h->table[i]) )
      {
        h->table[i] = E->next;
        index = E->hash % newlen;
        E->next = newtable[index];
        newtable[index] = E;
      }
    free(h->table); h->table = newtable;
    setlen(h, newlen);
  }
  e->key = k;
  e->val = v; hash_link(h, e);
}

/* returns entry associated with key k or NULL */
hashentry *
hash_search(hashtable *h, void *k)
{
  ulong hash = h->hash(k);
  hashentry *e = h->table[ hash % h->len ];
  while (e)
  {
    if (hash == e->hash && h->eq(k, e->key)) return e;
    e = e->next;
  }
  return NULL; /* not found */
}

hashentry *
hash_remove(hashtable *h, void *k)
{
  ulong hash = h->hash(k), index = hash % h->len;
  hashentry **pE = &(h->table[index]), *e = *pE;
  while (e)
  {
    if (hash == e->hash && h->eq(k, e->key)) {
      *pE = e->next; h->nb--;
      return e;
    }
    pE = &(e->next);
    e = e->next;
  }
  return NULL;
}
void
hash_destroy(hashtable *h)
{
  ulong i;
  for (i = 0; i < h->len; i++)
  {
    hashentry *e = h->table[i];
    while (e) { hashentry *f = e; e = e->next; free(f); }
  }
  free(h->table); free(h);
}

static
int strequal(void *a, void *b) { return !strcmp((char*)a,(char*)b); }
hashtable *
hashstr_import_static(hashentry *e, ulong size)
{
  hashtable *h = hash_create(size, (ulong (*)(void *))hash_str, strequal);
  for ( ; e->key; e++) hash_link(h, e);
  return h;
}

void
hashstr_dbg(hashtable *h)
{
  ulong n, Total = 0, Max = 0;
  hashentry *e, **table = h->table;
  for (n=0; n < h->len; n++)
  {
    ulong m=0;
    for (e=table[n]; e; e=e->next) m++;
    Total += m; if (Max < m) Max = m;
    pari_printf("%4ld:%2ld ",n,m);
    if (n%9 == 8) pari_putc('\n');
  }
  pari_printf("\nTotal = %ld, Max = %ld\n", Total, Max);
}

/********************************************************************/
/*                                                                  */
/*                          HASH FUNCTIONS                          */
/*                                                                  */
/********************************************************************/

INLINE ulong
compound(ulong h, ulong a) { return (h << 1) ^ a; }
ulong
hash_GEN(GEN x)
{
  ulong h = x[0];
  long tx = typ(x), lx, i;
  switch(tx)
  { /* non recursive types */
    case t_INT:
      lx = lgefint(x);
      h &= TYPBITS;
      for (i = 1; i < lx; i++) h = compound(h, (ulong)x[i]);
      return h;
    case t_REAL:
    case t_STR:
    case t_VECSMALL:
      lx = lg(x);
      for (i = 1; i < lx; i++) h = compound(h, (ulong)x[i]);
      return h;
    /* one more special case */
    case t_LIST:
      x = list_data(x);
      if (!x) return h;
      /* fall through */
    default:
      if (lontyp[tx] == 2) { h = compound(h, x[1]); i = 2; } else i = 1;
      lx = lg(x);
      for (; i < lx; i++) h = compound(h, hash_GEN(gel(x,i)));
      return h;
  }
}

/* djb's hash */
ulong
hash_str(const char *str)
{
  ulong hash = 5381, c;
  while ( (c = (ulong)*str++) )
    hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
  return hash;
}

/* hashvalue's underlying hash function */
ulong
hash_str2(const char *s)
{
  ulong n = 0, c;
  while ( (c = (ulong)*s++) ) n = (n<<1) ^ c;
  return n;
}