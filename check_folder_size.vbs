Dim size_b, file_system, folder, size, critical, warning
Dim strfolder, new_str_folder


Set file_system = CreateObject("Scripting.FileSystemObject")

strfolder  = Wscript.Arguments(0)
warning = Wscript.Arguments(1)
critical = Wscript.Arguments(2)

Set folder = file_system.GetFolder(strfolder)
size = folder.size / 1048576

new_str_folder = Replace(strfolder, "\", "/")

if(size >= 0 And size <= Cint(warning)) then
	Wscript.Echo "Limit: " & critical & "Mb - Current: " & round (size) & "Mb - Path: " & new_str_folder & "| size_folder=" & round (size) & "Mb;" & warning & ";" & critical
	Wscript.Quit(0)

elseif(size > Cint(warning) And size <= Cint(critical)) then
	Wscript.Echo "Limit: " & critical & "Mb - Current: " & round (size) & "Mb - Path: " & new_str_folder & "| size_folder=" & round (size) & "Mb;" & warning & ";" & critical
	Wscript.Quit(1)
elseif(size >= Cint(critical)) then
	Wscript.Echo "Limit: " & critical & "Mb - Current: " & round (size) & "Mb - Path: " & new_str_folder & "| size_folder=" & round (size) & "Mb;" & warning & ";" & critical
	Wscript.Quit(2)
else 
	Wscript.Echo "UNKNOW: "
        Wscript.Quit(3)
end if



Wscript.Quit(3)
