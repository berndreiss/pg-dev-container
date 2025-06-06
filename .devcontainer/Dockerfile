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
   && make -j $(nproc) -C contrib/pageinspect \
   && make -j $(nproc) -C contrib/pg_freespacemap \
   && make -j $(nproc) -C contrib/pg_visibility \
   && make -j $(nproc) -C contrib/pg_buffercache \
   && make install \
   && make -C contrib/postgres_fdw install \
   && make -C contrib/pageinspect install \
   && make -C contrib/pg_freespacemap install \
   && make -C contrib/pg_visibility install \
   && make -C contrib/pg_buffercache install \
   && echo "export PATH=\$PATH:/usr/local/postgresql-${PGVERSION}/bin" >> /root/.bashrc \
   && echo "export PATH=\$PATH:/usr/local/postgresql-${PGVERSION}/bin" >> /home/vscode/.bashrc \
   && echo "Defaults        secure_path=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/postgresql-${PGVERSION}/bin\"" >> /etc/sudoers \
   && sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
   && sed -i 's/^# *\(de_DE.UTF-8\)/\1/' /etc/locale.gen \  
   && locale-gen \
   && su - vscode -c "mkdir /home/vscode/pgdata" \
   && su - vscode -c "/usr/local/postgresql-${PGVERSION}/bin/initdb -D /home/vscode/pgdata -E UTF-8"

RUN su - root -c "apt -y install cmake llvm-19 llvm-19-dev clang-19 libclang-19-dev clang-tidy-19"
RUN su - root -c "apt -y install neovim ninja-build coccinelle"
RUN su - root -c "apt -y remove llvm-14*"

VOLUME /home/vscode/pgdata
