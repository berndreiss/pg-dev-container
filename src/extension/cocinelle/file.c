int foo (int i) { 
    printf("TEST");
    return 0; 
}
int bar (int a) { 
    printf("{i}");
    a = 1;
    return 0; 
}
int foobar () { 
    printf("TEST");
    return 0; 
}
int barfoobar () { return 0; }
int barfoo () { return 0; }