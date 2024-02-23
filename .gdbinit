set auto-load safe-path /
set auto-load local-gdbinit on
set pagination off
set breakpoint pending on
set print repeats 1024
set print elements 2048

define cb
  c
  bt
end