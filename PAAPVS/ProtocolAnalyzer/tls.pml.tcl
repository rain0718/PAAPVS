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
.c create text 140 32 -text "#5"
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
.c create text 140 80 -text "#49"
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
.c create rectangle 412 142 508 162 -fill white -width 0
.c create text 460 152 -text "cha!C,Nc,C"
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 780 176 -fill #eef -dash {6 4}
.c create line 780 36 780 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 13 (Used 0 nobox 1)
# ProcLine[5] stays at 13 (Used 0 nobox 0)
.c create rectangle 732 166 828 186 -fill ivory
.c create text 780 176 -text "cha?C,Nc,C"
.c create line 780 210 700 210 -fill darkblue -tags mesg -width 2
.c create line 700 210 620 210 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 780 200 -fill #eef -dash {6 4}
.c create line 780 192 780 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 13 to 15 (Used 1 nobox 0)
# ProcLine[5] stays at 15 (Used 1 nobox 1)
.c create rectangle 732 190 828 210 -fill white -width 0
.c create text 780 200 -text "cha!S,Nc,I"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 780 224 -fill #eef -dash {6 4}
.c create line 620 144 620 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 9 to 17 (Used 1 nobox 1)
# ProcLine[4] stays at 17 (Used 1 nobox 1)
.c create rectangle 572 214 668 234 -fill white -width 0
.c create text 620 224 -text "cha?S,Nc,I"
.c create line 620 258 700 258 -fill darkblue -tags mesg -width 2
.c create line 700 258 780 258 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 780 248 -fill #eef -dash {6 4}
.c create line 620 240 620 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 17 to 19 (Used 1 nobox 1)
# ProcLine[4] stays at 19 (Used 1 nobox 1)
.c create rectangle 572 238 668 258 -fill white -width 0
.c create text 620 248 -text "cha!S,Ns,S"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 780 272 -fill #eef -dash {6 4}
.c create line 780 216 780 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 15 to 21 (Used 1 nobox 1)
# ProcLine[5] stays at 21 (Used 1 nobox 1)
.c create rectangle 732 262 828 282 -fill white -width 0
.c create text 780 272 -text "cha?S,Ns,S"
.c create line 780 306 620 306 -fill darkblue -tags mesg -width 2
.c create line 620 306 460 306 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 780 296 -fill #eef -dash {6 4}
.c create line 780 288 780 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 21 to 23 (Used 1 nobox 1)
# ProcLine[5] stays at 23 (Used 1 nobox 1)
.c create rectangle 732 286 828 306 -fill white -width 0
.c create text 780 296 -text "cha!C,Ns,S"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 780 320 -fill #eef -dash {6 4}
.c create line 460 168 460 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 11 to 25 (Used 1 nobox 1)
# ProcLine[3] stays at 25 (Used 1 nobox 1)
.c create rectangle 412 310 508 330 -fill white -width 0
.c create text 460 320 -text "cha?C,Ns,S"
.c create line 460 354 620 354 -fill darkblue -tags mesg -width 2
.c create line 620 354 780 354 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 780 344 -fill #eef -dash {6 4}
.c create line 460 336 460 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 25 to 27 (Used 1 nobox 1)
# ProcLine[3] stays at 27 (Used 1 nobox 1)
.c create rectangle 351 334 569 354 -fill white -width 0
.c create text 460 344 -text "chb!C,Kcs,S,C,Ns,Nc,Kcs"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 780 368 -fill #eef -dash {6 4}
.c create line 780 312 780 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 23 to 29 (Used 1 nobox 1)
# ProcLine[5] stays at 29 (Used 1 nobox 1)
.c create rectangle 671 358 889 378 -fill white -width 0
.c create text 780 368 -text "chb?C,Kcs,S,C,Ns,Nc,Kcs"
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 780 392 -fill #eef -dash {6 4}
.c create line 140 96 140 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 5 to 31 (Used 1 nobox 1)
# ProcLine[1] stays at 31 (Used 1 nobox 1)
.c create rectangle 127 382 153 402 -fill white -width 0
.c create text 140 392 -text "#47"
.c create line 780 426 700 426 -fill darkblue -tags mesg -width 2
.c create line 700 426 620 426 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 780 416 -fill #eef -dash {6 4}
.c create line 780 384 780 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 29 to 33 (Used 1 nobox 1)
# ProcLine[5] stays at 33 (Used 1 nobox 1)
.c create rectangle 671 406 889 426 -fill white -width 0
.c create text 780 416 -text "chb!S,Kis,S,I,Ns,Nc,Kis"
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 780 440 -fill #eef -dash {6 4}
.c create line 620 264 620 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 19 to 35 (Used 1 nobox 1)
# ProcLine[4] stays at 35 (Used 1 nobox 1)
.c create rectangle 511 430 729 450 -fill white -width 0
.c create text 620 440 -text "chb?S,Kis,S,I,Ns,Nc,Kis"
.c create line 620 474 700 474 -fill darkblue -tags mesg -width 2
.c create line 700 474 780 474 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 780 464 -fill #eef -dash {6 4}
.c create line 620 456 620 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 35 to 37 (Used 1 nobox 1)
# ProcLine[4] stays at 37 (Used 1 nobox 1)
.c create rectangle 540 454 700 474 -fill white -width 0
.c create text 620 464 -text "chc!S,S,Ns,Nc,Kis"
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 780 488 -fill #eef -dash {6 4}
.c create line 780 432 780 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 33 to 39 (Used 1 nobox 1)
# ProcLine[5] stays at 39 (Used 1 nobox 1)
.c create rectangle 700 478 860 498 -fill white -width 0
.c create text 780 488 -text "chc?S,S,Ns,Nc,Kis"
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 780 512 -fill #eef -dash {6 4}
.c create line 140 408 140 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 31 to 41 (Used 1 nobox 1)
# ProcLine[1] stays at 41 (Used 1 nobox 1)
.c create rectangle 127 502 153 522 -fill white -width 0
.c create text 140 512 -text "#17"
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 780 536 -fill #eef -dash {6 4}
.c create line -20 36 -20 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[0] from 0 to 43 (Used 0 nobox 1)
# ProcLine[0] stays at 43 (Used 0 nobox 0)
.c create rectangle -57 526 17 546 -fill ivory
.c create text -20 536 -text " CYCLE>"
.c lower grid
.c raise mesg
