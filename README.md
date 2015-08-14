# ciliegino
Small pomodoro timer program (windows only)
-------------------------------------------

This is a simple and minimalistic pomodoro timer program. 
It was written in Delphi some years ago. I use it quite often. If it would also be helpful for you, I shall be happy.
Pomodoro technique is discussed here: [http://www.pomodorotechnique.com/](http://www.pomodorotechnique.com/).

Main window
-----------

The main form of the program is organised as follows:

![screenshot](https://cloud.githubusercontent.com/assets/3508394/9248602/c4726d2c-41c5-11e5-8737-f38aa0dcdfaa.jpg)

You can drag the main form with left mouse button.

New session can be started by pressing a `Start` pushbutton with the left mouse button or `Ctrl-Alt-Q` from the keyboard (later program will support redefining this only hotkey).

Workflow
--------

There are three basic modes:

* `IDLE` - program starts in the IDLE mode and waits until you start a session by pressing the button. Form color is green.
* `WORK` - after you push the button, the program enters WORK mode. The form becomes Green, and the timer starts to count for WORK time minutes (Value can be adjusted in `Settings->WORK time`).
* `REST` - after the WORK period is finished, program enters REST mode. The form color becomes Blue, and the timer counts for REST time minutes (Value can be adjusted in `Settings->REST time`). 

![workflow](https://cloud.githubusercontent.com/assets/3508394/9248985/8388c01e-41c9-11e5-93ff-7136e1049b63.png)


Settings
--------
You can enter the `Settings` by right clicking on the program window and choosing `Settings`.

![settings](https://cloud.githubusercontent.com/assets/3508394/9252003/da9095ac-41de-11e5-81e1-09adf85df042.jpg)

Here you can set up `WORK time` and `REST time`.
You can reset timer to IDLE by pressing `Reset` button. The session counter is reset by `Zero` button.
Also you can adjust opacity of the main window and enable/disable sounds.
The program saves settings in the `.ini` file, in the same folder, where `.exe` is placed.

Installation
------------
You can grab the `.exe` file from the `win32` folder and launch it. It is self sufficient. Program works only in Windows OS.

Q & A
-----

-- Q. What the hell is Ciliegino?

-- A. It's a small "cherry" tomato :)





