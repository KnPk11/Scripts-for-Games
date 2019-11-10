; Rainbow Six Siege AFK renown farming

; All actions performed on the 'Operation Ember Rise' release and 1080p resolution - you may need to adjust your mouse coordinates & pixel values

; v1.0

Sleep, 3000

default_sleep := 500

; Launch the game and skip past intro screens
Process, Exist, RainbowSix.exe ; Check if the game process is running
If ( ErrorLevel = 0 ) ; If not running
{
    Run, "C:\Games\Ubisoft\Ubisoft Game Launcher\games\Tom Clancy's Rainbow Six Siege\RainbowSix.exe"
    ; WinWaitActive, Uplay, , 10000
    ; Sleep, 5000
    ; mouse_click(478, 349)
    Sleep, 30000 ; Allow enough time for the game to initially launch
    Loop
    {
        Process, Exist, RainbowSix.exe ; Keep checking - sometimes the game might not launch first time, or might crash
        If ( ErrorLevel = 0 )
        {
            Reload ; Reload the script to persistently keep trying to run the game
        }
        ; WinWaitActive, Rainbow Six, , 10000
        enter("Space") ; Press space to skip the intro videos
        Sleep, %default_sleep%

        PixelGetColor, Pixel0, 614, 502 ; Pixel colour for the main menu screen
        If Pixel0 = 0x00C2F5
        {
            Break ; If recognised, go to the next section
        }
    }
}

; Main logic for farming
Loop
{
    Process, Exist, RainbowSix.exe  ; Check if the process is active, to avoid executing the actions in other applicaions
    If ( ErrorLevel = 0 )
    {
        Sleep, 10000
        Reload ; Go back to re-starting the game
    }

    PixelGetColor, Pixel0, 614, 502 ; Pixel colour for the main menu screen
    PixelGetColor, Pixel1, 774, 104 ; Pixel colour for the match selection screen
    PixelGetColor, Pixel2, 195, 214 ; End of game screen
    PixelGetColor, Pixel3, 1160, 980 ; Pixel colour for the retry game screen

    If Pixel0 = 0x00C2F5 ; Main menu screens
    {
        mouse_click(334, 405) ; Start new game - needs to be in terrorist hunt mode by default
        Sleep, 2000
        mouse_click(476, 361) ; Lone wolf
        Sleep, %default_sleep%
        mouse_click(241, 432) ; Normal difficulty
        Sleep, 5000 ; Wait a bit after starting a new game      
    }
    Else If Pixel1 = 0x764000
    {
        mouse_click(300, 600) ; Chose location on the map
        Sleep, %default_sleep%

        mouse_click(610, 470) ; Chose operator
        Sleep, %default_sleep%

        mouse_click(520, 351) ; Confirm operator
        Sleep, %default_sleep%
    }
    Else If Pixel2 = 0xFFFFFF 
    {
        enter("Tab") ; End of the game
    }
    Else If Pixel3 = 0x000000
    {
        mouse_click(1030, 980) ; Retry match
        Sleep, 2000
    }

    Else
    {
        Sleep, 1000 ; Wait before restarting the loop
    }
}

`::pause, toggle ; Pause the script. Does not properly break out of the loop, use reload
-::ExitApp
=::Reload

; Functions. Variable movement and clicking & keystroke is a workaround to getting blocked in-game
mouse_click(x, y) ; Mouse movement & clicking
{
    Random, n, 50, 200
    Random, s, 5, 20
    MouseMove, % x, % y, % s
    Send {LButton down}
    Sleep, %n%
    Send {LButton up}
}
enter(key) ; Keystrokes
{
    Random, n, 50, 100
    Send {%key% down}
    Sleep, %n%
    Send {%key% up}
}
