# Scripts for Games
Random scripts

## R6S AFK Renown Farming
This script is based a YouTube video I found showing one of a few AFK farming hacks, and allows you to farm about 30 renown every 3 minutes. I created it more to see how to go about navigating an application that doesn't have standard properties such as window title, pop-up dialogs, or any API support. For now the most reliable way I came up with is to read pixel colours at specific locations on the screen which help identify what's happening in the game UI, and take the necessary action.

* All actions are performed on the 'Operation Ember Rise' release and 1080p resolution - you may need to adjust your mouse coordinates & pixel values.
* The script continuously checks that the game is running in the background, and if not, stops executing/restarts the game.
* It generates subtle speed variations between performing identical tasks and moves the mouse slowly, otherwise the game blocks it.
* Selects the Tower map, Restaurant as the location, Doc as the operator and waits till killed, then restarts the game and repeats indefinetly.

![](https://github.com/KnPk11/Scripts-for-Games/blob/master/R6S%20farming/demo.gif)

## CS1.6 (Counter-Strike) AFK Bot
This script works best on the 'GunGame' gamemode.

It allows you to play the game while being AFK by automatically walking/turning/strafing/jumping in random directions, as well as shooting (at enemies, provided you pair it with an aimbot).

* Please don't run it on the steam version of the game to avoid getting your account banned.
* Also I advice you tune down your aimbot to make it more realistic (so you don't headshot left and right), by switching on the recoil/spread, and switching off fire through walls.

Once ready fire up the script using AHK, join a server, sit back and watch how long it'll take everyone to realise/ban you...or tune the aimbot all the way down to make the player dumb and join the opposing team from another PC to gain an advantage!

![](https://github.com/KnPk11/Scripts-for-Games/blob/master/CS1.6%20AFK%20Bot/demo.gif)
