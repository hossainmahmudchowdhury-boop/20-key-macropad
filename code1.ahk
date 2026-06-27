#NoEnv  ;
; #Warn ; 
SendMode Input  ; 
SetWorkingDir %A_ScriptDir%  ; 
; -------------------------------------------------------
; Hotkey Symbols
; ^ = Ctrl
; ! = Alt
; + = Shift
;
; This script is intended to work with a HID Remapper:
; https://www.jfedor.org/hid-remapper-config/
; -------------------------------------------------------


; =======================================================
;                Quick Launcher Shortcuts
; =======================================================

Shift & F15::
; Reserved for microphone mute/unmute functionality.
return

Alt & F19::
; Moves the adjustable desk to the sitting position using Home Assistant.
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/desk_sit,,hide
return

Alt & F20::
; Moves the adjustable desk to the standing position.
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/desk_stand,,hide
return

Alt & F21::
; Opens Windows File Explorer.
Run, Explorer.exe
return

Alt & F22::
; Opens Google Chrome if it isn't running.
; If Chrome is already open, it simply brings the existing window to the front.
Process, Exist, chrome.exe
If Not ErrorLevel
{
    Run, C:\Program Files\Google\Chrome\Application\chrome.exe
}
Else
{
    WinActivate, ahk_exe chrome.exe
}
return


; =======================================================
;               Window Management Controls
; =======================================================

; Toggle YouTube fullscreen and reposition the browser window.
; Designed for Chrome with the Windowed extension installed.
Alt & F15::
Send f
Sleep 50
Send w
Sleep 350
WinMove, A,,420,2160-1700,3000,1700
return

; Stretch the active window vertically.
Alt & F16::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,2160-1600,W,1600
return

; Resize the active window into a smaller centered window.
Alt & F17::
WinGetPos, X, Y, W, H, A
WinMove, A,,X+(W/2)-600,Y+(H/2)-500,1200,1000
return

; Restore the active window to its preferred default size and position.
Alt & F18::
WinGetPos, X, Y, W, H, A
WinMove, A,,(3840-2000)/2,2160-1600,2000,1600
return


; Expand the window toward the left.
Shift & F23::
WinGetPos, X, Y, W, H, A
WinMove, A,,X-200,Y,W+200,H
return

; Move the window left without changing its size.
Ctrl & F23::
WinGetPos, X, Y, W, H, A
WinMove, A,,X-200,Y,W,H
return

; Reduce the window width from the left side.
Shift & F24::
WinGetPos, X, Y, W, H, A
WinMove, A,,X+200,Y,W-200,H
return

; Expand the window toward the right.
Alt & F14::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,Y,W+200,H
return

; Move the window to the right without resizing it.
Ctrl & F14::
WinGetPos, X, Y, W, H, A
WinMove, A,,X+200,Y,W,H
return

; Reduce the window width from the right side.
Alt & F13::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,Y,W-200,H
return


; =======================================================
;             HDMI Input Switching Shortcuts
; =======================================================

; Switch monitor input to PC.
Shift & F19::
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/quick_pc,,hide
return

; Switch monitor input to the second PC.
Shift & F20::
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/quick_pc2,,hide
return

; Switch monitor input to the PlayStation 5.
Shift & F21::
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/quick_ps5,,hide
return

; Switch monitor input to HDMI port 4.
Shift & F22::
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/quick_hdmi4,,hide
return


; =======================================================
;             USB Device Switching Shortcuts
; =======================================================
; These shortcuts should remain below the HDMI shortcuts
; so the Ctrl modifier works correctly.

Ctrl & F19::
; Switch USB connection to Device 1.
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/usb1,,hide
return

Ctrl & F20::
; Switch USB connection to Device 2.
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/usb2,,hide
return

Ctrl & F21::
; Switch USB connection to Device 3.
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/usb3,,hide
return

Ctrl & F22::
; Switch USB connection to Device 4.
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/usb4,,hide
return


; =======================================================
;          Lighting and Display Power Controls
; =======================================================

Shift & F18::
; Toggle the monitor backlight.
Run curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/monitor_light_toggle,,hide
return

Shift & F14::
; Turn the desk light bar on or off.
Run curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/lightbar_toggle,,hide
return

Shift & F17::
; Toggle the monitor screen between on and off while keeping the display powered.
screenToggle := !screenToggle
if (screenToggle)
{
    Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/lg_screen_off,,hide
}
else
{
    Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/lg_screen_on,,hide
}
return

Shift & F13::
; Toggle the LG TV's main power.
Run, curl -X POST -H "Authorization: Bearer HomeAssistantAPIKey" -H "Content-Type: application/json" http://192.168.1.3:8123/api/services/script/toggle_power_lgtv,,hide
return
