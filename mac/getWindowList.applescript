tell application "System Events"
   set allProcesses to processes whose visible is true
end tell

set windowList to {}
repeat with p in allProcesses
   set pName to name of p
   set pID to id of p
   set pWindows to name of window of p
   set winObj to {}
   set end of winObj to pName
   set end of winObj to pID
   set winTitles to {}
   repeat with j in pWindows
      if contents of j is not missing value then set end of winTitles to contents of j
   end repeat
   set end of winObj to winTitles
   set end of windowList to winObj
end repeat

set jsonStr to "{ \"data\": ["
repeat with winO in windowList
   set jsonStr to jsonStr & "  { \"processName\": \"" & item 1 of winO & "\",\n    \"pid\": " & item 2 of winO & ",\n    \"windows\": ["
   repeat with win in item 3 of winO
      set jsonStr to jsonStr & "      \"" & win & "\","
   end repeat
   set jsonStr to text 1 thru -2 of jsonStr -- 移除最后一个逗号
   set jsonStr to jsonStr & "    ] },"
end repeat
set jsonStr to text 1 thru -2 of jsonStr -- 移除最后一个逗号
set jsonStr to jsonStr & "]}"
return jsonStr