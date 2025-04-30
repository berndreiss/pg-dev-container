int foo (int i) { 
    printf("TEST");
    return 0; 
}
int bar (int a) { 
    free(a);
    printf("{i}");
    a = 1;
    return 0; 
}
int foobar (int a) {
    if (true)
	free(a);
    printf("TEST");
    return 0; 
}
int barfoobar () { return 0; }
int barfoo () { return 0; }
