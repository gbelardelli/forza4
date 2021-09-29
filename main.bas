10 print"{clear}"
20 poke53281,1:poke53280,1
30 rem 0 = turno1 e 2 mosse usate
40 st(0)=1:st(1)=0:st(2)=0:st(3)=0

100 rem ************************************
101 rem copia 64 caratteri da rom a ram
110 rm=38912
120 poke53272,(peek(53272)and240)or14
130 poke56334,peek(56334)and254:poke1,peek(1)and251
140 fori=14336to14848:pokei,peek(i+rm):next
150 poke1,peek(1)or4:poke56334,peek(56334)or1

200 rem ************************************
201 rem definizione dei nuovi caratteri
210 fori=14552to14719
220 readn:pokei,n:poke53280,n:next
230 DATA 252,240,224,192,128,128,0,0 : REM CHARACTER 27
240 DATA 63,15,7,3,1,1,0,0 : REM CHARACTER 28
250 DATA 0,0,1,1,3,7,15,63 : REM CHARACTER 29
260 DATA 0,0,128,128,192,224,240,252 : REM CHARACTER 30
270 DATA 255,255,255,0,0,255,255,0 : REM CHARACTER 31
280 DATA 0,0,0,0,0,0,0,0 : REM CHARACTER 32
290 DATA 3,15,31,63,127,127,255,255 : REM CHARACTER 33
300 DATA 231,231,227,240,120,127,63,0 : REM CHARACTER 34
310 DATA 231,231,199,15,30,254,252,0 : REM CHARACTER 35
320 DATA 255,255,255,0,0,0,0,0 : REM CHARACTER 36
330 DATA 255,255,255,255,255,255,255,255 : REM CHARACTER 37
340 DATA 231,231,231,231,231,231,231,231 : REM CHARACTER 38
350 DATA 255,0,255,0,231,231,231,231 : REM CHARACTER 39
360 DATA 248,30,238,22,231,231,231,231 : REM CHARACTER 40
370 DATA 31,120,119,104,231,231,231,231 : REM CHARACTER 41
380 DATA 255,0,255,0,255,255,255,255 : REM CHARACTER 42
390 DATA 255,255,255,0,0,255,255,255 : REM CHARACTER 43
400 DATA 0,255,255,0,0,255,255,0 : REM CHARACTER 44
410 DATA 0,252,254,30,15,199,231,231 : REM CHARACTER 45
420 DATA 0,63,127,120,240,227,231,231 : REM CHARACTER 46
430 DATA 0,48,120,120,48,0,0,0 : REM CHARACTER 47

500 rem ************************************
501 rem definizione sprite pedina
510 fori=0to62:readn:poke16320+i,n:poke53280,n:next
520 data 0,0,0,0,124,0,1,255,0,7,255,192
530 data 15,255,224,31,255,240,31,255,240
540 data 63,255,248,63,255,248,127,255,252
550 data 127,255,252,127,255,252,127,255,252
560 data 63,255,248,63,255,248,31,255,240
570 data 31,255,240,15,255,224,7,255,192
580 data 1,255,0,0,124,0
590 poke53280,1

600 rem ***************************************
601 rem schermata iniziale
610 print "{dark gray}++++++++++++++++++++++++++++++++++++++++"
620 print " {red}&++++ .+++- .+++- ++++- .+++-     .+-"
630 print " {red}&[    &[ £& &[ £&     & &[ £&     & &"
640 print " {orange}&^    &   & &^ ]&    .# &^ ]&    .# &"
650 print " {orange}&++   &   & &+++#   .#  &+++&    &  &"
660 print " {pink}&[    &   & &&      &   &[ £&    &  &"
670 print " {pink}&     &   & & &   .+#   &   &    ";chr$(34);"++&+"
680 print " {yellow}&     &^ ]& &  &  &     &   &      £&"
690 print " {yellow}&     ";chr$(34);"+++# &   & ";chr$(34);"++++ &   &       &"
700 print ""
710 print "{dark gray}++++++++++++++++++++++++++++++++++++++++";
720 print "     {light green}.,,,,,,,,,,,,,,,,,,,,,,,,,,,,-"
730 print "     &%%%%    {green}scritto  da:    {light green}%%%%&"
740 print "     &%%% {red}gianluca  belardelli {light green}%%%&"
750 print "     &%%                        %%&"
760 print "     &%          {green}per             {light green}%&"
770 print "     &%   {red}r{green}etro{red}p{green}rogramming  {red}i{green}t   {light green}%&"
780 print "     &%%%   {green}forza4 challenge   {light green}%%%&"
790 print "     ";chr$(34);"{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}{arrow left}#"
800 print ""
810 print "       {red}premi un tasto per giocare"
820 poke198,0:wait198,1:poke198,0

