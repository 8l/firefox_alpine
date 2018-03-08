firefox nightly for alpine linux

# diff -ruN org/ new/ > alpine.patch

firefox nightly crash when syscall 16 is blacklist.

# in about:config, seccomp syscall 16
security.sandbox.content.syscall_whitelist 16
