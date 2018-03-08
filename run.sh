export SHELL=/bin/sh
export BUILD_OFFICIAL=1
export MOZILLA_OFFICIAL=1
export USE_SHORT_LIBNAME=1
export CXXFLAGS="-fno-delete-null-pointer-checks -fno-schedule-insns2"
export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/firefox"

../firefox/configure \
    --prefix=/usr \
    \
    --disable-crashreporter \
    --disable-elf-hack \
    --disable-gold \
    --disable-install-strip \
    --disable-jemalloc \
    --disable-profiling \
    --disable-pulseaudio \
    --disable-strip \
    --disable-tests \
    --disable-updater \
    \
    --enable-alsa \
    --enable-default-toolkit=cairo-gtk3 \
    --enable-official-branding \
    --enable-optimize="$CFLAGS" \
    --enable-pie \
    --enable-startup-notification \
    --enable-system-ffi \
    --enable-system-hunspell \
    --enable-system-sqlite \
    \
    --with-pthreads \
    --with-system-bz2 \
    --with-system-icu \
    --with-system-jpeg \
    --with-system-libevent \
    --with-system-libvpx \
    --with-system-nspr \
    --with-system-nss \
    --with-system-pixman \
    --with-system-png \
    --with-system-zlib \
    --with-clang-path=/usr/bin/clang \
    --with-libclang-path=/usr/lib

make
paxmark -msp dist/bin/xpcshell
### root
# make install
# paxmark -mp /usr/lib/firefox/plugin-container
# paxmark -mp /usr/lib/firefox/firefox
### debug
# setfattr -n user.pax.flags -v "emr" dist/bin/firefox
# ../firefox/mach run --debug

