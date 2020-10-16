# maxx 1
# maxx 2
# maxx 3
# maxx 4
# Scaler 0.703125, MH 853
wm title . "scenario"
wm geometry . 960x600+650+100
canvas .c -width 800 -height 800 \
	-scrollregion {0c -1c 30c 100c} \
	-xscrollcommand ".hscroll set" \
	-yscrollcommand ".vscroll set" \
	-bg white -relief raised -bd 2
scrollbar .vscroll -relief sunken  -command ".c yview"
scrollbar .hscroll -relief sunken -orient horiz  -command ".c xview"
pack append . \
	.vscroll {right filly} \
	.hscroll {bottom fillx} \
	.c {top expand fill}
.c yview moveto 0
# ProcLine[2] stays at 0 (Used 0 nobox 0)
.c create rectangle 264 0 340 20 -fill black
# ProcLine[2] stays at 0 (Used 0 nobox 0)
.c create rectangle 263 -2 337 18 -fill ivory
.c create text 300 8 -text "1::init:"
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 123 0 161 20 -fill black
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 122 -2 158 18 -fill ivory
.c create text 140 8 -text "0:e1"
.c create text 70 32 -fill #eef -text "1"
.c create line 140 32 780 32 -fill #eef -dash {6 4}
.c create line 140 36 140 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 0 to 1 (Used 1 nobox 0)
# ProcLine[1] stays at 1 (Used 1 nobox 1)
.c create rectangle 132 22 148 42 -fill white -width 0
.c create text 140 32 -text "#8"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 780 56 -fill #eef -dash {6 4}
.c create line 300 36 300 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 3 (Used 1 nobox 1)
# ProcLine[2] stays at 3 (Used 1 nobox 1)
.c create rectangle 274 46 326 66 -fill white -width 0
.c create text 300 56 -text "1:PIni"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 780 80 -fill #eef -dash {6 4}
.c create line 140 48 140 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 1 to 5 (Used 1 nobox 1)
# ProcLine[1] stays at 5 (Used 1 nobox 1)
.c create rectangle 127 70 153 90 -fill white -width 0
.c create text 140 80 -text "#48"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 780 104 -fill #eef -dash {6 4}
.c create line 460 36 460 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 7 (Used 0 nobox 1)
# ProcLine[3] stays at 7 (Used 0 nobox 0)
.c create rectangle 434 94 486 114 -fill ivory
.c create text 460 104 -text "2:PRes"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 780 128 -fill #eef -dash {6 4}
.c create line 620 36 620 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 9 (Used 0 nobox 0)
.c create rectangle 603 120 641 140 -fill black
# ProcLine[4] stays at 9 (Used 0 nobox 0)
.c create rectangle 602 118 638 138 -fill ivory
.c create text 620 128 -text "3:PI"
.c create line 460 162 620 162 -fill darkblue -tags mesg -width 2
.c create line 620 162 780 162 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 780 152 -fill #eef -dash {6 4}
.c create line 460 120 460 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 7 to 11 (Used 1 nobox 0)
# ProcLine[3] stays at 11 (Used 1 nobox 1)
.c create rectangle 394 142 526 162 -fill white -width 0
.c create text 460 152 -text "ca!A,Na,Ta,A,I"
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 780 176 -fill #eef -dash {6 4}
.c create line 780 36 780 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 13 (Used 0 nobox 1)
# ProcLine[5] stays at 13 (Used 0 nobox 0)
.c create rectangle 714 166 846 186 -fill ivory
.c create text 780 176 -text "ca?A,Na,Ta,A,I"
.c create line 780 210 700 210 -fill darkblue -tags mesg -width 2
.c create line 700 210 620 210 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 780 200 -fill #eef -dash {6 4}
.c create line 780 192 780 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 13 to 15 (Used 1 nobox 0)
# ProcLine[5] stays at 15 (Used 1 nobox 1)
.c create rectangle 714 190 846 210 -fill white -width 0
.c create text 780 200 -text "ca!B,Na,Ta,A,B"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 780 224 -fill #eef -dash {6 4}
.c create line 620 144 620 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 9 to 17 (Used 1 nobox 1)
# ProcLine[4] stays at 17 (Used 1 nobox 1)
.c create rectangle 554 214 686 234 -fill white -width 0
.c create text 620 224 -text "ca?B,Na,Ta,A,B"
.c create line 620 258 700 258 -fill darkblue -tags mesg -width 2
.c create line 700 258 780 258 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 780 248 -fill #eef -dash {6 4}
.c create line 620 240 620 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 17 to 19 (Used 1 nobox 1)
# ProcLine[4] stays at 19 (Used 1 nobox 1)
.c create rectangle 548 238 692 258 -fill white -width 0
.c create text 620 248 -text "cb!B,Na,Nb,Tb,A"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 780 272 -fill #eef -dash {6 4}
.c create line 780 216 780 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 15 to 21 (Used 1 nobox 1)
# ProcLine[5] stays at 21 (Used 1 nobox 1)
.c create rectangle 708 262 852 282 -fill white -width 0
.c create text 780 272 -text "cb?B,Na,Nb,Tb,A"
.c create line 780 306 620 306 -fill darkblue -tags mesg -width 2
.c create line 620 306 460 306 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 780 296 -fill #eef -dash {6 4}
.c create line 780 288 780 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 21 to 23 (Used 1 nobox 1)
# ProcLine[5] stays at 23 (Used 1 nobox 1)
.c create rectangle 708 286 852 306 -fill white -width 0
.c create text 780 296 -text "cb!A,Na,Nb,Tb,A"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 780 320 -fill #eef -dash {6 4}
.c create line 460 168 460 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 11 to 25 (Used 1 nobox 1)
# ProcLine[3] stays at 25 (Used 1 nobox 1)
.c create rectangle 388 310 532 330 -fill white -width 0
.c create text 460 320 -text "cb?A,Na,Nb,Tb,A"
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 780 344 -fill #eef -dash {6 4}
.c create line 140 96 140 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 5 to 27 (Used 1 nobox 1)
# ProcLine[1] stays at 27 (Used 1 nobox 1)
.c create rectangle 127 334 153 354 -fill white -width 0
.c create text 140 344 -text "#46"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 780 368 -fill #eef -dash {6 4}
.c create line 140 360 140 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 27 to 29 (Used 1 nobox 1)
# ProcLine[1] stays at 29 (Used 1 nobox 1)
.c create rectangle 127 358 153 378 -fill white -width 0
.c create text 140 368 -text "#24"
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 780 392 -fill #eef -dash {6 4}
.c create line -20 36 -20 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[0] from 0 to 31 (Used 0 nobox 1)
# ProcLine[0] stays at 31 (Used 0 nobox 0)
.c create rectangle -57 382 17 402 -fill ivory
.c create text -20 392 -text " CYCLE>"
.c lower grid
.c raise mesg
