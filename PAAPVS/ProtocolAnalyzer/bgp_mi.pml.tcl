# maxx 1
# maxx 2
# maxx 3
# maxx 4
# maxx 5
# Scaler 0.562500, MH 1066
wm title . "scenario"
wm geometry . 1120x600+650+100
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
.c create line 140 32 940 32 -fill #eef -dash {6 4}
.c create line 300 36 300 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 1 (Used 0 nobox 0)
.c create rectangle 264 24 340 44 -fill black
# ProcLine[2] stays at 1 (Used 0 nobox 0)
.c create rectangle 263 22 337 42 -fill ivory
.c create text 300 32 -text "1:route0"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 940 56 -fill #eef -dash {6 4}
.c create line 460 36 460 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 424 48 500 68 -fill black
# ProcLine[3] stays at 3 (Used 0 nobox 0)
.c create rectangle 423 46 497 66 -fill ivory
.c create text 460 56 -text "2:route1"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 940 80 -fill #eef -dash {6 4}
.c create line 620 36 620 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 5 (Used 0 nobox 0)
.c create rectangle 584 72 660 92 -fill black
# ProcLine[4] stays at 5 (Used 0 nobox 0)
.c create rectangle 583 70 657 90 -fill ivory
.c create text 620 80 -text "3:route2"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 940 104 -fill #eef -dash {6 4}
.c create line 780 36 780 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 7 (Used 0 nobox 0)
.c create rectangle 744 96 820 116 -fill black
# ProcLine[5] stays at 7 (Used 0 nobox 0)
.c create rectangle 743 94 817 114 -fill ivory
.c create text 780 104 -text "4:attack"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 940 128 -fill #eef -dash {6 4}
.c create line 940 36 940 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[6] from 0 to 9 (Used 0 nobox 0)
.c create rectangle 910 120 974 140 -fill black
# ProcLine[6] stays at 9 (Used 0 nobox 0)
.c create rectangle 908 118 972 138 -fill ivory
.c create text 940 128 -text "5:timer"
.c create line 620 162 540 162 -fill darkblue -tags mesg -width 2
.c create line 540 162 540 262 -fill darkblue -tags mesg -width 2
.c create line 540 262 460 262 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 940 152 -fill #eef -dash {6 4}
.c create line 620 96 620 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 5 to 11 (Used 1 nobox 0)
# ProcLine[4] stays at 11 (Used 1 nobox 1)
.c create rectangle 498 142 742 162 -fill white -width 0
.c create text 620 152 -text "out1!OPEN,12,131,0,0,0,0,0"
.c create line 620 186 460 186 -fill darkblue -tags mesg -width 2
.c create line 460 186 460 598 -fill darkblue -tags mesg -width 2
.c create line 460 598 300 598 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 940 176 -fill #eef -dash {6 4}
.c create line 620 168 620 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 11 to 13 (Used 1 nobox 1)
# ProcLine[4] stays at 13 (Used 1 nobox 1)
.c create rectangle 498 166 742 186 -fill white -width 0
.c create text 620 176 -text "out2!OPEN,12,121,0,0,0,0,0"
.c create line 460 210 380 210 -fill darkblue -tags mesg -width 2
.c create line 380 210 380 526 -fill darkblue -tags mesg -width 2
.c create line 380 526 300 526 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 940 200 -fill #eef -dash {6 4}
.c create line 460 72 460 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 3 to 15 (Used 1 nobox 1)
# ProcLine[3] stays at 15 (Used 1 nobox 1)
.c create rectangle 338 190 582 210 -fill white -width 0
.c create text 460 200 -text "out1!OPEN,11,101,0,0,0,0,0"
.c create line 460 234 540 234 -fill darkblue -tags mesg -width 2
.c create line 540 234 620 234 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 940 224 -fill #eef -dash {6 4}
.c create line 460 216 460 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 15 to 17 (Used 1 nobox 1)
# ProcLine[3] stays at 17 (Used 1 nobox 1)
.c create rectangle 338 214 582 234 -fill white -width 0
.c create text 460 224 -text "out2!OPEN,11,111,0,0,0,0,0"
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 940 248 -fill #eef -dash {6 4}
.c create line 620 192 620 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 13 to 19 (Used 1 nobox 1)
# ProcLine[4] stays at 19 (Used 1 nobox 1)
.c create rectangle 500 238 740 258 -fill white -width 0
.c create text 620 248 -text "in1?OPEN,11,111,0,0,0,0,0"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 940 272 -fill #eef -dash {6 4}
.c create line 460 240 460 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 17 to 21 (Used 1 nobox 1)
# ProcLine[3] stays at 21 (Used 1 nobox 1)
.c create rectangle 340 262 580 282 -fill white -width 0
.c create text 460 272 -text "in2?OPEN,12,131,0,0,0,0,0"
.c create line 460 306 540 306 -fill darkblue -tags mesg -width 2
.c create line 540 306 540 430 -fill darkblue -tags mesg -width 2
.c create line 540 430 620 430 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 940 296 -fill #eef -dash {6 4}
.c create line 460 288 460 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 21 to 23 (Used 1 nobox 1)
# ProcLine[3] stays at 23 (Used 1 nobox 1)
.c create rectangle 327 286 593 306 -fill white -width 0
.c create text 460 296 -text "out2!KEEPALIVE,0,0,0,0,0,0,0"
.c create line 300 330 380 330 -fill darkblue -tags mesg -width 2
.c create line 380 330 460 330 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 940 320 -fill #eef -dash {6 4}
.c create line 300 48 300 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 1 to 25 (Used 1 nobox 1)
# ProcLine[2] stays at 25 (Used 1 nobox 1)
.c create rectangle 180 310 420 330 -fill white -width 0
.c create text 300 320 -text "out1!OPEN,10,91,0,0,0,0,0"
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 940 344 -fill #eef -dash {6 4}
.c create line 460 312 460 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 23 to 27 (Used 1 nobox 1)
# ProcLine[3] stays at 27 (Used 1 nobox 1)
.c create rectangle 346 334 574 354 -fill white -width 0
.c create text 460 344 -text "in1?OPEN,10,91,0,0,0,0,0"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 940 368 -fill #eef -dash {6 4}
.c create line 460 360 460 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 27 to 29 (Used 1 nobox 1)
# ProcLine[3] stays at 29 (Used 1 nobox 1)
.c create rectangle 332 358 588 378 -fill white -width 0
.c create text 460 368 -text "in2?KEEPALIVE,0,0,0,0,0,0,0"
.c create line 300 402 460 402 -fill darkblue -tags mesg -width 2
.c create line 460 402 620 402 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 940 392 -fill #eef -dash {6 4}
.c create line 300 336 300 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 25 to 31 (Used 1 nobox 1)
# ProcLine[2] stays at 31 (Used 1 nobox 1)
.c create rectangle 180 382 420 402 -fill white -width 0
.c create text 300 392 -text "out2!OPEN,10,81,0,0,0,0,0"
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 940 416 -fill #eef -dash {6 4}
.c create line 620 264 620 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 19 to 33 (Used 1 nobox 1)
# ProcLine[4] stays at 33 (Used 1 nobox 1)
.c create rectangle 506 406 734 426 -fill white -width 0
.c create text 620 416 -text "in2?OPEN,10,81,0,0,0,0,0"
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 940 440 -fill #eef -dash {6 4}
.c create line 620 432 620 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 33 to 35 (Used 1 nobox 1)
# ProcLine[4] stays at 35 (Used 1 nobox 1)
.c create rectangle 492 430 748 450 -fill white -width 0
.c create text 620 440 -text "in1?KEEPALIVE,0,0,0,0,0,0,0"
.c create line 620 474 540 474 -fill darkblue -tags mesg -width 2
.c create line 540 474 540 502 -fill darkblue -tags mesg -width 2
.c create line 540 502 460 502 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 940 464 -fill #eef -dash {6 4}
.c create line 620 456 620 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 35 to 37 (Used 1 nobox 1)
# ProcLine[4] stays at 37 (Used 1 nobox 1)
.c create rectangle 516 454 724 474 -fill white -width 0
.c create text 620 464 -text "out1!ACK,0,0,0,0,0,0,0"
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 940 488 -fill #eef -dash {6 4}
.c create line 620 480 620 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 37 to 39 (Used 1 nobox 1)
# ProcLine[4] stays at 39 (Used 1 nobox 1)
.c create rectangle 522 478 718 498 -fill white -width 0
.c create text 620 488 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 940 512 -fill #eef -dash {6 4}
.c create line 460 384 460 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 29 to 41 (Used 1 nobox 1)
# ProcLine[3] stays at 41 (Used 1 nobox 1)
.c create rectangle 362 502 558 522 -fill white -width 0
.c create text 460 512 -text "in2?ACK,0,0,0,0,0,0,0"
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 940 536 -fill #eef -dash {6 4}
.c create line 300 408 300 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 31 to 43 (Used 1 nobox 1)
# ProcLine[2] stays at 43 (Used 1 nobox 1)
.c create rectangle 180 526 420 546 -fill white -width 0
.c create text 300 536 -text "in1?OPEN,11,101,0,0,0,0,0"
.c create line 300 570 380 570 -fill darkblue -tags mesg -width 2
.c create line 380 570 460 570 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 940 560 -fill #eef -dash {6 4}
.c create line 300 552 300 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 43 to 45 (Used 1 nobox 1)
# ProcLine[2] stays at 45 (Used 1 nobox 1)
.c create rectangle 167 550 433 570 -fill white -width 0
.c create text 300 560 -text "out1!KEEPALIVE,0,0,0,0,0,0,0"
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 940 584 -fill #eef -dash {6 4}
.c create line 460 528 460 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 41 to 47 (Used 1 nobox 1)
# ProcLine[3] stays at 47 (Used 1 nobox 1)
.c create rectangle 332 574 588 594 -fill white -width 0
.c create text 460 584 -text "in1?KEEPALIVE,0,0,0,0,0,0,0"
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 940 608 -fill #eef -dash {6 4}
.c create line 300 576 300 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 45 to 49 (Used 1 nobox 1)
# ProcLine[2] stays at 49 (Used 1 nobox 1)
.c create rectangle 180 598 420 618 -fill white -width 0
.c create text 300 608 -text "in2?OPEN,12,121,0,0,0,0,0"
.c create line 300 642 460 642 -fill darkblue -tags mesg -width 2
.c create line 460 642 620 642 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 632 -fill #eef -text "51"
.c create line 140 632 940 632 -fill #eef -dash {6 4}
.c create line 300 624 300 620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 49 to 51 (Used 1 nobox 1)
# ProcLine[2] stays at 51 (Used 1 nobox 1)
.c create rectangle 167 622 433 642 -fill white -width 0
.c create text 300 632 -text "out2!KEEPALIVE,0,0,0,0,0,0,0"
.c create text 70 656 -fill #eef -text "53"
.c create line 140 656 940 656 -fill #eef -dash {6 4}
.c create line 620 504 620 644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 39 to 53 (Used 1 nobox 1)
# ProcLine[4] stays at 53 (Used 1 nobox 1)
.c create rectangle 492 646 748 666 -fill white -width 0
.c create text 620 656 -text "in2?KEEPALIVE,0,0,0,0,0,0,0"
.c create text 70 680 -fill #eef -text "55"
.c create line 140 680 940 680 -fill #eef -dash {6 4}
.c create line 300 648 300 668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 51 to 55 (Used 1 nobox 1)
# ProcLine[2] stays at 55 (Used 1 nobox 1)
.c create rectangle 172 670 428 690 -fill white -width 0
.c create text 300 680 -text "in1?KEEPALIVE,0,0,0,0,0,0,0"
.c create line 300 714 380 714 -fill darkblue -tags mesg -width 2
.c create line 380 714 460 714 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 704 -fill #eef -text "57"
.c create line 140 704 940 704 -fill #eef -dash {6 4}
.c create line 300 696 300 692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 55 to 57 (Used 1 nobox 1)
# ProcLine[2] stays at 57 (Used 1 nobox 1)
.c create rectangle 196 694 404 714 -fill white -width 0
.c create text 300 704 -text "out1!ACK,0,0,0,0,0,0,0"
.c create text 70 728 -fill #eef -text "59"
.c create line 140 728 940 728 -fill #eef -dash {6 4}
.c create line 460 600 460 716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 47 to 59 (Used 1 nobox 1)
# ProcLine[3] stays at 59 (Used 1 nobox 1)
.c create rectangle 362 718 558 738 -fill white -width 0
.c create text 460 728 -text "in1?ACK,0,0,0,0,0,0,0"
.c create line 460 762 540 762 -fill darkblue -tags mesg -width 2
.c create line 540 762 540 1054 -fill darkblue -tags mesg -width 2
.c create line 540 1054 620 1054 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 752 -fill #eef -text "61"
.c create line 140 752 940 752 -fill #eef -dash {6 4}
.c create line 460 744 460 740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 59 to 61 (Used 1 nobox 1)
# ProcLine[3] stays at 61 (Used 1 nobox 1)
.c create rectangle 316 742 604 762 -fill white -width 0
.c create text 460 752 -text "out2!UPDATE,0,0,11,0,0,101,100"
.c create text 70 776 -fill #eef -text "63"
.c create line 140 776 940 776 -fill #eef -dash {6 4}
.c create line 460 768 460 764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 61 to 63 (Used 1 nobox 1)
# ProcLine[3] stays at 63 (Used 1 nobox 1)
.c create rectangle 327 766 593 786 -fill white -width 0
.c create text 460 776 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 800 -fill #eef -text "65"
.c create line 140 800 940 800 -fill #eef -dash {6 4}
.c create line 460 792 460 788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 63 to 65 (Used 1 nobox 1)
# ProcLine[3] stays at 65 (Used 1 nobox 1)
.c create rectangle 327 790 593 810 -fill white -width 0
.c create text 460 800 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 824 -fill #eef -text "67"
.c create line 140 824 940 824 -fill #eef -dash {6 4}
.c create line 460 816 460 812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 65 to 67 (Used 1 nobox 1)
# ProcLine[3] stays at 67 (Used 1 nobox 1)
.c create rectangle 327 814 593 834 -fill white -width 0
.c create text 460 824 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 848 -fill #eef -text "69"
.c create line 140 848 940 848 -fill #eef -dash {6 4}
.c create line 460 840 460 836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 67 to 69 (Used 1 nobox 1)
# ProcLine[3] stays at 69 (Used 1 nobox 1)
.c create rectangle 327 838 593 858 -fill white -width 0
.c create text 460 848 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 872 -fill #eef -text "71"
.c create line 140 872 940 872 -fill #eef -dash {6 4}
.c create line 460 864 460 860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 69 to 71 (Used 1 nobox 1)
# ProcLine[3] stays at 71 (Used 1 nobox 1)
.c create rectangle 327 862 593 882 -fill white -width 0
.c create text 460 872 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 896 -fill #eef -text "73"
.c create line 140 896 940 896 -fill #eef -dash {6 4}
.c create line 460 888 460 884 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 71 to 73 (Used 1 nobox 1)
# ProcLine[3] stays at 73 (Used 1 nobox 1)
.c create rectangle 327 886 593 906 -fill white -width 0
.c create text 460 896 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 920 -fill #eef -text "75"
.c create line 140 920 940 920 -fill #eef -dash {6 4}
.c create line 460 912 460 908 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 73 to 75 (Used 1 nobox 1)
# ProcLine[3] stays at 75 (Used 1 nobox 1)
.c create rectangle 327 910 593 930 -fill white -width 0
.c create text 460 920 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 944 -fill #eef -text "77"
.c create line 140 944 940 944 -fill #eef -dash {6 4}
.c create line 460 936 460 932 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 75 to 77 (Used 1 nobox 1)
# ProcLine[3] stays at 77 (Used 1 nobox 1)
.c create rectangle 327 934 593 954 -fill white -width 0
.c create text 460 944 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 968 -fill #eef -text "79"
.c create line 140 968 940 968 -fill #eef -dash {6 4}
.c create line 300 720 300 956 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 57 to 79 (Used 1 nobox 1)
# ProcLine[2] stays at 79 (Used 1 nobox 1)
.c create rectangle 172 958 428 978 -fill white -width 0
.c create text 300 968 -text "in2?KEEPALIVE,0,0,0,0,0,0,0"
.c create line 300 1002 460 1002 -fill darkblue -tags mesg -width 2
.c create line 460 1002 620 1002 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 992 -fill #eef -text "81"
.c create line 140 992 940 992 -fill #eef -dash {6 4}
.c create line 300 984 300 980 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 79 to 81 (Used 1 nobox 1)
# ProcLine[2] stays at 81 (Used 1 nobox 1)
.c create rectangle 196 982 404 1002 -fill white -width 0
.c create text 300 992 -text "out2!ACK,0,0,0,0,0,0,0"
.c create text 70 1016 -fill #eef -text "83"
.c create line 140 1016 940 1016 -fill #eef -dash {6 4}
.c create line 620 672 620 1004 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 53 to 83 (Used 1 nobox 1)
# ProcLine[4] stays at 83 (Used 1 nobox 1)
.c create rectangle 522 1006 718 1026 -fill white -width 0
.c create text 620 1016 -text "in2?ACK,0,0,0,0,0,0,0"
.c create line 620 1050 540 1050 -fill darkblue -tags mesg -width 2
.c create line 540 1050 540 1582 -fill darkblue -tags mesg -width 2
.c create line 540 1582 460 1582 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1040 -fill #eef -text "85"
.c create line 140 1040 940 1040 -fill #eef -dash {6 4}
.c create line 620 1032 620 1028 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 83 to 85 (Used 1 nobox 1)
# ProcLine[4] stays at 85 (Used 1 nobox 1)
.c create rectangle 476 1030 764 1050 -fill white -width 0
.c create text 620 1040 -text "out1!UPDATE,0,0,12,0,0,121,120"
.c create text 70 1064 -fill #eef -text "87"
.c create line 140 1064 940 1064 -fill #eef -dash {6 4}
.c create line 620 1056 620 1052 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 85 to 87 (Used 1 nobox 1)
# ProcLine[4] stays at 87 (Used 1 nobox 1)
.c create rectangle 482 1054 758 1074 -fill white -width 0
.c create text 620 1064 -text "in1?UPDATE,0,0,11,0,0,101,100"
.c create text 70 1088 -fill #eef -text "89"
.c create line 140 1088 940 1088 -fill #eef -dash {6 4}
.c create line 620 1080 620 1076 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 87 to 89 (Used 1 nobox 1)
# ProcLine[4] stays at 89 (Used 1 nobox 1)
.c create rectangle 482 1078 758 1098 -fill white -width 0
.c create text 620 1088 -text "in1?UPDATE,0,0,11,0,0,111,110"
.c create text 70 1112 -fill #eef -text "91"
.c create line 140 1112 940 1112 -fill #eef -dash {6 4}
.c create line 300 1008 300 1100 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 81 to 91 (Used 1 nobox 1)
# ProcLine[2] stays at 91 (Used 1 nobox 1)
.c create rectangle 202 1102 398 1122 -fill white -width 0
.c create text 300 1112 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 1136 -fill #eef -text "93"
.c create line 140 1136 940 1136 -fill #eef -dash {6 4}
.c create line 460 960 460 1124 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 77 to 93 (Used 1 nobox 1)
# ProcLine[3] stays at 93 (Used 1 nobox 1)
.c create rectangle 327 1126 593 1146 -fill white -width 0
.c create text 460 1136 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 1160 -fill #eef -text "95"
.c create line 140 1160 940 1160 -fill #eef -dash {6 4}
.c create line 300 1128 300 1148 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 91 to 95 (Used 1 nobox 1)
# ProcLine[2] stays at 95 (Used 1 nobox 1)
.c create rectangle 202 1150 398 1170 -fill white -width 0
.c create text 300 1160 -text "in2?ACK,0,0,0,0,0,0,0"
.c create line 300 1194 460 1194 -fill darkblue -tags mesg -width 2
.c create line 460 1194 620 1194 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1184 -fill #eef -text "97"
.c create line 140 1184 940 1184 -fill #eef -dash {6 4}
.c create line 300 1176 300 1172 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 95 to 97 (Used 1 nobox 1)
# ProcLine[2] stays at 97 (Used 1 nobox 1)
.c create rectangle 167 1174 433 1194 -fill white -width 0
.c create text 300 1184 -text "out2!UPDATE,0,0,10,0,0,81,80"
.c create text 70 1208 -fill #eef -text "99"
.c create line 140 1208 940 1208 -fill #eef -dash {6 4}
.c create line 620 1104 620 1196 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 89 to 99 (Used 1 nobox 1)
# ProcLine[4] stays at 99 (Used 1 nobox 1)
.c create rectangle 492 1198 748 1218 -fill white -width 0
.c create text 620 1208 -text "in2?UPDATE,0,0,10,0,0,81,80"
.c create line 300 1242 460 1242 -fill darkblue -tags mesg -width 2
.c create line 460 1242 620 1242 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1232 -fill #eef -text "101"
.c create line 140 1232 940 1232 -fill #eef -dash {6 4}
.c create line 300 1200 300 1220 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 97 to 101 (Used 1 nobox 1)
# ProcLine[2] stays at 101 (Used 1 nobox 1)
.c create rectangle 167 1222 433 1242 -fill white -width 0
.c create text 300 1232 -text "out2!UPDATE,0,0,10,0,0,91,90"
.c create text 70 1256 -fill #eef -text "103"
.c create line 140 1256 940 1256 -fill #eef -dash {6 4}
.c create line 620 1224 620 1244 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 99 to 103 (Used 1 nobox 1)
# ProcLine[4] stays at 103 (Used 1 nobox 1)
.c create rectangle 492 1246 748 1266 -fill white -width 0
.c create text 620 1256 -text "in2?UPDATE,0,0,10,0,0,91,90"
.c create text 70 1280 -fill #eef -text "105"
.c create line 140 1280 940 1280 -fill #eef -dash {6 4}
.c create line 300 1248 300 1268 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 101 to 105 (Used 1 nobox 1)
# ProcLine[2] stays at 105 (Used 1 nobox 1)
.c create rectangle 162 1270 438 1290 -fill white -width 0
.c create text 300 1280 -text "in1?UPDATE,0,0,11,0,0,101,100"
.c create text 70 1304 -fill #eef -text "107"
.c create line 140 1304 940 1304 -fill #eef -dash {6 4}
.c create line 460 1152 460 1292 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 93 to 107 (Used 1 nobox 1)
# ProcLine[3] stays at 107 (Used 1 nobox 1)
.c create rectangle 327 1294 593 1314 -fill white -width 0
.c create text 460 1304 -text "in1?UPDATE,0,0,10,0,0,211,90"
.c create text 70 1328 -fill #eef -text "109"
.c create line 140 1328 940 1328 -fill #eef -dash {6 4}
.c create line 300 1296 300 1316 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 105 to 109 (Used 1 nobox 1)
# ProcLine[2] stays at 109 (Used 1 nobox 1)
.c create rectangle 162 1318 438 1338 -fill white -width 0
.c create text 300 1328 -text "in1?UPDATE,0,0,11,0,0,111,110"
.c create text 70 1352 -fill #eef -text "111"
.c create line 140 1352 940 1352 -fill #eef -dash {6 4}
.c create line 460 1320 460 1340 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 107 to 111 (Used 1 nobox 1)
# ProcLine[3] stays at 111 (Used 1 nobox 1)
.c create rectangle 332 1342 588 1362 -fill white -width 0
.c create text 460 1352 -text "in1?UPDATE,0,0,10,0,0,81,80"
.c create text 70 1376 -fill #eef -text "113"
.c create line 140 1376 940 1376 -fill #eef -dash {6 4}
.c create line 300 1344 300 1364 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 109 to 113 (Used 1 nobox 1)
# ProcLine[2] stays at 113 (Used 1 nobox 1)
.c create rectangle 162 1366 438 1386 -fill white -width 0
.c create text 300 1376 -text "in2?UPDATE,0,0,12,0,0,121,120"
.c create line 300 1410 460 1410 -fill darkblue -tags mesg -width 2
.c create line 460 1410 620 1410 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1400 -fill #eef -text "115"
.c create line 140 1400 940 1400 -fill #eef -dash {6 4}
.c create line 300 1392 300 1388 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 113 to 115 (Used 1 nobox 1)
# ProcLine[2] stays at 115 (Used 1 nobox 1)
.c create rectangle 196 1390 404 1410 -fill white -width 0
.c create text 300 1400 -text "out2!ACK,0,0,0,0,0,0,0"
.c create text 70 1424 -fill #eef -text "117"
.c create line 140 1424 940 1424 -fill #eef -dash {6 4}
.c create line 620 1272 620 1412 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 103 to 117 (Used 1 nobox 1)
# ProcLine[4] stays at 117 (Used 1 nobox 1)
.c create rectangle 522 1414 718 1434 -fill white -width 0
.c create text 620 1424 -text "in2?ACK,0,0,0,0,0,0,0"
.c create text 70 1448 -fill #eef -text "119"
.c create line 140 1448 940 1448 -fill #eef -dash {6 4}
.c create line 300 1416 300 1436 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 115 to 119 (Used 1 nobox 1)
# ProcLine[2] stays at 119 (Used 1 nobox 1)
.c create rectangle 162 1438 438 1458 -fill white -width 0
.c create text 300 1448 -text "in2?UPDATE,0,0,12,0,0,131,130"
.c create line 300 1482 460 1482 -fill darkblue -tags mesg -width 2
.c create line 460 1482 620 1482 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1472 -fill #eef -text "121"
.c create line 140 1472 940 1472 -fill #eef -dash {6 4}
.c create line 300 1464 300 1460 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 119 to 121 (Used 1 nobox 1)
# ProcLine[2] stays at 121 (Used 1 nobox 1)
.c create rectangle 196 1462 404 1482 -fill white -width 0
.c create text 300 1472 -text "out2!ACK,0,0,0,0,0,0,0"
.c create text 70 1496 -fill #eef -text "123"
.c create line 140 1496 940 1496 -fill #eef -dash {6 4}
.c create line 620 1440 620 1484 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 117 to 123 (Used 1 nobox 1)
# ProcLine[4] stays at 123 (Used 1 nobox 1)
.c create rectangle 522 1486 718 1506 -fill white -width 0
.c create text 620 1496 -text "in2?ACK,0,0,0,0,0,0,0"
.c create text 70 1520 -fill #eef -text "125"
.c create line 140 1520 940 1520 -fill #eef -dash {6 4}
.c create line 300 1488 300 1508 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 121 to 125 (Used 1 nobox 1)
# ProcLine[2] stays at 125 (Used 1 nobox 1)
.c create rectangle 202 1510 398 1530 -fill white -width 0
.c create text 300 1520 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 1544 -fill #eef -text "127"
.c create line 140 1544 940 1544 -fill #eef -dash {6 4}
.c create line 460 1368 460 1532 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 111 to 127 (Used 1 nobox 1)
# ProcLine[3] stays at 127 (Used 1 nobox 1)
.c create rectangle 332 1534 588 1554 -fill white -width 0
.c create text 460 1544 -text "in1?UPDATE,0,0,10,0,0,91,90"
.c create text 70 1568 -fill #eef -text "129"
.c create line 140 1568 940 1568 -fill #eef -dash {6 4}
.c create line 300 1536 300 1556 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 125 to 129 (Used 1 nobox 1)
# ProcLine[2] stays at 129 (Used 1 nobox 1)
.c create rectangle 202 1558 398 1578 -fill white -width 0
.c create text 300 1568 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 1592 -fill #eef -text "131"
.c create line 140 1592 940 1592 -fill #eef -dash {6 4}
.c create line 460 1560 460 1580 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 127 to 131 (Used 1 nobox 1)
# ProcLine[3] stays at 131 (Used 1 nobox 1)
.c create rectangle 322 1582 598 1602 -fill white -width 0
.c create text 460 1592 -text "in2?UPDATE,0,0,12,0,0,121,120"
.c create line 460 1626 540 1626 -fill darkblue -tags mesg -width 2
.c create line 540 1626 620 1626 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1616 -fill #eef -text "133"
.c create line 140 1616 940 1616 -fill #eef -dash {6 4}
.c create line 460 1608 460 1604 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 131 to 133 (Used 1 nobox 1)
# ProcLine[3] stays at 133 (Used 1 nobox 1)
.c create rectangle 356 1606 564 1626 -fill white -width 0
.c create text 460 1616 -text "out2!ACK,0,0,0,0,0,0,0"
.c create text 70 1640 -fill #eef -text "135"
.c create line 140 1640 940 1640 -fill #eef -dash {6 4}
.c create line 620 1512 620 1628 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 123 to 135 (Used 1 nobox 1)
# ProcLine[4] stays at 135 (Used 1 nobox 1)
.c create rectangle 522 1630 718 1650 -fill white -width 0
.c create text 620 1640 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 1664 -fill #eef -text "137"
.c create line 140 1664 940 1664 -fill #eef -dash {6 4}
.c create line 460 1632 460 1652 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 133 to 137 (Used 1 nobox 1)
# ProcLine[3] stays at 137 (Used 1 nobox 1)
.c create rectangle 322 1654 598 1674 -fill white -width 0
.c create text 460 1664 -text "in2?UPDATE,0,0,12,0,0,131,130"
.c create line 460 1698 540 1698 -fill darkblue -tags mesg -width 2
.c create line 540 1698 620 1698 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1688 -fill #eef -text "139"
.c create line 140 1688 940 1688 -fill #eef -dash {6 4}
.c create line 460 1680 460 1676 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 137 to 139 (Used 1 nobox 1)
# ProcLine[3] stays at 139 (Used 1 nobox 1)
.c create rectangle 356 1678 564 1698 -fill white -width 0
.c create text 460 1688 -text "out2!ACK,0,0,0,0,0,0,0"
.c create text 70 1712 -fill #eef -text "141"
.c create line 140 1712 940 1712 -fill #eef -dash {6 4}
.c create line 620 1656 620 1700 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 135 to 141 (Used 1 nobox 1)
# ProcLine[4] stays at 141 (Used 1 nobox 1)
.c create rectangle 522 1702 718 1722 -fill white -width 0
.c create text 620 1712 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 1736 -fill #eef -text "143"
.c create line 140 1736 940 1736 -fill #eef -dash {6 4}
.c create line 460 1704 460 1724 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 139 to 143 (Used 1 nobox 1)
# ProcLine[3] stays at 143 (Used 1 nobox 1)
.c create rectangle 362 1726 558 1746 -fill white -width 0
.c create text 460 1736 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 1760 -fill #eef -text "145"
.c create line 140 1760 940 1760 -fill #eef -dash {6 4}
.c create line 460 1752 460 1748 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 143 to 145 (Used 1 nobox 1)
# ProcLine[3] stays at 145 (Used 1 nobox 1)
.c create rectangle 362 1750 558 1770 -fill white -width 0
.c create text 460 1760 -text "in1?ACK,0,0,0,0,0,0,0"
.c create text 70 1784 -fill #eef -text "147"
.c create line 140 1784 940 1784 -fill #eef -dash {6 4}
.c create line 460 1776 460 1772 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 145 to 147 (Used 1 nobox 1)
# ProcLine[3] stays at 147 (Used 1 nobox 1)
.c create rectangle 362 1774 558 1794 -fill white -width 0
.c create text 460 1784 -text "in2?ACK,0,0,0,0,0,0,0"
.c create text 70 1808 -fill #eef -text "149"
.c create line 140 1808 940 1808 -fill #eef -dash {6 4}
.c create line 460 1800 460 1796 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 147 to 149 (Used 1 nobox 1)
# ProcLine[3] stays at 149 (Used 1 nobox 1)
.c create rectangle 362 1798 558 1818 -fill white -width 0
.c create text 460 1808 -text "in2?ACK,0,0,0,0,0,0,0"
.c lower grid
.c raise mesg
