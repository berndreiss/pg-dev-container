#!/bin/bash
cd $LLVM_HOME/config/ && git pull && ./install.sh
cd -
./runCheck.sh
