clickDelay := 500
handY := 980
playX := 960
playY := 640
creatureY := 525

; barely outside of hand: y = 750

; left side of single creature x: 915
; right side x: 1015
; 2 creatures, left creature left side x: 850
; right side x: 950
; 3 creatures, left creature left side x: 
; right side x: 

; play stuff
; click for easy bot
; advance turn
; click creatures for sac

#s::Reload

#o::
	WinWait, Magic Origins, 
	IfWinNotActive, Magic Origins, , WinActivate, Magic Origins, 
	WinWaitActive, Magic Origins, 
	while(true) {
		sacCreatures(creatureY, clickDelay)
		dumpHand(handY, clickDelay)
		selectEasyBot(clickDelay)
		clickContinue(clickDelay)
		advanceTurn(clickDelay)
		Sleep, 5000 ; let combat play out
	}

LongMouseClick(mouseButton, x, y) {
	MouseClick, %mouseButton%, x, y, , 15, D
	Sleep, 30
	MouseClick, %mouseButton%, x, y, , , U
}

dismissWarning(clickDelay) {
	LongMouseClick(left, 962, 614)
	Sleep, clickDelay
	; Send {Left down}
	; Sleep, 20
	; Send {Left up}
	; Sleep, clickDelay
	; Send {Enter down}
	; Sleep, 20
	; Send {Enter up}
	; Sleep, clickDelay
}

playCard(handX, handY, clickDelay) {
	LongMouseClick(Left, handX, handY)
	Sleep, clickDelay
	dismissWarning(clickDelay)
}

dumpHand(handY, clickDelay) {
	playCard(651, handY, clickDelay)
	playCard(1186, handY, clickDelay)
	playCard(731, handY, clickDelay)
	playCard(1117, handY, clickDelay)
	playCard(831, handY, clickDelay)
	playCard(1002, handY, clickDelay)
	;playCard(900, handY, clickDelay)
}

selectEasyBot(clickDelay) {
	LongMouseClick(left, 600, 720)
	Sleep, clickDelay
	dismissWarning(clickDelay)
}

advanceTurn(clickDelay) {
	LongMouseClick(left,  1783,  979)
	Sleep, clickDelay
	LongMouseClick(left,  1787,  854)
	Sleep, clickDelay
	dismissWarning(clickDelay)
}

; this is so we don't get trapped if the opponent makes us select a creature to sac
sacCreatures(creatureY, clickDelay) {
	LongMouseClick(left,  915,  creatureY)
	Sleep, clickDelay
	dismissWarning(clickDelay)
	Send {WheelDown} ; get rid of creature zoom if we select a creature with an activated ability
	Sleep, clickDelay
}

; starts and exits match
clickContinue(clickDelay) {
	LongMouseClick(left, 1842, 1021)
}