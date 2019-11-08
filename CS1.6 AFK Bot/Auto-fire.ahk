; Shoots a random amount of bullets at variable time intervals.

; v1.0

#MaxThreadsPerHotkey 3
!2:: ; Toggle script on/off key


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
    If ( ErrorLevel = 0 ) ; If the process does not exist, stop running
    {
        Pause
		Suspend
    }

	Random, sleep_param, 500, 3000
	Random, shots_number, 1, 30

	Loop, %shots_number% ; Fire a random number of shots
	{
		Send, {LButton}
		Sleep, 25
	}
	If %shots_number% >= 10 ; Reload if fired more than x number of times
	{
		Send, r
	}
	Sleep, %sleep_param% ; Variable wait time before firing again

    if not KeepWinZRunning  ; Hotkey was pressed to break the loop
        break
}

-::Reload
=::ExitApp

; References:
; https://autohotkey.com/board/topic/74252-1-key-multiaction-error/