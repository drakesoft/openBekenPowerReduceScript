startDriver NTP
ntp_setServer 192.168.0.1
SetupEnergyStats 1 60 60

// --- PWM Config ---
PWMFrequency 20000         // Setze PWM1 auf 20kHz

// --- Setup virtual Relay
setChannelType 0 toggle
setChannelLabel 0 "Relay" 

// --- Optional: Initialwerte setzen ---
SetChannel 1 0          // PWM = 0 % (Startzustand)
SetChannel 0 0          // Schalter auf 0

alias changePWMtoLP addRepeatingEvent 1 1 setChannel 1 35

addChangeHandler Channel0 == 0 setChannel 1 0
addChangeHandler Channel0 == 1 setChannel 1 100
addChangeHandler Channel0 == 1 changePWMtoLP