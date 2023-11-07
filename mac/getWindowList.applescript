tell application "System Events"
   set allProcesses to processes whose visible is true
   set allWindows to name of window of processes whose visible is true
end tell
set windowList to {}
repeat with p in allProcesses
   set pName to name of p
   set uid to id of p
   set pWindows to name of window of p
   set winObj to {}
   set end of winObj to pName
   set end of winObj to uid
   set winTitles to {}
   repeat with j in pWindows
      if contents of j is not missing value then set end of winTitles to contents of j
   end repeat
   set end of winObj to winTitles
   set end of windowList to winObj
end repeat

set output to "{ \"data\": ["
repeat with winO in windowList
   set output to output & "  { \"processName\": \"" & item 1 of winO & "\", \"id\": \"" & item 2 of winO & "\", \"windows\": ["
   repeat with win in item 3 of winO
      set output to output & "      \"" & replaceString("\"", "'", win) & "\","
   end repeat
   set output to output & "    ] },"
end repeat
set output to output & "]}"
log output

on replaceString(searchString, replacementString, sourceString)
   set AppleScript's text item delimiters to searchString
   set the sourceString to the text items of sourceString
   set AppleScript's text item delimiters to replacementString
   set sourceString to the sourceString as text
   set AppleScript's text item delimiters to ""
   return sourceString
end replaceString