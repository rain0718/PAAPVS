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
.c create rectangle 99 0 185 20 -fill black
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 98 -2 182 18 -fill ivory
.c create text 140 8 -text "0:monitor"
.c create text 70 32 -fill #eef -text "1"
.c create line 140 32 780 32 -fill #eef -dash {6 4}
.c create line 460 36 460 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 1 (Used 0 nobox 0)
.c create rectangle 419 24 505 44 -fill black
# ProcLine[3] stays at 1 (Used 0 nobox 0)
.c create rectangle 418 22 502 42 -fill ivory
.c create text 460 32 -text "2:request"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 780 56 -fill #eef -dash {6 4}
.c create line 620 36 620 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 574 48 670 68 -fill black
# ProcLine[4] stays at 3 (Used 0 nobox 0)
.c create rectangle 572 46 668 66 -fill ivory
.c create text 620 56 -text "3:attacker"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 780 80 -fill #eef -dash {6 4}
.c create line 780 36 780 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 5 (Used 0 nobox 0)
.c create rectangle 731 72 833 92 -fill black
# ProcLine[5] stays at 5 (Used 0 nobox 0)
.c create rectangle 730 70 830 90 -fill ivory
.c create text 780 80 -text "4:responder"
.c create line 460 114 620 114 -fill darkblue -tags mesg -width 2
.c create line 620 114 780 114 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 780 104 -fill #eef -dash {6 4}
.c create line 460 48 460 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 1 to 7 (Used 1 nobox 0)
# ProcLine[3] stays at 7 (Used 1 nobox 1)
.c create rectangle 380 94 540 114 -fill white -width 0
.c create text 460 104 -text "out!Msg_Req,1,2,1"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 780 128 -fill #eef -dash {6 4}
.c create line 780 96 780 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 5 to 9 (Used 1 nobox 1)
# ProcLine[5] stays at 9 (Used 1 nobox 1)
.c create rectangle 706 118 854 138 -fill white -width 0
.c create text 780 128 -text "in?Msg_Req,1,2,1"
.c create line 780 162 700 162 -fill darkblue -tags mesg -width 2
.c create line 700 162 620 162 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 780 152 -fill #eef -dash {6 4}
.c create line 780 144 780 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 9 to 11 (Used 1 nobox 1)
# ProcLine[5] stays at 11 (Used 1 nobox 1)
.c create rectangle 695 142 865 162 -fill white -width 0
.c create text 780 152 -text "out!Msg_Chal,2,1,2"
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 780 176 -fill #eef -dash {6 4}
.c create line 620 72 620 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 3 to 13 (Used 1 nobox 1)
# ProcLine[4] stays at 13 (Used 1 nobox 1)
.c create rectangle 535 166 705 186 -fill white -width 0
.c create text 620 176 -text "s_q?Msg_Chal,2,1,2"
.c create line 620 210 540 210 -fill darkblue -tags mesg -width 2
.c create line 540 210 460 210 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 780 200 -fill #eef -dash {6 4}
.c create line 620 192 620 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 13 to 15 (Used 1 nobox 1)
# ProcLine[4] stays at 15 (Used 1 nobox 1)
.c create rectangle 535 190 705 210 -fill white -width 0
.c create text 620 200 -text "s_q!Msg_Chal,2,1,2"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 780 224 -fill #eef -dash {6 4}
.c create line 460 120 460 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 7 to 17 (Used 1 nobox 1)
# ProcLine[3] stays at 17 (Used 1 nobox 1)
.c create rectangle 380 214 540 234 -fill white -width 0
.c create text 460 224 -text "in?Msg_Chal,2,1,2"
.c create line 460 258 540 258 -fill darkblue -tags mesg -width 2
.c create line 540 258 620 258 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 780 248 -fill #eef -dash {6 4}
.c create line 460 240 460 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 17 to 19 (Used 1 nobox 1)
# ProcLine[3] stays at 19 (Used 1 nobox 1)
.c create rectangle 362 238 558 258 -fill white -width 0
.c create text 460 248 -text "out!Msg_ChalRC4,1,2,3"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 780 272 -fill #eef -dash {6 4}
.c create line 620 216 620 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 15 to 21 (Used 1 nobox 1)
# ProcLine[4] stays at 21 (Used 1 nobox 1)
.c create rectangle 522 262 718 282 -fill white -width 0
.c create text 620 272 -text "q_s?Msg_ChalRC4,1,2,3"
.c create line 620 306 700 306 -fill darkblue -tags mesg -width 2
.c create line 700 306 780 306 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 780 296 -fill #eef -dash {6 4}
.c create line 620 288 620 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 21 to 23 (Used 1 nobox 1)
# ProcLine[4] stays at 23 (Used 1 nobox 1)
.c create rectangle 522 286 718 306 -fill white -width 0
.c create text 620 296 -text "q_s!Msg_ChalRC4,1,2,3"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 780 320 -fill #eef -dash {6 4}
.c create line 780 168 780 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 11 to 25 (Used 1 nobox 1)
# ProcLine[5] stays at 25 (Used 1 nobox 1)
.c create rectangle 684 310 876 330 -fill white -width 0
.c create text 780 320 -text "in?Msg_ChalRC4,1,2,3"
.c create line 780 354 700 354 -fill darkblue -tags mesg -width 2
.c create line 700 354 620 354 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 780 344 -fill #eef -dash {6 4}
.c create line 780 336 780 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 25 to 27 (Used 1 nobox 1)
# ProcLine[5] stays at 27 (Used 1 nobox 1)
.c create rectangle 682 334 878 354 -fill white -width 0
.c create text 780 344 -text "out!Msg_Success,2,1,4"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 780 368 -fill #eef -dash {6 4}
.c create line 620 312 620 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 23 to 29 (Used 1 nobox 1)
# ProcLine[4] stays at 29 (Used 1 nobox 1)
.c create rectangle 522 358 718 378 -fill white -width 0
.c create text 620 368 -text "s_q?Msg_Success,2,1,4"
.c create line 620 402 540 402 -fill darkblue -tags mesg -width 2
.c create line 540 402 460 402 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 780 392 -fill #eef -dash {6 4}
.c create line 620 384 620 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 29 to 31 (Used 1 nobox 1)
# ProcLine[4] stays at 31 (Used 1 nobox 1)
.c create rectangle 522 382 718 402 -fill white -width 0
.c create text 620 392 -text "s_q!Msg_Success,2,1,4"
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 780 416 -fill #eef -dash {6 4}
.c create line 460 264 460 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 19 to 33 (Used 1 nobox 1)
# ProcLine[3] stays at 33 (Used 1 nobox 1)
.c create rectangle 364 406 556 426 -fill white -width 0
.c create text 460 416 -text "in?Msg_Success,2,1,4"
.c lower grid
.c raise mesg
