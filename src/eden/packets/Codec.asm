PacketCodec__SendPacketPrimaryRetn      equ 0x693728
PacketCodec__SendPacketSecondaryRetn    equ 0x693888

; Gets executed when a packet is to be sent to the server.
PacketCodec__SendPacketPrimary:
    ; Disable send packet encryption
    ;mov byte [u8_ShouldEncryptPackets], 0

    ; Return to the original function
    push ebp
    mov ebp, esp
    mov eax, 0x1008
    jmp PacketCodec__SendPacketPrimaryRetn

; Same as above.
PacketCodec__SendPacketSecondary:
    ; Disable send packet encryption
    ;mov byte [u8_ShouldEncryptPackets], 0

    ; Return to the original function
    push ebp
    mov ebp, esp
    mov eax, 0x1008
    jmp PacketCodec__SendPacketSecondaryRetn
