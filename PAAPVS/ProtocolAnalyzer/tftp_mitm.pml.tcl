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
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 104 0 180 20 -fill black
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 103 -2 177 18 -fill ivory
.c create text 140 8 -text "0::init:"
.c create text 70 32 -fill #eef -text "1"
.c create line 140 32 780 32 -fill #eef -dash {6 4}
.c create line 300 36 300 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 1 (Used 0 nobox 0)
.c create rectangle 264 24 340 44 -fill black
# ProcLine[2] stays at 1 (Used 0 nobox 0)
.c create rectangle 263 22 337 42 -fill ivory
.c create text 300 32 -text "1:client"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 780 56 -fill #eef -dash {6 4}
.c create line 460 36 460 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 419 48 505 68 -fill black
# ProcLine[3] stays at 3 (Used 0 nobox 0)
.c create rectangle 418 46 502 66 -fill ivory
.c create text 460 56 -text "2:garbage"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 780 80 -fill #eef -dash {6 4}
.c create line 620 36 620 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 5 (Used 0 nobox 0)
.c create rectangle 574 72 670 92 -fill black
# ProcLine[4] stays at 5 (Used 0 nobox 0)
.c create rectangle 572 70 668 90 -fill ivory
.c create text 620 80 -text "3:attacker"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 780 104 -fill #eef -dash {6 4}
.c create line 780 36 780 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 7 (Used 0 nobox 0)
.c create rectangle 744 96 820 116 -fill black
# ProcLine[5] stays at 7 (Used 0 nobox 0)
.c create rectangle 743 94 817 114 -fill ivory
.c create text 780 104 -text "4:server"
.c create line 300 138 540 138 -fill darkblue -tags mesg -width 2
.c create line 540 138 780 138 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 780 128 -fill #eef -dash {6 4}
.c create line 300 48 300 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 1 to 9 (Used 1 nobox 0)
# ProcLine[2] stays at 9 (Used 1 nobox 1)
.c create rectangle 202 118 398 138 -fill white -width 0
.c create text 300 128 -text "out!RRQ,0,0,31,1234,0"
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 780 152 -fill #eef -dash {6 4}
.c create line 780 120 780 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 7 to 11 (Used 1 nobox 1)
# ProcLine[5] stays at 11 (Used 1 nobox 1)
.c create rectangle 684 142 876 162 -fill white -width 0
.c create text 780 152 -text "in?RRQ,0,0,31,1234,0"
.c create line 780 186 620 186 -fill darkblue -tags mesg -width 2
.c create line 620 186 620 262 -fill darkblue -tags mesg -width 2
.c create line 620 262 460 262 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 780 176 -fill #eef -dash {6 4}
.c create line 780 168 780 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 11 to 13 (Used 1 nobox 1)
# ProcLine[5] stays at 13 (Used 1 nobox 1)
.c create rectangle 682 166 878 186 -fill white -width 0
.c create text 780 176 -text "gbg!DATA,0,1,31,512,0"
.c create line 780 210 700 210 -fill darkblue -tags mesg -width 2
.c create line 700 210 620 210 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 780 200 -fill #eef -dash {6 4}
.c create line 780 192 780 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 13 to 15 (Used 1 nobox 1)
# ProcLine[5] stays at 15 (Used 1 nobox 1)
.c create rectangle 671 190 889 210 -fill white -width 0
.c create text 780 200 -text "out!DATA,0,1,31,512,0,0"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 780 224 -fill #eef -dash {6 4}
.c create line 620 96 620 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 5 to 17 (Used 1 nobox 1)
# ProcLine[4] stays at 17 (Used 1 nobox 1)
.c create rectangle 500 214 740 234 -fill white -width 0
.c create text 620 224 -text "chan1?DATA,0,1,31,512,0,0"
.c create line 620 258 460 258 -fill darkblue -tags mesg -width 2
.c create line 460 258 460 286 -fill darkblue -tags mesg -width 2
.c create line 460 286 300 286 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 780 248 -fill #eef -dash {6 4}
.c create line 620 240 620 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 17 to 19 (Used 1 nobox 1)
# ProcLine[4] stays at 19 (Used 1 nobox 1)
.c create rectangle 500 238 740 258 -fill white -width 0
.c create text 620 248 -text "chan1!DATA,0,1,31,512,0,1"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 780 272 -fill #eef -dash {6 4}
.c create line 460 72 460 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 3 to 21 (Used 1 nobox 1)
# ProcLine[3] stays at 21 (Used 1 nobox 1)
.c create rectangle 356 262 564 282 -fill white -width 0
.c create text 460 272 -text "s_g1?DATA,0,1,31,512,0"
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 780 296 -fill #eef -dash {6 4}
.c create line 300 144 300 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 9 to 23 (Used 1 nobox 1)
# ProcLine[2] stays at 23 (Used 1 nobox 1)
.c create rectangle 196 286 404 306 -fill white -width 0
.c create text 300 296 -text "in?DATA,0,1,31,512,0,1"
.c lower grid
.c raise mesg
