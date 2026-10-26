{ ... }: 

#video decodes on the CPU even though iHD driver is set up fixed
{ programs.mpv = {
 enable = true; 
 config.hwdec = "auto-safe"; 
 }; 
 }