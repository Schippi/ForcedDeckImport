param := %0%
MsgBox, 4,, Import Deck?
IfMsgBox, No
	Exit, 1
i := 0
winactivate, FORCED SHOWDOWN
WinWaitActive, FORCED SHOWDOWN, , 3 ; waiting 3 seconds
if (ErrorLevel = 1)
{
MsgBox, 0,, Forced Showdown must be running!
Exit, 3
}
SetKeyDelay -1
alt := ""
Click 600,1060 ; Click Cards In Main Menu
Sleep 500
Loop, read, %param%
{
	if (i = 0)	
	{
		ClickContestant(A_LoopReadLine)
		MouseMove 1700,660 ; Last Deck Hover
		Sleep 250
		MouseMove 1811,660 ; Move to Delete Btn
		Sleep 250
		Click 1811,660 ; Delete Last Deck
		Sleep 100
		Click 890,595 ; Confirm Deletion
		Click 1650,830 ; Click new Deck
	}
	else
	{
		if ( i = 1)
		{
			Sleep 500
			Click 1700,185 ; Click DeckName
			Send %A_LoopReadLine%{enter}
		}
		else
		{	
		AddCard(A_LoopReadLine,alt)
		alt := A_LoopReadLine
		}
	}
    i := i + 1 
}
Click 970,90 ; SearchBar
Send {BS}
Click 1510,925
Exit, 0

AddCard(x,aalt)
{
	IfNotInString aalt, %x%
	{
		Click 970,90 ; SearchBar
		Send %x%{enter}
		SetMouseDelay, 35
		Click 250,350 ; Click First card 	
	}
	else
	{
		Click 250,350 ; Click First card 	
		SetMouseDelay, 20
	}
	
}
ClickContestant(test)
{
	IfInString, test, Squire	
		{
		   Click 1425,335 ; Click Squire
		} 
		else
		IfInString, test, Volco	
		{
		   Click 1530,335 ; Click Volco
		}
		else
		IfInString, test, Storm	
		{
		   Click 1620,335 ; Click Stormbringer
		}
		else
		IfInString, test, Ravage	
		{
		   Click 1710,335 ; Click Ravager
		}
		else
		IfInString, test, Settsu	
		{
		   Click 1810,335 ; Click Settsu
		}
		else
		{
		  MsgBox, 1,, First Line doesnt contain Contestant :(
		  Exit, 2
		} 
}
