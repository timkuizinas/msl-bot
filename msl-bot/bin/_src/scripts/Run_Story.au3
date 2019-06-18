#include-once
#include "../imports.au3"

Func Run_Story($Chapter, $Section)
	Log_Level_Add("Run_Story")
    Log_Add("Run Story has started.")
	
	If $Chapter = 0 Then
		do_intro()
	EndIf
EndFunc

Func do_intro()
	Log_Add("Doing intro")
	Local $l_location = getLocation()
	Log_Add("Location: " &  $l_location)
	Log_Add("Selecting Male")
	clickPoint("461,256")
	Log_Add("Pressing OK")
	clickPoint("569,451")
	waitLocation("character-look-select", 5)
	Sleep(Random(100, 500, 10))
	
	Log_Add("Choosing Random Look")
	Local $l_lookRandom = Random(0, 2, 1)
	Log_Add("Random look is " &  $l_lookRandom)
	Switch $l_lookRandom
		Case 0
			clickPoint("461,279")
		Case 1
			clickPoint("582,282")
		Case 2
			clickPoint("696,274")
	EndSwitch
	
	Log_Add("Pressing OK")
	clickPoint("650,391")
	waitLocation("character-name-entry", 5)
	Sleep(Random(100, 500, 10))
	
	Log_Add("Entering Name")
	clickPoint("471,212")
	
	Log_Add("Name is " &  $g_sWindowTitle)
	adbSendText($g_sWindowTitle)
	
	Log_Add("Pressing Check")
	clickPoint("690,212")
	
	Sleep(1000)
	
	If Not isLocation("character-name-valid") Then
		Log_Add("Error: Name already taken")
		Return False
	EndIf
	
	Log_Add("Pressing OK")
	clickPoint("642,305")
	
	waitLocation("character-name-confirmation", 5)
	Sleep(Random(100, 500, 10))
	
	Log_Add("Confirming Name")
	clickPoint("332,313")
EndFunc

