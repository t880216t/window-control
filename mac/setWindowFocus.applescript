on run argv
    if (count of argv) is not equal to 2 then
        log "Usage: osascript script.scpt <processID> <windowName>"
        return
    end if

    set myProcessId to item 1 of argv
    set myWindowName to item 2 of argv

    set processFound to false
    tell application "System Events"
        set allProcesses to processes whose visible is true
        repeat with aProcess in allProcesses
            if (id of aProcess as integer) is equal to (myProcessId as integer) then
                set processName to name of aProcess
                log "Found process with ID: " & myProcessId & " and name: " & processName
                set processFound to true

                set windowsList to windows of aProcess
                repeat with aWindow in windowsList
                    if name of aWindow is equal to myWindowName then
                        set frontmost of aProcess to true
                        log "Focused on window with name: " & myWindowName
                        exit repeat
                    end if
                end repeat

                exit repeat
            end if
        end repeat
    end tell

    if not processFound then
        log "Process with ID " & myProcessId & " not found."
    end if
end run