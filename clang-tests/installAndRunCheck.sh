#!/bin/bash
cd ../llvm-project-v19.1.7/config/ && ./install.sh
cd -
./runCheck.sh
