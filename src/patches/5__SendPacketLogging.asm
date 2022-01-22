; Modify send packet logging to the file
%ifdef BUILD_DEBUG
    ; Modify the logging check
    goto_addr   0x6932B9
    times 6     nop
    
    ; Modify the file it writes to
    goto_addr   0x693378
    dd PacketLogger__Handle
%endif