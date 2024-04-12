#SingleInstance force
#Requires Autohotkey v2.0-beta.1+
; Strongly based on Mikeyww's at,
; https://www.autohotkey.com/boards/viewtopic.php?f=76&t=116345&p=518706#p518582

finger := A_ScriptDir "\FingerR.png"
ProcessSetPriority("B")
fing := Gui()
fing.Opt("-Caption +LastFound +ToolWindow +AlwaysOnTop +E0x20")
fing.MarginX := "0", fing.MarginY := "0"
fing.BackColor := "FFFFFF"
fing.Add("Pic", "BackgroundTrans AltSubmit", finger)
WinSetTranscolor("FF0072")

on := True
SetTimer(draw,20)
F1::
{ 	Global on
	If on := !on {
		SetTimer(draw,20)
	} Else {
		SetTimer(draw,0)
		fing.Hide()
	}
	Return
} 

draw() {
	CoordMode("Mouse")
	MouseGetPos(&x, &y)
	fing.Show("NA x" x-325 "y" y-50)
}

Esc::ExitApp

