; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool on Tue Oct 23 2018 00:51:50 GMT+0200 (hora de verano de Europa central)


; General preferences
G90                            ; Send absolute coordinates...
M83                            ; ...but relative extruder moves

; Network
M550 P"Hbot 3DE-01"                ; Set machine name
M552 S1                        ; Enable network
M586 P0 S1                     ; Enable HTTP
M586 P1 S0                     ; Disable FTP
M586 P2 S0                     ; Disable Telnet

; Drives
M669 K1                        ; CoreXY kinematic
M569 P0 S1                     ; Drive 0 goes forwards
M569 P1 S0                     ; Drive 1 goes forwards
M569 P2 S0                     ; Drive 2 goes forwards
M569 P3 S1                     ; Drive 3 goes forwards
M350 X16 Y16 Z16 E16 I1        ; Configure microstepping with interpolation
M92 X100 Y100 Z400 E415       ; Set steps per mm
M566 X500 Y500 Z60 E1000        ; Set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z900 E4800    ; Set maximum speeds (mm/min)
M201 X2000 Y2000 Z500 E1200     ; Set accelerations (mm/s^2)
M906 X1200 Y1200 Z1000 E800 I30   ; Set motor currents (mA) and motor idle factor in per cent
M84 S30                        ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1               ; Set axis minima
M208 X310 Y208 Z300 S0         ; Set axis maxima

; Endstops
M574 X1 S1 P"!xstop"             ; configure active-low endstop for high end on X via pin xstop
M574 Y2 S1 P"!ystop" 
M574 Z1 S2                        ; configure Z-probe endstop for low end on Z

M591 D0 P2 C"e0_stop" S0        ; Filament Sensor a E0 Endstop

; Z-Probe
M558 P5 C"!zprobe.in" H5 F300 T6000          ; Set Z probe type to ultrasonic and the dive height + speeds
G31 P500 X-25 Y3 Z2.10       ; Set Z probe trigger value, offset and trigger height
M557 X10:310 Y5:208 S45       ; Define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950         ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                                  ; create bed heater output on bedheat and map it to sensor 0
M307 H0 B0 S1.00                                       ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                ; map heated bed to heater 0
M143 H0 S120                                           ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                   ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                       ; disable bang-bang mode for heater  and set PWM limit


; Fans
M950 F0 C"fan0" Q500                                   ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                         ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                                   ; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1 T100                                     ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q500                                   ; create fan 1 on pin fan1 and set its frequency
M106 P2 S1 H1 T100                                     ; set fan 2 value. Thermostatic control is turned on

; Tools
M563 P0 S"Hotend" D0 H1                  ; Define tool 0
G10 P0 X0 Y0 Z0                ; Set tool 0 axis offsets
G10 P0 R0 S0                   ; Set initial tool 0 active and standby temperatures to 0C
M572 D0 S0                  ; Linear presure

M911 S21.0 R23.0 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"            ;Resume after power cut
M912 P0 S-7                   ;Cpu temp correction
M575 P1 S1 B57600             ;paneldue
M501                          ; load saved parameters from non-volatile memory
; Automatic saving after power loss is not enabled

; Custom settings are not configured