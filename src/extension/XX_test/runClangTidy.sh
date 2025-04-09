#cat /usr/local/src/postgresql/src/backend/nodes/bitmapset.c <(echo '#line 1 "test.c"') test.c > merged.c  
#/home/vscode/llvm-project/buildNinja/bin/clang -cc1 -O0 -analyze -analyzer-checker=deadcode.UnassignedReturnValue test.c -I /usr/local/src/postgresql/src/include -I /usr/include -I /usr/include/x86_64-linux-gnu -I /usr/lib/llvm-14/lib/clang/14.0.6/include/
clang-tidy-14 test.c -- -I /usr/local/src/postgresql/src/include -I /usr/local/src/postgresql/src/backend -I /usr/include -I /usr/include/x86_64-linux-gnu -I /usr/lib/llvm-14/lib/clang/14.0.6/include/
#rm merged.c 
