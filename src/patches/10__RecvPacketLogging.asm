%ifdef BUILD_DEBUG
    ; Detour the packet handling function to log the packet.
    goto_addr 0x69AB20
    jmp PacketLogger__Recv
%endif