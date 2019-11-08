; Walks in random directions to avoid being kicked off the server for being AFK.

; v1.0

#MaxThreadsPerHotkey 3
!1:: ; Toggle script on/off key

#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop
    return  ; End this thread so that the one underneath will resume and see the change made by the line above
}
; Otherwise:
KeepWinZRunning := true

; Main logic
; ----------------
Loop
{
    Process, Exist, hl.exe ; Check if the process is active, to avoid executing commands in other applicaions
    If ( ErrorLevel = 0 ) ; If the process does not exist
    {
        Pause
		Suspend
    }

	Random, direction_choice, 1, 4
	Random, movement_freq, 1, 5
	Random, sleep, 100, 1500

	function_jump(0,5) ; Occasionally jump while walking/turning
	function_key(Up,100,2000) ; Move forward

	Sleep, 100 ; Small delay between different commands
	
	Loop, %movement_freq% ; Walk sideways/turn around more often than walking forwards, but for a lesser amount of time (good for getting un-stuck when facing towards a wall)
	{
		if (direction_choice = 1) ; Turn left
		{
			function_jump(0,8)
			function_key("Left",100,400) ; Walk/turn for a random interval of time
		}
		if (direction_choice = 2) ; Turn right
		{
			function_jump(0,5)
			function_key("Right",100,400)
		}
		if (direction_choice = 3) ; Strafe left
		{
			function_jump(0,5)
			function_key("a",50,400)
		}
		if (direction_choice = 4) ; Strafe right
		{
			function_jump(0,5)
			function_key("d",50,400)
		}
	}
	Sleep, %sleep% ; Wait before moving forward again

    if not KeepWinZRunning  ; Hotkey was pressed to break the loop
        break 
}
KeepWinZRunning := false  ; Reset in preparation for the next pressing the hotkey
return

-::Reload
=::ExitApp

; FUNCTIONS
; ----------------
; Random jump
function_jump(a,b)
{
	Random, space, %a%, %b%
	if (space = 0)
	{
		Send, {Space}
	}
}

; Press key
function_key(key,a,b)
{
    Random, n, %a%, %b%
    Send {%key% down}
    Sleep, %n%
    Send {%key% up}
}


; References:
; https://autohotkey.com/board/topic/74252-1-key-multiaction-error/