850 rem **********************************
851 rem scelta tipo di input
860 pl=1:gi(0)=0:gi(1)=1:gi(2)=0
870 print"{clear}":print""
872 ifpl=1thenprint "{yellow}++++++++++++++++++++++++++++++++++++++++":goto880
875 print "{red}++++++++++++++++++++++++++++++++++++++++"
880 print"{black} giocatore";pl;"scegli come vuoi giocare:":print
890 print"    1/joystick porta 1"
900 print"    2/joystick porta 2"
910 print"    3/tastiera"
915 print
916 ifpl=1thenprint "{yellow}++++++++++++++++++++++++++++++++++++++++":goto920
917 print "{red}++++++++++++++++++++++++++++++++++++++++"
920 geta$:ifa$=""then920
930 ifasc(a$)<49orasc(a$)>51then920
940 ifa$="1"thengi(pl)=2:goto990
950 ifa$="2"thengi(pl)=1:goto990
960 ifa$="3"thengi(pl)=0
970 print:print"{blue},,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,";
971 print" {pink}per giocare con la tastiera bisogna"
980 print" premere i tasti numerici che indicano":print" la colonna"
981 print"{blue},,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,";
990 print:print:print"      {black}premi un tasto per ";
991 ifpl=1thenprint"continuare":goto998
992 print"iniziare":goto999
998 pl=2:poke198,0:wait198,1:poke198,0:goto870
999 poke198,0:wait198,1:poke198,0

1000 rem ****************************************
1001 rem disegna schermata
1010 print"{clear}":print"":print""
1020 print "      {blue})**''**''**''**''**''**''**("
1030 print "      &[£&&[£&&[£&&[£&&[£&&[£&&[£&"
1040 print "      &^]&&^]&&^]&&^]&&^]&&^]&&^]&"
1050 print "      &%%&&%%&&%%&&%%&&%%&&%%&&%%&"
1060 print "      &[£&&[£&&[£&&[£&&[£&&[£&&[£&"
1070 print "      &^]&&^]&&^]&&^]&&^]&&^]&&^]&"
1080 print "      &%%&&%%&&%%&&%%&&%%&&%%&&%%&"
1090 print "      &[£&&[£&&[£&&[£&&[£&&[£&&[£&"
1100 print "      &^]&&^]&&^]&&^]&&^]&&^]&&^]&"
1110 print "      &%%&&%%&&%%&&%%&&%%&&%%&&%%&"
1120 print "      &[£&&[£&&[£&&[£&&[£&&[£&&[£&"
1130 print "      &^]&&^]&&^]&&^]&&^]&&^]&&^]&"
1140 print "      &%%&&%%&&%%&&%%&&%%&&%%&&%%&"
1150 print "      &[£&&[£&&[£&&[£&&[£&&[£&&[£&"
1160 print "      &^]&&^]&&^]&&^]&&^]&&^]&&^]&"
1170 print "      &%%&&%%&&%%&&%%&&%%&&%%&&%%&"
1180 print "      &[£&&[£&&[£&&[£&&[£&&[£&&[£&"
1190 print "      &^]&&^]&&^]&&^]&&^]&&^]&&^]&"
1200 print "      ";chr$(34);"{arrow left}{arrow left}#";chr$(34);"{arrow left}{arrow left}#";
1210 print chr$(34);"{arrow left}{arrow left}#";chr$(34);"{arrow left}{arrow left}#";
1220 print chr$(34);"{arrow left}{arrow left}#";chr$(34);"{arrow left}{arrow left}#";
1230 print chr$(34);"{arrow left}{arrow left}#"
1240 print "       {black}1   2   3   4   5   6   7":print""
1250 print "         turno del giocatore: ";

