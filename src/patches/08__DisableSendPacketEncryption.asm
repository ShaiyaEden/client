; Detour the primary send-packet function.
goto_addr   0x693720
jmp         PacketCodec__SendPacketPrimary

; Detour the secondary send-packet function.
goto_addr   0x693880
jmp         PacketCodec__SendPacketSecondary