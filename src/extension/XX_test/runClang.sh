#cat /usr/local/src/postgresql/src/backend/nodes/bitmapset.c <(echo '#line 1 "test.c"') test.c > merged.c  
#/home/vscode/llvm-project/buildNinja/bin/clang -cc1 -O0 -analyze -analyzer-checker=deadcode.UnassignedReturnValue test.c -I /usr/local/src/postgresql/src/include -I /usr/include -I /usr/include/x86_64-linux-gnu -I /usr/lib/llvm-14/lib/clang/14.0.6/include/
#clang -cc1 -O0 -analyze -analyzer-checker=deadcode.UnassignedReturnValue test.c -I$(pg_config --includedir-server)
#/home/vscode/llvm-project/buildNinja/bin/clang -O0 --analyze \
#  -Xclang -analyzer-checker=deadcode.UnassignedReturnValue \
#  testWithBitmap.c \
#  -I$(pg_config --includedir-server) \
# --gcc-toolchain=/usr \
#  --sysroot=/

/home/vscode/llvm-project/buildNinja/bin/clang -c -O0 --analyze \
  -Xclang -analyzer-checker=deadcode.UnassignedReturnValue \
  testWithBitmap.c \
  -I$(pg_config --includedir-server) \
  -lstc
  #-isystem /usr/include \
  #-isystem /usr/lib/gcc/x86_64-linux-gnu/12/include \
  #-isystem /usr/include/x86_64-linux-gnu \
  #--sysroot=/

#clang -S -emit-llvm testWithBitmap.c \
  #-I$(pg_config --includedir-server) \
  #-isystem /usr/include \
  #-isystem /usr/lib/gcc/x86_64-linux-gnu/12/include \
  #-isystem /usr/include/x86_64-linux-gnu \
  #--sysroot=/

#/home/vscode/llvm-project/buildNinja/bin/clang -cc1 -O0 -analyze -analyzer-checker=deadcode.UnassignedReturnValue test.c -I$(pg_config --includedir-server)
#rm merged.c 