1300 rem ******************************************
1301 rem definizione colori per extended color mode
1302 rem sprite 1 colore, priority e coord
1310 poke53281,1:poke53282,7:poke53283,2:poke53284,6
1320 poke53265,peek(53265)or64
1330 poke2040,255:rem puntatore sprite
1340 poke53275,255:rem low priority

1400 rem *************************************
1401 rem reset game, giocatore 1 
1410 pl=1:poke2014,48+pl:st(0)=1
1420 forr=0to5:forc=0to6:t(r,c)=0:next:next

1500 rem *************************************
1501 rem game loop
1504 f=0:rem controllo matrice piena
1506 forc=0to6:ift(0,c)<>0thenf=f+1
1507 next
1508 iff=7thenpl=3:goto4000
1510 poke53250,76:poke53251,52:poke53264,peek(53264)and253:rem reset sprite
1520 ifpl=1thenpoke53288,7:goto1540
1530 poke53288,2
1540 c=0:poke198,0:poke53269,peek(53269)or2
1550 ifgi(pl)=0then1800:rem input tastiera

1600 rem **********************************
1601 rem input con joystick
1610 j=peek(56319+gi(pl)):ifj=127then1610
1620 if(jand8)=0thenc=c+1
1630 if(jand4)=0thenc=c-1
1640 ifc>6thenc=0
1650 ifc<0thenc=6
1660 if(jand16)=0then1690:rem press fire
1670 gosub1700
1680 goto1600
1690 ift(0,c)<>0then1600
1695 goto2100

1700 rem ********************************
1701 rem muove sprite sulla colonna
1710 x=(c*32)+76
1720 ifx<255thenwait53265,128:poke53264,peek(53264)and253:poke53250,x:return
1730 wait53265,128:poke53264,peek(53264)or2:poke53250,12
1740 return

1800 rem **************************************
1801 rem input da tastiera
1810 geta$:ifa$=""then1810
1820 ifasc(a$)<49orasc(a$)>55then1810
1830 c=asc(a$)-48-1:poke198,0
1840 gosub1700
1850 ift(0,c)<>0then1810

2100 forr=5to0step-1:rem find row
2110 ift(r,c)=0thent(r,c)=pl:goto2200
2120 nextr

2200 y=(r*24)+80:rem muove sprite pedina
2210 fori=52toystep2:poke53251,i:next
2220 rem sostituisce lo sprite con i caratteri
2230 m=1024+(((r*3)+4)*40)+((c*4)+7)
2240 cl=64*pl
2250 pokem,27+cl:pokem+1,28+cl:pokem+40,30+cl:pokem+41,29+cl
2260 poke 53269,peek(53269)and253: rem disable sprite

2300 rem verifica vittoria in orizzontale
2310 rem r deve essere la row della pedina
2320 f4=0:cs=-1
2330 forcl=0to6
2340 ift(r,cl)=plthen2360
2350 f4=0:cs=-1:goto2380
2360 f4=f4+1
2365 ifcs=-1thencs=cl
2370 iff4=4then3000
2380 nextcl
2390 f4=0

2400 rem verifica vittoria in verticale
2410 rem c deve essere la colonna della pedina
2420 ifr>2then2500
2425 rs=-1
2430 forrw=5to0step-1
2440 ift(rw,c)=plthen2460
2450 f4=0:rs=-1:goto2480
2460 f4=f4+1
2465 ifrs=-1thenrs=rw
2470 iff4=4then3100
2480 nextrw
2490 f4=0

2500 rem verifica vittoria diagonale dx
2501 rem r e c devono essere le coord della pedina
2510 q=5-r:cd=c-q:rd=5:cs=-1:rs=-1
2520 ifcd<0thenrd=(5+cd):cd=0
2530 ifrd=5andcd>3then2600
2540 ifcd=0andrd<3then2600
2550 ift(rd,cd)=plthen2570
2560 f4=0:cs=-1:rs=-1:goto2580
2570 f4=f4+1:iff4=4then3200
2575 ifrs=-1thenrs=rd
2576 ifcs=-1thencs=cd
2580 rd=rd-1:cd=cd+1
2590 ifrd<0 or cd>6then2600
2595 goto2550

