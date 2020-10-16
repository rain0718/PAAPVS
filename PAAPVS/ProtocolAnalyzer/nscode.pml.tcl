# maxx 1
# maxx 2
# maxx 3
# Scaler 0.937500, MH 640
wm title . "scenario"
wm geometry . 800x600+650+100
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
.c create text 140 8 -text "0:p1"
.c create text 70 32 -fill #eef -text "1"
.c create line 140 32 620 32 -fill #eef -dash {6 4}
.c create line 140 36 140 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 0 to 1 (Used 1 nobox 0)
# ProcLine[1] stays at 1 (Used 1 nobox 1)
.c create rectangle 132 22 148 42 -fill white -width 0
.c create text 140 32 -text "#8"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 620 56 -fill #eef -dash {6 4}
.c create line 300 36 300 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 3 (Used 1 nobox 1)
# ProcLine[2] stays at 3 (Used 1 nobox 1)
.c create rectangle 274 46 326 66 -fill white -width 0
.c create text 300 56 -text "1:PIni"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 620 80 -fill #eef -dash {6 4}
.c create line 460 36 460 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 5 (Used 0 nobox 1)
# ProcLine[3] stays at 5 (Used 0 nobox 0)
.c create rectangle 434 70 486 90 -fill ivory
.c create text 460 80 -text "2:PRes"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 620 104 -fill #eef -dash {6 4}
.c create line 620 36 620 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 7 (Used 0 nobox 0)
.c create rectangle 603 96 641 116 -fill black
# ProcLine[4] stays at 7 (Used 0 nobox 0)
.c create rectangle 602 94 638 114 -fill ivory
.c create text 620 104 -text "3:PI"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 620 128 -fill #eef -dash {6 4}
.c create line 140 48 140 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 1 to 9 (Used 1 nobox 0)
# ProcLine[1] stays at 9 (Used 1 nobox 1)
.c create rectangle 127 118 153 138 -fill white -width 0
.c create text 140 128 -text "#47"
.c create line 300 162 460 162 -fill darkblue -tags mesg -width 2
.c create line 460 162 620 162 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 620 152 -fill #eef -dash {6 4}
.c create line 300 72 300 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 3 to 11 (Used 1 nobox 1)
# ProcLine[2] stays at 11 (Used 1 nobox 1)
.c create rectangle 196 142 404 162 -fill white -width 0
.c create text 300 152 -text "cha!MSG1,FMT1,NON1,A,I"
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 620 176 -fill #eef -dash {6 4}
.c create line 620 120 620 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 7 to 13 (Used 1 nobox 1)
# ProcLine[4] stays at 13 (Used 1 nobox 1)
.c create rectangle 516 166 724 186 -fill white -width 0
.c create text 620 176 -text "cha?MSG1,FMT1,NON1,A,I"
.c create line 620 210 540 210 -fill darkblue -tags mesg -width 2
.c create line 540 210 460 210 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 620 200 -fill #eef -dash {6 4}
.c create line 620 192 620 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 13 to 15 (Used 1 nobox 1)
# ProcLine[4] stays at 15 (Used 1 nobox 1)
.c create rectangle 530 190 710 210 -fill white -width 0
.c create text 620 200 -text "cha!MSG1,I,NON1,A,B"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 620 224 -fill #eef -dash {6 4}
.c create line 460 96 460 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 5 to 17 (Used 1 nobox 1)
# ProcLine[3] stays at 17 (Used 1 nobox 1)
.c create rectangle 370 214 550 234 -fill white -width 0
.c create text 460 224 -text "cha?MSG1,I,NON1,A,B"
.c create line 460 258 540 258 -fill darkblue -tags mesg -width 2
.c create line 540 258 620 258 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 620 248 -fill #eef -dash {6 4}
.c create line 460 240 460 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 17 to 19 (Used 1 nobox 1)
# ProcLine[3] stays at 19 (Used 1 nobox 1)
.c create rectangle 340 238 580 258 -fill white -width 0
.c create text 460 248 -text "cha!MSG1,FMT2,NON1,NON2,A"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 620 272 -fill #eef -dash {6 4}
.c create line 620 216 620 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 15 to 21 (Used 1 nobox 1)
# ProcLine[4] stays at 21 (Used 1 nobox 1)
.c create rectangle 500 262 740 282 -fill white -width 0
.c create text 620 272 -text "cha?MSG1,FMT2,NON1,NON2,A"
.c create line 620 306 460 306 -fill darkblue -tags mesg -width 2
.c create line 460 306 300 306 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 620 296 -fill #eef -dash {6 4}
.c create line 620 288 620 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 21 to 23 (Used 1 nobox 1)
# ProcLine[4] stays at 23 (Used 1 nobox 1)
.c create rectangle 516 286 724 306 -fill white -width 0
.c create text 620 296 -text "cha!MSG1,I,NON1,NON2,A"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 620 320 -fill #eef -dash {6 4}
.c create line 300 168 300 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 11 to 25 (Used 1 nobox 1)
# ProcLine[2] stays at 25 (Used 1 nobox 1)
.c create rectangle 196 310 404 330 -fill white -width 0
.c create text 300 320 -text "cha?MSG1,I,NON1,NON2,A"
.c create line 300 354 460 354 -fill darkblue -tags mesg -width 2
.c create line 460 354 620 354 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 620 344 -fill #eef -dash {6 4}
.c create line 300 336 300 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 25 to 27 (Used 1 nobox 1)
# ProcLine[2] stays at 27 (Used 1 nobox 1)
.c create rectangle 180 334 420 354 -fill white -width 0
.c create text 300 344 -text "cha!MSG2,FMT3,NULL,NON2,I"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 620 368 -fill #eef -dash {6 4}
.c create line 620 312 620 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 23 to 29 (Used 1 nobox 1)
# ProcLine[4] stays at 29 (Used 1 nobox 1)
.c create rectangle 500 358 740 378 -fill white -width 0
.c create text 620 368 -text "cha?MSG2,FMT3,NULL,NON2,I"
.c create line 620 402 540 402 -fill darkblue -tags mesg -width 2
.c create line 540 402 460 402 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 620 392 -fill #eef -dash {6 4}
.c create line 620 384 620 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 29 to 31 (Used 1 nobox 1)
# ProcLine[4] stays at 31 (Used 1 nobox 1)
.c create rectangle 516 382 724 402 -fill white -width 0
.c create text 620 392 -text "cha!MSG2,I,NULL,NON2,B"
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 620 416 -fill #eef -dash {6 4}
.c create line 460 264 460 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 19 to 33 (Used 1 nobox 1)
# ProcLine[3] stays at 33 (Used 1 nobox 1)
.c create rectangle 356 406 564 426 -fill white -width 0
.c create text 460 416 -text "cha?MSG2,I,NULL,NON2,B"
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 620 440 -fill #eef -dash {6 4}
.c create line 140 144 140 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 9 to 35 (Used 1 nobox 1)
# ProcLine[1] stays at 35 (Used 1 nobox 1)
.c create rectangle 127 430 153 450 -fill white -width 0
.c create text 140 440 -text "#45"
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 620 464 -fill #eef -dash {6 4}
.c create line 140 456 140 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 35 to 37 (Used 1 nobox 1)
# ProcLine[1] stays at 37 (Used 1 nobox 1)
.c create rectangle 103 454 177 474 -fill white -width 0
.c create text 140 464 -text " CYCLE>"
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 620 488 -fill #eef -dash {6 4}
.c create line 140 480 140 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 37 to 39 (Used 1 nobox 1)
# ProcLine[1] stays at 39 (Used 1 nobox 1)
.c create rectangle 127 478 153 498 -fill white -width 0
.c create text 140 488 -text "#23"
.c lower grid
.c raise mesg
