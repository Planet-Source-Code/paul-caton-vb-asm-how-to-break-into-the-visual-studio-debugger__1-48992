;#
;# MASM32 model assembler for the machine code used in the cDebug.Break method
;#

.486                                        ;# Create 32 bit code
.model flat, stdcall                        ;# 32 bit memory model
option casemap :none                        ;# Case insensitive

.code
start:
Break proc
    int 3                                   ;# Software interrupt into the debugger
    ret                                     ;# Return
Break endp
end start