2600 rem verifica vittoria diagonale sx
2601 rem r e c devono essere le coord della pedina
2610 f4=0:q=5-r:cd=c+q:rd=5:cs=-1:rs=-1
2620 ifcd>6thenrd=(5-(cd-6)):cd=6
2630 ifrd=5andcd<3then3800
2640 ifcd=6andrd<3then3800
2650 ift(rd,cd)=plthen2670
2660 f4=0:cs=-1:rs=-1:goto2680
2670 f4=f4+1:iff4=4then3300
2675 ifrs=-1thenrs=rd
2676 ifcs=-1thencs=cd
2680 rd=rd-1:cd=cd-1
2690 ifrd<0 or cd<0then3800
2695 goto2650


3000 rem vittoria orizzontale giocatore
3010 forj=0to3
3020 m=1024+(((r*3)+4)*40)+(((cs+j)*4)+7)
3030 wait53265,128:pokem,219:pokem+1,220:pokem+41,221:pokem+40,222
3040 next
3050 goto 3500

3100 rem vittoria verticale giocatore
3110 forj=0to3
3120 m=1024+((((rs-j)*3)+4)*40)+((c*4)+7)
3130 wait53265,128:pokem,219:pokem+1,220:pokem+41,221:pokem+40,222
3140 next
3150 goto 3500

3200 rem vittoria diag dx giocatore
3210 forj=0to3
3220 m=1024+((((rs-j)*3)+4)*40)+(((cs+j)*4)+7)
3230 wait53265,128:pokem,219:pokem+1,220:pokem+41,221:pokem+40,222
3240 next
3250 goto 3500

3300 rem vittoria diag sx giocatore
3310 forj=0to3
3320 m=1024+((((rs-j)*3)+4)*40)+(((cs-j)*4)+7)
3330 wait53265,128:pokem,219:pokem+1,220:pokem+41,221:pokem+40,222
3340 next


3500 rem color flash
3510 forl=0to12:fori=0to15
3512 wait53265,128:poke53284,i
3516 next:next
3518 goto4000

3800 ifpl=1thenpl=2:poke2014,50:goto 1500
3810 ifpl=2thenpl=1:poke2014,49:st(0)=st(0)+1:goto 1500

4000 rem fine gioco
4010 print:print"{clear}":st(pl)=st(pl)+1
4020 ifpl=1thenprint "{yellow}++++++++++++++++++++++++++++++++++++++++":goto4040
4025 ifp2=1thenprint "{red}++++++++++++++++++++++++++++++++++++++++":goto4040
4030 print "{gray}++++++++++++++++++++++++++++++++++++++++"
4035 print"    {black}partita pareggiata"
4038 goto4050
4040 print"    {black}ha vinto il giocatore";pl
4050 print"    dopo";st(0);"turni"
4060 print
4070 print"    totale vittorie giocatore 1";st(1)
4080 print"    totale vittorie giocatore 2";st(2)
4090 print"    pareggi                    ";st(3)
4095 print
4100 ifpl=1thenprint "{yellow}++++++++++++++++++++++++++++++++++++++++":goto4120
4105 ifp2=1thenprint "{red}++++++++++++++++++++++++++++++++++++++++":goto4120
4110 print "{gray}++++++++++++++++++++++++++++++++++++++++"
4120 print:print
4130 print"  {orange}se volete continuare a giocare"
4140 print"  premere 1 e per finire premere"
4150 print"  un qualsiasi tasto"
4160 geta$:ifa$=""then4160
4170 ifa$="1"thengoto1000
4180 remsys64738


5000 rem draw table
5010 rem print"{clear}"
5020 forr=0to5:forc=0to6
5030 rem ift(r,c)=0thenprint"@";:goto2050
5040 printt(r,c);
5050 nextc:print"":nextr

