on numberAsKeycode(theString)
    tell application "System Events"
        repeat with currentChar in (every character of theString)
            set cID to id of currentChar
            if cID is 45 then
                key code {27}
            else if cID is 46 then
                key code {47}
            else if cID is 43 then
                key code {24} using {shift down}
            else if ((cID ≥ 48) and (cID ≤ 57)) then
                key code {item (cID - 47) of {29, 18, 19, 20, 21, 23, 22, 26, 28, 25}}
            else
                keystroke currentChar
            end if
        end repeat
    end tell
end numberAsKeycode

on printAllKeys()
    tell application "System Events"
        set x to 1
        repeat 100 times
            key code x
            set x to x + 1
        end repeat
    end tell
end printAllKeys

on sendHotkey(turnOn)
    tell application "System Events"
        if turnOn then
            key code {31} using {shift down, option down} -- 发送 SHIFT+ALT+O 的键码
        else
            key code {31} using {option down} -- 发送 ALT+O 的键码
        end if
    end tell
end sendHotkey

on run argv
    if (item 4 of argv) as boolean then
        tell application "System Events" to key code 36
    end if
    if (item 3 of argv) as boolean then
        delay 0.2
        if (item 2 of argv) is "turnon" then
            sendHotkey(true)
        else if (item 2 of argv) is "turnoff" then
            sendHotkey(false)
        end if
    else
        numberAsKeycode(item 2 of argv)
    end if
end run