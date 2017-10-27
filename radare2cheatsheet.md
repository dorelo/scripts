yntax
Every char has a meaning:
```p``` - print
```w``` - write
```d``` - disassemble
```f``` - function

and can be combined, for example:

- ```pdf @ main```

means:

- ```print - disassemble - function @ main```

All commands are documented. Append a ```?``` to anything for documentation.

- ```r2 ./binary```
- ```aaa``` analyse all or ```aa``` can be faster for very large binaries, as it analyses fewer things
- ```aa?``` for a list of things that can be analysed
- ```afl``` list functions
- ```s <address>>``` seek to an address
- ```px <size in bytes>``` hexdump
- ```? 0x20 + 0xdeadbeef``` calculate offsets
- ```CC <text>``` add comment
- ``` afn <name> <addr>``` rename function

# Switching between views
- ```VV``` is graph view
  - ```tab``` to move through boxes
  - ```h,j,k,l``` vim scrolling
  - ```t, f``` follow true or false paths
  - ```.``` center the view
  - ```p``` change graph views

- ```q``` will exit a view
- ```V!``` for a very useful (what I am calling) debugging view ```TAB``` to switch between cells in this view

![debug view](https://i.imgur.com/vxALqli.png "Debug view")

Hitting ```V``` a number of times will cycle you between different visual views (tabbed, graph etc, raw etc)

# Info
- ```iI```
- ```i?``` for all info

This also gives similar info to checksec
Can query things individually, like:
- ```i~pic``` or ```i~canary``` for specific info

# Search
Is vim-like

- ```/ <search term>```

#### Search for strings
- ```iz```

Actually uses the ```rabin2``` component of radare, which can be used standalone as well as ```rabin2 [-AcdeEghHiIjlLMqrRsSUvVxzZ] ./binary```

#### Search sections of binary

- ```iS```

#### Entry points
- ```ie```

#### Main
- ```iM```

#### xrefs
- ```axt <address>```

#### Check for writeable sections:

- ```iS | grep perm=..w```

#### Check for executable sections:

- ```iS | grep perm=..x```

#### Search symbols -> imports

- ```is~imp```

#### Get offset of symbol
- ```?v sym.___```

# Exploit-specific stuff
## Search for ROP gadgets

- all ```/R```
- specific ```/R pop,pop,pop,ret```
- with regex ```/R/```

#### Change depth:
- ```e search.roplen=X```

### All ROP search options
```
|Usage: /R Search for ROP gadgets
| /R [filter-by-string]    Show gadgets
| /R/ [filter-by-regexp]   Show gadgets [regular expression]
| /Rl [filter-by-string]   Show gadgets in a linear manner
| /R/l [filter-by-regexp]  Show gadgets in a linear manner [regular expression]
| /Rj [filter-by-string]   JSON output
| /R/j [filter-by-regexp]  JSON output [regular expression]
| /Rk [select-by-class]    Query stored ROP gadgets
```

## Generate De Bruijn pattern, find offset
- ```ragg2 -P <size> | rax2 -s - | ./binary```

Find what was in $eip at segfault, then back in r2:
- ```wo0 <value>```

## Connect to gdbserver
```r2 -D gdb -d [binary] gdb://[address:port]```

## Patching
1. ``oo+`` Open binary with read/write
2. Seek to address you want to patch
3. ```wx <patch>```
4. ``oo`` back to read-only mode
5. Done!
