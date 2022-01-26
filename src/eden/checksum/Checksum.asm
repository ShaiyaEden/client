; The name of the original OS client.
Checksum__OriginalClient:
    db "os.exe", 0

; The length of the string.
Checksum__NameLen   equ $ - Checksum__OriginalClient