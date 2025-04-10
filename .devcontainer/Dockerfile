FROM mcr.microsoft.com/devcontainers/base:bookworm
ARG PGVERSION

RUN apt update \
   && apt -y install python3-bpfcc systemtap-sdt-dev flex bison lcov build-essential libxml2-dev libssl-dev zlib1g-dev libreadline-dev llvm llvm-15 llvm-15-dev clang libicu-dev icu-devtools pkgconf vim gdb linux-perf \
   && mkdir -p /usr/local/src/postgresql \ 
   && wget -q -O /tmp/postgresql.tar.bz2 https://ftp.postgresql.org/pub/source/v${PGVERSION}/postgresql-${PGVERSION}.tar.bz2 \
   && tar jxf /tmp/postgresql.tar.bz2 --strip-components 1 -C /usr/local/src/postgresql \
   && cd /usr/local/src/postgresql \
   && CFLAGS="-ggdb -Og -g3 -fno-omit-frame-pointer" ./configure --prefix=/usr/local/postgresql-${PGVERSION} --with-openssl --with-readline --with-zlib --with-libxml --enable-cassert --enable-debug --enable-dtrace --with-llvm \
   && make -j $(nproc) \
   && make -j $(nproc) -C src/test/isolation \
   && make -j $(nproc) -C contrib/postgres_fdw \
   && make install \
   && make -C contrib/postgres_fdw install \
   && echo "export PATH=\$PATH:/usr/local/postgresql-${PGVERSION}/bin" >> /root/.bashrc \
   && echo "export PATH=\$PATH:/usr/local/postgresql-${PGVERSION}/bin" >> /home/vscode/.bashrc \
   && echo "Defaults        secure_path=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/postgresql-${PGVERSION}/bin\"" >> /etc/sudoers \
   && su - vscode -c "mkdir /home/vscode/pgdata" \
   && su - vscode -c "/usr/local/postgresql-${PGVERSION}/bin/initdb -D /home/vscode/pgdata"

RUN su - root -c "apt -y install neovim ninja-build cmake"
RUN su - vscode -c "cd /home/vscode && git clone --depth=1 https://github.com/berndreiss/llvm-project"
RUN su - vscode -c "cd /home/vscode/llvm-project && mkdir buildNinja && cd buildNinja && cmake -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_BUILD_TYPE=Release -G Ninja ../llvm"

VOLUME /home/vscode/pgdata
