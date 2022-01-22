; The packet logging format
PacketLogger__Format        equ 0x86AB34
PacketLogger__RecvRetn      equ 0x69AB26
PacketLogger__Direction     equ 0x6932C6
PacketLogger__Length        equ 0x8DA2C0
PacketLogger__Payload       equ 0x8DA2C2
PacketLogger__Log           equ 0x693280

%ifdef BUILD_DEBUG  ; Only include packet logging code if the client is built in debug

PacketLogger__FileName:
    db "Packets.txt", 0

; The log file handle
PacketLogger__Handle:
    dd 0

; The receive identifier
PacketLogger__RecvName:
    db "RECV<<", 0

; The send identifier
PacketLogger__SendName:
    db "SEND>>", 0

; The mode to open the logger in.
PacketLog__FileOpenMode:
    db "w", 0

; Initialise the log file.
PacketLogger__Init:
    push ebp
    mov ebp, esp

    ; Open the file
    push PacketLog__FileOpenMode
    push PacketLogger__FileName
    push PacketLogger__Handle
    call fopen_s
    add esp, 12

    mov esp, ebp
    pop ebp
    retn

; Log received packets
PacketLogger__Recv:
    pushad
    pushfd

    ; Modify the logger direction
    mov dword [PacketLogger__Direction], PacketLogger__RecvName

    ; Log the received packet
    xor eax, eax
    movzx eax, word [ecx]
    push eax    ; Opcode should be pushed
    xor edi, edi
    movzx edi, word [ecx - 2]
    call PacketLogger__Log
    add esp, 4

    popfd
    popad

    ; Change the direction back to send
    mov dword [PacketLogger__Direction], PacketLogger__SendName

    ; Process the received packet
    push ebp
    mov ebp, esp
    sub esp, 0x24
    jmp PacketLogger__RecvRetn

%endif