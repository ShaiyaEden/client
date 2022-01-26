ClientVersion__Major    equ 0x30003
ClientVersion__Minor    equ 0x3000A

; Modify the client major version
goto_addr   0x6957C7
dd ClientVersion__Major

; Modify the client minor version
goto_addr   0x6957CC
dd ClientVersion__Minor