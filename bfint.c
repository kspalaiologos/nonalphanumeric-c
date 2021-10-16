#include "sym_c.h"
%define return
%define int
%define char
DO_WHILE4(B,A,int,G,char*D,int E,int F,int G,D,E+F,F,G+(F*(D[E+F]=='['?1:D[E+F]==']'?-1:0)),E);
WHILE7(C,int,E<I,int F,int(*G)(int),int(*H)(),char*D,int I,int*J,int E,*(J+=D[E]=='>'?1:D[E]=='<'?-1:0)+=D[E]=='+'?1:D[E]=='-'?-1:D[E]=='.'?(G(*J),0):D[E]==','?(H()-*J):0,G,H,D,I,J,(D[E]=='['?(!*J?B(D,E,1,1):E):D[E]==']'?(B(D,E,-1,1)-1):E)+1,0)
int RUN_BF(int(*G)(int),int(*H)(),char*D,int I){int F[65536]={0};return C(0,G,H,D,I,F,0);}
