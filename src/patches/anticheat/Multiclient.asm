; Enable multiclient in debug builds
%ifdef BUILD_DEBUG
    goto_addr   0x509B08
    db Opcode__JMP
%endif