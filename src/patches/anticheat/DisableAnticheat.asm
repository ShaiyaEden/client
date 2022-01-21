; Patch: Disables the anti cheat in debug builds
%ifdef BUILD_DEBUG
    goto_addr   0x4FD080

    ; Return instantly
    xor eax, eax
    retn

    ; Remove the rest of the code
    times 243 db Opcode__INT3
%endif