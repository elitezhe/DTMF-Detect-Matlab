#DTMF Sound Detector

By: Zhang Zhe

Run ***DetectDTMFTones*** !

##Brief

**DetectDTMFTones.m** is the main entry of this application.

**dtmf_G2 , findSegment, fk2dig** are user defined functions of this application.

**enframe.m** is a function of third party toolbox 'voicebox'.
dtmf_sound.wav is audio file of DTMF tones for demonstration. 

If you want to detect your own DTMF sound files, you can modify the code：

    [x fs] = audioread('dtmf_sound.wav'); 
in ***line 3*** of ***DetectDTMFTones.m***.

##P.S.
This project ignore the noise of the DTMF sound files， however as long as the SNR is good(or the noise is not too loud), it still can output correct results.