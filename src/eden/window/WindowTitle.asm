; The formatted window title.
WindowTitle__Title:
    times   128 db  0

; The format for the window title.
WindowTitle__TitleFormat:
    %ifdef BUILD_DEBUG
        db "Shaiya Eden - commit #%s", 0
    %else
        db "Shaiya Eden - v%s", 0
    %endif

; Create the window title
WindowTitle__InitWindowTitle:
    %ifdef BUILD_DEBUG
        push METADATA__GIT_COMMIT
    %else
        push METADATA__VERSION_REF
    %endif
    push WindowTitle__TitleFormat
    push WindowTitle__Title
    call sprintf
    add esp, 12
    retn