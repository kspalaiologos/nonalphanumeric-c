
// FOR1(f, f2, int, int i, 0, i < 10, i + 1, int x, x + 1, x)

#define FOR5(name, name2, r, i, v, cond, postop, a1, a2, a3, a4, a5, an1, an2, an3, an4, an5, d) \
    r name2(a1,a2,a3,a4,a5,i){return(cond)?name2(an1,an2,an3,an4,an5,postop):d;} \
    r name(a1,a2,a3,a4,a5){return name2(an1,an2,an3,an4,an5,v);}

#define FOR4(name, name2, r, i, v, cond, postop, a1, a2, a3, a4, an1, an2, an3, an4, d) \
    r name2(a1,a2,a3,a4,i){return(cond)?name2(an1,an2,an3,an4,postop):d;} \
    r name(a1,a2,a3,a4){return name2(an1,an2,an3,an4,v);}

#define FOR3(name, name2, r, i, v, cond, postop, a1, a2, a3, an1, an2, an3, d) \
    r name2(a1,a2,a3,i){return(cond)?name2(an1,an2,an3,postop):d;} \
    r name(a1,a2,a3){return name2(an1,an2,an3,v);}

#define FOR2(name, name2, r, i, v, cond, postop, a1, a2, an1, an2, d) \
    r name2(a1,a2,i){return(cond)?name2(an1,an2,postop):d;} \
    r name(a1,a2){return name2(an1,an2,v);}

#define FOR1(name, name2, r, i, v, cond, postop, a1, an1, d) \
    r name2(a1,i){return(cond)?name2(an1,postop):d;} \
    r name(a1){return name2(an1,v);}

// WHILE1(f, int, x > 5, int x, x - 1, x)

#define WHILE7(name, r, cond, a1, a2, a3, a4, a5, a6, a7, an1, an2, an3, an4, an5, an6, an7, d) \
    r name(a1,a2,a3,a4,a5,a6,a7){return(cond)?name(an1,an2,an3,an4,an5,an6,an7):d;}

#define WHILE6(name, r, cond, a1, a2, a3, a4, a5, a6, an1, an2, an3, an4, an5, an6, d) \
    r name(a1,a2,a3,a4,a5,a6){return(cond)?name(an1,an2,an3,an4,an5,an6):d;}

#define WHILE5(name, r, cond, a1, a2, a3, a4, a5, an1, an2, an3, an4, an5, d) \
    r name(a1,a2,a3,a4,a5){return(cond)?name(an1,an2,an3,an4,an5):d;}

#define WHILE4(name, r, cond, a1, a2, a3, a4, an1, an2, an3, an4, d) \
    r name(a1,a2,a3,a4){return(cond)?name(an1,an2,an3,an4):d;}

#define WHILE3(name, r, cond, a1, a2, a3, an1, an2, an3, d) \
    r name(a1,a2,a3){return(cond)?name(an1,an2,an3):d;}

#define WHILE2(name, r, cond, a1, a2, an1, an2, d) \
    r name(a1,a2){return(cond)?name(an1,an2):d;}

#define WHILE1(name, r, cond, a1, an1, d) \
    r name(a1){return(cond)?name(an1):d;}

// DO_WHILE1(f, f2, int, x >= 0, int x, x - 1, x)

#define DO_WHILE5(name, name2, r, cond, a1, a2, a3, a4, a5, an1, an2, an3, an4, an5, d) \
    r name2(a1,a2,a3,a4,a5){return(cond)?name2(an1,an2,an3,an4,an5):d;} \
    r name(a1,a2,a3,a4,a5){return name2(an1,an2,an3,an4,an5);}

#define DO_WHILE4(name, name2, r, cond, a1, a2, a3, a4, an1, an2, an3, an4, d) \
    r name2(a1,a2,a3,a4){return(cond)?name2(an1,an2,an3,an4):d;} \
    r name(a1,a2,a3,a4){return name2(an1,an2,an3,an4);}

#define DO_WHILE3(name, name2, r, cond, a1, a2, a3, an1, an2, an3, d) \
    r name2(a1,a2,a3){return(cond)?name2(an1,an2,an3):d;} \
    r name(a1,a2,a3){return name2(an1,an2,an3);}

#define DO_WHILE2(name, name2, r, cond, a1, a2, an1, an2, d) \
    r name2(a1,a2){return(cond)?name2(an1,an2):d;} \
    r name(a1,a2){return name2(an1,an2);}

#define DO_WHILE1(name, name2, r, cond, a1, an1, d) \
    r name2(a1){return(cond)?name2(an1):d;} \
    r name(a1){return name2(an1);}
