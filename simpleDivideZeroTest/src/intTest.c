#include <stdio.h>

// This function will trigger the check because it has a parameter
// with the same type as its return type (int).
int exampleFunction(int param) {
    return param + 1;
}

int main() {
    int value = 5;
    int result = exampleFunction(value);
    printf("Result: %d\n", result);
    return 0;
}

