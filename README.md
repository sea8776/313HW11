# 313HW11
**Hex Translator Project**

**Authoring:**
Kyle Jenkins –– Student, UMBC CMSC 313 (Spring 2025)
<br> Date: May 2025 <br>

**Purpose of Software:**
<br>This program reads a fixed 8‐byte buffer, translates each byte into its two‐digit hexadecimal ASCII representation, and prints them to standard output separated by spaces, followed by a newline.
<br>output: 83 6A 88 DE 9A C3 54 9A <br>

**Files:**
<br>Root Directory
<br> hw11translate2Ascii.asm 
<br> README.md — This build & usage guide.

**Build Instructions:**
<br>Prerequisites: x86-32 environment with NASM and LD installed.
<br>
**<br>In the project directory, run:**
<br>nasm -f elf32 -g -F dwarf -o hw11.o hw11translate2Ascii.asm <br>ld -m elf_i386 -o hw11translate2Ascii hw11.o <br>

**Execution:**
<br>./hw11translate2Ascii
<br>Prints one line of eight hex byte values, then exits

**Testing Methodology:**
<br>1. No errors when running
<br>2. Verify the output matches the hard-coded input buffer: 83 6A 88 DE 9A C3 54 9A

**Additional Information:**
<br>– Buffer size of 40 bytes (resb 40) holds eight “XX ” groups plus a final newline.
