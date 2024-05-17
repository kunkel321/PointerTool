#SingleInstance force
#Requires Autohotkey v2.0-beta.1+
; Strongly based on Mikeyww's at,
; https://www.autohotkey.com/boards/viewtopic.php?f=76&t=116345&p=518706#p518582

fingerR := A_ScriptDir "\FingerR.png"
fingerL := A_ScriptDir "\FingerL.png"
ProcessSetPriority("B")
fing := Gui()
fing.Opt("-Caption +LastFound +ToolWindow +AlwaysOnTop +E0x20")
fing.MarginX := "0", fing.MarginY := "0"
fing.BackColor := "FF0072"
finR := fing.Add("Pic", "BackgroundTrans AltSubmit", fingerR)
finL := fing.Add("Pic", " x+20 BackgroundTrans AltSubmit", fingerL)
finL.Visible := False
WinSetTranscolor("FF0072")

LR := False
SwitchRL(*)
{	Global LR
	If LR := !LR {
		finL.Visible := True
		finR.Visible := False
	}
	Else {
		finL.Visible := False
		finR.Visible := True
	}
}

#HotIf WinExist(fing)
Shift::SwitchRL()
#HotIf
Esc::ExitApp()

on := True
SetTimer(draw,20)
F1::
{ 	Global on := !on
	If on {
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
