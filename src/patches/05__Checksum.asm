; Modify the checksum check to load the checksum from a "os_client.exe".
%ifdef BUILD_DEBUG
    ; Change the length of the file name.
    goto_addr 0x542C39
    db Checksum__NameLen

    ; Change the name of the file to generate the checksum from.
    goto_addr 0x542C49
    dd Checksum__OriginalClient
%endif