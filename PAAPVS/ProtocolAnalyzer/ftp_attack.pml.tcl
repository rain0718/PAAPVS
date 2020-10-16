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
.c create rectangle 254 24 350 44 -fill black
# ProcLine[2] stays at 1 (Used 0 nobox 0)
.c create rectangle 252 22 348 42 -fill ivory
.c create text 300 32 -text "1:port1025"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 780 56 -fill #eef -dash {6 4}
.c create line 460 36 460 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 419 48 505 68 -fill black
# ProcLine[3] stays at 3 (Used 0 nobox 0)
.c create rectangle 418 46 502 66 -fill ivory
.c create text 460 56 -text "2:port321"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 780 80 -fill #eef -dash {6 4}
.c create line 620 36 620 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 5 (Used 0 nobox 0)
.c create rectangle 584 72 660 92 -fill black
# ProcLine[4] stays at 5 (Used 0 nobox 0)
.c create rectangle 583 70 657 90 -fill ivory
.c create text 620 80 -text "3:port21"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 780 104 -fill #eef -dash {6 4}
.c create line 780 36 780 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 7 (Used 0 nobox 0)
.c create rectangle 750 96 814 116 -fill black
# ProcLine[5] stays at 7 (Used 0 nobox 0)
.c create rectangle 748 94 812 114 -fill ivory
.c create text 780 104 -text "4:port5"
.c create line 460 138 540 138 -fill darkblue -tags mesg -width 2
.c create line 540 138 620 138 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 780 128 -fill #eef -dash {6 4}
.c create line 460 72 460 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 3 to 9 (Used 1 nobox 0)
# ProcLine[3] stays at 9 (Used 1 nobox 1)
.c create rectangle 428 118 492 138 -fill white -width 0
.c create text 460 128 -text "out!SYN"
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 780 152 -fill #eef -dash {6 4}
.c create line 620 96 620 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 5 to 11 (Used 1 nobox 1)
# ProcLine[4] stays at 11 (Used 1 nobox 1)
.c create rectangle 594 142 646 162 -fill white -width 0
.c create text 620 152 -text "in?SYN"
.c create line 620 186 540 186 -fill darkblue -tags mesg -width 2
.c create line 540 186 460 186 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 780 176 -fill #eef -dash {6 4}
.c create line 620 168 620 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 11 to 13 (Used 1 nobox 1)
# ProcLine[4] stays at 13 (Used 1 nobox 1)
.c create rectangle 559 166 681 186 -fill white -width 0
.c create text 620 176 -text "out!SYNandACK"
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 780 200 -fill #eef -dash {6 4}
.c create line 460 144 460 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 9 to 15 (Used 1 nobox 1)
# ProcLine[3] stays at 15 (Used 1 nobox 1)
.c create rectangle 404 190 516 210 -fill white -width 0
.c create text 460 200 -text "in?SYNandACK"
.c create line 460 234 540 234 -fill darkblue -tags mesg -width 2
.c create line 540 234 620 234 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 780 224 -fill #eef -dash {6 4}
.c create line 460 216 460 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 15 to 17 (Used 1 nobox 1)
# ProcLine[3] stays at 17 (Used 1 nobox 1)
.c create rectangle 428 214 492 234 -fill white -width 0
.c create text 460 224 -text "out!ACK"
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 780 248 -fill #eef -dash {6 4}
.c create line 620 192 620 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 13 to 19 (Used 1 nobox 1)
# ProcLine[4] stays at 19 (Used 1 nobox 1)
.c create rectangle 594 238 646 258 -fill white -width 0
.c create text 620 248 -text "in?ACK"
.c create line 620 282 540 282 -fill darkblue -tags mesg -width 2
.c create line 540 282 460 282 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 780 272 -fill #eef -dash {6 4}
.c create line 620 264 620 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 19 to 21 (Used 1 nobox 1)
# ProcLine[4] stays at 21 (Used 1 nobox 1)
.c create rectangle 583 262 657 282 -fill white -width 0
.c create text 620 272 -text "out!R220"
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 780 296 -fill #eef -dash {6 4}
.c create line 460 240 460 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 17 to 23 (Used 1 nobox 1)
# ProcLine[3] stays at 23 (Used 1 nobox 1)
.c create rectangle 428 286 492 306 -fill white -width 0
.c create text 460 296 -text "in?R220"
.c create line 460 330 540 330 -fill darkblue -tags mesg -width 2
.c create line 540 330 620 330 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 780 320 -fill #eef -dash {6 4}
.c create line 460 312 460 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 23 to 25 (Used 1 nobox 1)
# ProcLine[3] stays at 25 (Used 1 nobox 1)
.c create rectangle 423 310 497 330 -fill white -width 0
.c create text 460 320 -text "out!USER"
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 780 344 -fill #eef -dash {6 4}
.c create line 620 288 620 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 21 to 27 (Used 1 nobox 1)
# ProcLine[4] stays at 27 (Used 1 nobox 1)
.c create rectangle 588 334 652 354 -fill white -width 0
.c create text 620 344 -text "in?USER"
.c create line 620 378 540 378 -fill darkblue -tags mesg -width 2
.c create line 540 378 460 378 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 780 368 -fill #eef -dash {6 4}
.c create line 620 360 620 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 27 to 29 (Used 1 nobox 1)
# ProcLine[4] stays at 29 (Used 1 nobox 1)
.c create rectangle 583 358 657 378 -fill white -width 0
.c create text 620 368 -text "out!R331"
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 780 392 -fill #eef -dash {6 4}
.c create line 460 336 460 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 25 to 31 (Used 1 nobox 1)
# ProcLine[3] stays at 31 (Used 1 nobox 1)
.c create rectangle 428 382 492 402 -fill white -width 0
.c create text 460 392 -text "in?R331"
.c create line 460 426 540 426 -fill darkblue -tags mesg -width 2
.c create line 540 426 620 426 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 780 416 -fill #eef -dash {6 4}
.c create line 460 408 460 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 31 to 33 (Used 1 nobox 1)
# ProcLine[3] stays at 33 (Used 1 nobox 1)
.c create rectangle 404 406 516 426 -fill white -width 0
.c create text 460 416 -text "out!PASSWORD"
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 780 440 -fill #eef -dash {6 4}
.c create line 620 384 620 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 29 to 35 (Used 1 nobox 1)
# ProcLine[4] stays at 35 (Used 1 nobox 1)
.c create rectangle 570 430 670 450 -fill white -width 0
.c create text 620 440 -text "in?PASSWORD"
.c create line 620 474 540 474 -fill darkblue -tags mesg -width 2
.c create line 540 474 460 474 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 780 464 -fill #eef -dash {6 4}
.c create line 620 456 620 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 35 to 37 (Used 1 nobox 1)
# ProcLine[4] stays at 37 (Used 1 nobox 1)
.c create rectangle 583 454 657 474 -fill white -width 0
.c create text 620 464 -text "out!R230"
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 780 488 -fill #eef -dash {6 4}
.c create line 460 432 460 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 33 to 39 (Used 1 nobox 1)
# ProcLine[3] stays at 39 (Used 1 nobox 1)
.c create rectangle 428 478 492 498 -fill white -width 0
.c create text 460 488 -text "in?R230"
.c create line 460 522 540 522 -fill darkblue -tags mesg -width 2
.c create line 540 522 620 522 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 780 512 -fill #eef -dash {6 4}
.c create line 460 504 460 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 39 to 41 (Used 1 nobox 1)
# ProcLine[3] stays at 41 (Used 1 nobox 1)
.c create rectangle 423 502 497 522 -fill white -width 0
.c create text 460 512 -text "out!SYST"
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 780 536 -fill #eef -dash {6 4}
.c create line 620 480 620 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 37 to 43 (Used 1 nobox 1)
# ProcLine[4] stays at 43 (Used 1 nobox 1)
.c create rectangle 588 526 652 546 -fill white -width 0
.c create text 620 536 -text "in?SYST"
.c create line 620 570 540 570 -fill darkblue -tags mesg -width 2
.c create line 540 570 460 570 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 780 560 -fill #eef -dash {6 4}
.c create line 620 552 620 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 43 to 45 (Used 1 nobox 1)
# ProcLine[4] stays at 45 (Used 1 nobox 1)
.c create rectangle 583 550 657 570 -fill white -width 0
.c create text 620 560 -text "out!R215"
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 780 584 -fill #eef -dash {6 4}
.c create line 460 528 460 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 41 to 47 (Used 1 nobox 1)
# ProcLine[3] stays at 47 (Used 1 nobox 1)
.c create rectangle 428 574 492 594 -fill white -width 0
.c create text 460 584 -text "in?R215"
.c create line 460 618 540 618 -fill darkblue -tags mesg -width 2
.c create line 540 618 620 618 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 780 608 -fill #eef -dash {6 4}
.c create line 460 600 460 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 47 to 49 (Used 1 nobox 1)
# ProcLine[3] stays at 49 (Used 1 nobox 1)
.c create rectangle 423 598 497 618 -fill white -width 0
.c create text 460 608 -text "out!FEAT"
.c create text 70 632 -fill #eef -text "51"
.c create line 140 632 780 632 -fill #eef -dash {6 4}
.c create line 620 576 620 620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 45 to 51 (Used 1 nobox 1)
# ProcLine[4] stays at 51 (Used 1 nobox 1)
.c create rectangle 588 622 652 642 -fill white -width 0
.c create text 620 632 -text "in?FEAT"
.c create line 620 666 540 666 -fill darkblue -tags mesg -width 2
.c create line 540 666 460 666 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 656 -fill #eef -text "53"
.c create line 140 656 780 656 -fill #eef -dash {6 4}
.c create line 620 648 620 644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 51 to 53 (Used 1 nobox 1)
# ProcLine[4] stays at 53 (Used 1 nobox 1)
.c create rectangle 583 646 657 666 -fill white -width 0
.c create text 620 656 -text "out!R211"
.c create text 70 680 -fill #eef -text "55"
.c create line 140 680 780 680 -fill #eef -dash {6 4}
.c create line 460 624 460 668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 49 to 55 (Used 1 nobox 1)
# ProcLine[3] stays at 55 (Used 1 nobox 1)
.c create rectangle 428 670 492 690 -fill white -width 0
.c create text 460 680 -text "in?R211"
.c create line 460 714 540 714 -fill darkblue -tags mesg -width 2
.c create line 540 714 620 714 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 704 -fill #eef -text "57"
.c create line 140 704 780 704 -fill #eef -dash {6 4}
.c create line 460 696 460 692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 55 to 57 (Used 1 nobox 1)
# ProcLine[3] stays at 57 (Used 1 nobox 1)
.c create rectangle 423 694 497 714 -fill white -width 0
.c create text 460 704 -text "out!TYPE"
.c create text 70 728 -fill #eef -text "59"
.c create line 140 728 780 728 -fill #eef -dash {6 4}
.c create line 620 672 620 716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 53 to 59 (Used 1 nobox 1)
# ProcLine[4] stays at 59 (Used 1 nobox 1)
.c create rectangle 588 718 652 738 -fill white -width 0
.c create text 620 728 -text "in?TYPE"
.c create line 620 762 540 762 -fill darkblue -tags mesg -width 2
.c create line 540 762 460 762 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 752 -fill #eef -text "61"
.c create line 140 752 780 752 -fill #eef -dash {6 4}
.c create line 620 744 620 740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 59 to 61 (Used 1 nobox 1)
# ProcLine[4] stays at 61 (Used 1 nobox 1)
.c create rectangle 583 742 657 762 -fill white -width 0
.c create text 620 752 -text "out!R200"
.c create text 70 776 -fill #eef -text "63"
.c create line 140 776 780 776 -fill #eef -dash {6 4}
.c create line 460 720 460 764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 57 to 63 (Used 1 nobox 1)
# ProcLine[3] stays at 63 (Used 1 nobox 1)
.c create rectangle 428 766 492 786 -fill white -width 0
.c create text 460 776 -text "in?R200"
.c create line 460 810 540 810 -fill darkblue -tags mesg -width 2
.c create line 540 810 620 810 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 800 -fill #eef -text "65"
.c create line 140 800 780 800 -fill #eef -dash {6 4}
.c create line 460 792 460 788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 63 to 65 (Used 1 nobox 1)
# ProcLine[3] stays at 65 (Used 1 nobox 1)
.c create rectangle 423 790 497 810 -fill white -width 0
.c create text 460 800 -text "out!PORT"
.c create text 70 824 -fill #eef -text "67"
.c create line 140 824 780 824 -fill #eef -dash {6 4}
.c create line 620 768 620 812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 61 to 67 (Used 1 nobox 1)
# ProcLine[4] stays at 67 (Used 1 nobox 1)
.c create rectangle 588 814 652 834 -fill white -width 0
.c create text 620 824 -text "in?PORT"
.c create line 620 858 540 858 -fill darkblue -tags mesg -width 2
.c create line 540 858 460 858 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 848 -fill #eef -text "69"
.c create line 140 848 780 848 -fill #eef -dash {6 4}
.c create line 620 840 620 836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 67 to 69 (Used 1 nobox 1)
# ProcLine[4] stays at 69 (Used 1 nobox 1)
.c create rectangle 583 838 657 858 -fill white -width 0
.c create text 620 848 -text "out!R200"
.c create text 70 872 -fill #eef -text "71"
.c create line 140 872 780 872 -fill #eef -dash {6 4}
.c create line 460 816 460 860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 65 to 71 (Used 1 nobox 1)
# ProcLine[3] stays at 71 (Used 1 nobox 1)
.c create rectangle 428 862 492 882 -fill white -width 0
.c create text 460 872 -text "in?R200"
.c lower grid
.c raise mesg
