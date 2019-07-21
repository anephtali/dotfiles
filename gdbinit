set history save
set history filename ~/.gdb_history
set history expansion on
set print pretty on
set print object on
set print static-members on
set print vtbl on
set print demangle on
set demangle-style gnu-v3
set print sevenbit-strings off
set disassembly-flavor intel

python
import sys
sys.path.insert(0, '/usr/share/gcc-6/python/')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

define xxd
dump binary memory /tmp/dump.bin $arg0 $arg0+$arg1
shell xxd /tmp/dump.bin
shell rm /tmp/dump.bin
end
