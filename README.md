# ciliegino
Small pomodoro timer program (windows only)
-------------------------------------------

This is a simple and minimalistic pomodoro timer program. 
It was written in Delphi some years ago. I use it quite often. If it would also be helpful for you, I shall be happy.
Pomodoro technique is discussed here: [http://www.pomodorotechnique.com/](http://www.pomodorotechnique.com/).

The main form of the program is organised as follows:

![screenshot](https://cloud.githubusercontent.com/assets/3508394/9248602/c4726d2c-41c5-11e5-8737-f38aa0dcdfaa.jpg)

You can drag the main form with left mouse button.

There are three basic modes:

* `IDLE` - program starts in the IDLE mode and waits until you start a session by pressing the button. Form color is green.
* `WORK` - after you push the button, the program enters WORK mode. The form becomes Green, and the timer starts to count for WORK time minutes (Value can be adjusted in `Settings->WORK time`).
* `REST` - after the WORK period is finished, program enters REST mode. The form color becomes Blue, and the timer counts for REST time minutes (Value can be adjusted in `Settings->REST time`). 

![workflow](https://cloud.githubusercontent.com/assets/3508394/9248985/8388c01e-41c9-11e5-93ff-7136e1049b63.png)

You can enter the `Settings` by right clicking on the program window and choosing `Settings`.

![settings](https://cloud.githubusercontent.com/assets/3508394/9249036/d5d423d6-41c9-11e5-9763-324ce72b44b8.jpg)

Here you can set up `WORK time` and `REST time`.
You can reset timer to IDLE by pressing `Reset` button. The session counter is reset by `Zero` button.
Also you can adjust opacity of the main window and enable/disable sounds.
The program saves settings in the .ini file, in the same folder, where .exe is placed.




