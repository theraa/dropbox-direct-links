on run {input, parameters}
	
	if class of (the clipboard as text) is list then
		set selectedText to first item of (the clipboard as text)
	else
		set selectedText to (the clipboard as text)
	end if
	
	set searchList to {"https://www.dropbox.com/s"}
	set replaceList to {"https://dl.dropbox.com/s"}
	
	repeat with i from 1 to count searchList
		set searchItem to item i of searchList
		set replaceItem to item i of replaceList
		
		if selectedText starts with searchItem then
			set selectedText to replaceItem & text ((length of searchItem) + 1) thru -1 of selectedText
		end if
	end repeat
	tell application "System Events"
		keystroke selectedText
	end tell
end run
