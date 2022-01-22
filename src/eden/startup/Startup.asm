Startup__RetnAddr   equ 0x50969A    ; The address to return to after executing our startup code.

; Executes just before the game window is created.
Startup__PreWindowCreate:
    ; Format our new window title
    call WindowTitle__InitWindowTitle

    %ifdef BUILD_DEBUG
        ; Initialise the packet logger
        call PacketLogger__Init
    %endif
    
    ; Proceed to creating the window.
    sub esp, 0x38
    push esi
    xor esi, esi
    push esi
    jmp Startup__RetnAddr