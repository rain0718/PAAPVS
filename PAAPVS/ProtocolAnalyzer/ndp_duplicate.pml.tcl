# maxx 1
# maxx 2
# maxx 3
# maxx 4
# maxx 5
# maxx 6
# Scaler 0.468750, MH 1280
wm title . "scenario"
wm geometry . 1280x600+650+100
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
.c create line 140 32 1100 32 -fill #eef -dash {6 4}
.c create line 300 36 300 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 1 (Used 0 nobox 0)
.c create rectangle 270 24 334 44 -fill black
# ProcLine[2] stays at 1 (Used 0 nobox 0)
.c create rectangle 268 22 332 42 -fill ivory
.c create text 300 32 -text "1:host0"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 1100 56 -fill #eef -dash {6 4}
.c create line 460 36 460 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 419 48 505 68 -fill black
# ProcLine[3] stays at 3 (Used 0 nobox 0)
.c create rectangle 418 46 502 66 -fill ivory
.c create text 460 56 -text "2:router1"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 1100 80 -fill #eef -dash {6 4}
.c create line 620 36 620 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 5 (Used 0 nobox 0)
.c create rectangle 579 72 665 92 -fill black
# ProcLine[4] stays at 5 (Used 0 nobox 0)
.c create rectangle 578 70 662 90 -fill ivory
.c create text 620 80 -text "3:router2"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 1100 104 -fill #eef -dash {6 4}
.c create line 780 36 780 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 7 (Used 0 nobox 0)
.c create rectangle 750 96 814 116 -fill black
# ProcLine[5] stays at 7 (Used 0 nobox 0)
.c create rectangle 748 94 812 114 -fill ivory
.c create text 780 104 -text "4:host3"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 1100 128 -fill #eef -dash {6 4}
.c create line 940 36 940 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[6] from 0 to 9 (Used 0 nobox 0)
.c create rectangle 910 120 974 140 -fill black
# ProcLine[6] stays at 9 (Used 0 nobox 0)
.c create rectangle 908 118 972 138 -fill ivory
.c create text 940 128 -text "5:timer"
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 1100 152 -fill #eef -dash {6 4}
.c create line 1100 36 1100 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 0 to 11 (Used 0 nobox 0)
.c create rectangle 1059 144 1145 164 -fill black
# ProcLine[7] stays at 11 (Used 0 nobox 0)
.c create rectangle 1058 142 1142 162 -fill ivory
.c create text 1100 152 -text "6:attack4"
.c create line 780 186 700 186 -fill darkblue -tags mesg -width 2
.c create line 700 186 620 186 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 1100 176 -fill #eef -dash {6 4}
.c create line 780 120 780 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 7 to 13 (Used 1 nobox 0)
# ProcLine[5] stays at 13 (Used 1 nobox 1)
.c create rectangle 671 166 889 186 -fill white -width 0
.c create text 780 176 -text "out1!RS,0,0,0,131,0,0,0"
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 1100 200 -fill #eef -dash {6 4}
.c create line 620 96 620 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 5 to 15 (Used 1 nobox 1)
# ProcLine[4] stays at 15 (Used 1 nobox 1)
.c create rectangle 516 190 724 210 -fill white -width 0
.c create text 620 200 -text "in1?RS,0,0,0,131,0,0,0"
.c create line 620 234 700 234 -fill darkblue -tags mesg -width 2
.c create line 700 234 780 234 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 1100 224 -fill #eef -dash {6 4}
.c create line 620 216 620 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 15 to 17 (Used 1 nobox 1)
# ProcLine[4] stays at 17 (Used 1 nobox 1)
.c create rectangle 522 214 718 234 -fill white -width 0
.c create text 620 224 -text "out1!RA,0,0,0,0,3,0,0"
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 1100 248 -fill #eef -dash {6 4}
.c create line 780 192 780 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 13 to 19 (Used 1 nobox 1)
# ProcLine[5] stays at 19 (Used 1 nobox 1)
.c create rectangle 684 238 876 258 -fill white -width 0
.c create text 780 248 -text "in1?RA,0,0,0,0,3,0,0"
.c create line 780 282 700 282 -fill darkblue -tags mesg -width 2
.c create line 700 282 620 282 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 1100 272 -fill #eef -dash {6 4}
.c create line 780 264 780 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 19 to 21 (Used 1 nobox 1)
# ProcLine[5] stays at 21 (Used 1 nobox 1)
.c create rectangle 671 262 889 282 -fill white -width 0
.c create text 780 272 -text "out1!NS,0,0,30,0,0,31,0"
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 1100 296 -fill #eef -dash {6 4}
.c create line 620 240 620 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 17 to 23 (Used 1 nobox 1)
# ProcLine[4] stays at 23 (Used 1 nobox 1)
.c create rectangle 516 286 724 306 -fill white -width 0
.c create text 620 296 -text "in1?NS,0,0,30,0,0,31,0"
.c create line 620 330 540 330 -fill darkblue -tags mesg -width 2
.c create line 540 330 540 502 -fill darkblue -tags mesg -width 2
.c create line 540 502 460 502 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 1100 320 -fill #eef -dash {6 4}
.c create line 620 312 620 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 23 to 25 (Used 1 nobox 1)
# ProcLine[4] stays at 25 (Used 1 nobox 1)
.c create rectangle 511 310 729 330 -fill white -width 0
.c create text 620 320 -text "out2!NS,0,0,30,0,0,31,0"
.c create line 300 354 700 354 -fill darkblue -tags mesg -width 2
.c create line 700 354 1100 354 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 1100 344 -fill #eef -dash {6 4}
.c create line 300 48 300 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 1 to 27 (Used 1 nobox 1)
# ProcLine[2] stays at 27 (Used 1 nobox 1)
.c create rectangle 191 334 409 354 -fill white -width 0
.c create text 300 344 -text "out1!RS,0,0,0,121,0,0,0"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 1100 368 -fill #eef -dash {6 4}
.c create line 1100 168 1100 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 11 to 29 (Used 1 nobox 1)
# ProcLine[7] stays at 29 (Used 1 nobox 1)
.c create rectangle 996 358 1204 378 -fill white -width 0
.c create text 1100 368 -text "in2?RS,0,0,0,121,0,0,0"
.c create line 1100 402 780 402 -fill darkblue -tags mesg -width 2
.c create line 780 402 460 402 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 1100 392 -fill #eef -dash {6 4}
.c create line 1100 384 1100 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 29 to 31 (Used 1 nobox 1)
# ProcLine[7] stays at 31 (Used 1 nobox 1)
.c create rectangle 991 382 1209 402 -fill white -width 0
.c create text 1100 392 -text "out1!RS,0,0,0,121,0,0,0"
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 1100 416 -fill #eef -dash {6 4}
.c create line 460 72 460 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 3 to 33 (Used 1 nobox 1)
# ProcLine[3] stays at 33 (Used 1 nobox 1)
.c create rectangle 356 406 564 426 -fill white -width 0
.c create text 460 416 -text "in1?RS,0,0,0,121,0,0,0"
.c create line 460 450 780 450 -fill darkblue -tags mesg -width 2
.c create line 780 450 1100 450 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 1100 440 -fill #eef -dash {6 4}
.c create line 460 432 460 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 33 to 35 (Used 1 nobox 1)
# ProcLine[3] stays at 35 (Used 1 nobox 1)
.c create rectangle 362 430 558 450 -fill white -width 0
.c create text 460 440 -text "out1!RA,0,0,0,0,2,0,0"
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 1100 464 -fill #eef -dash {6 4}
.c create line 1100 408 1100 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 31 to 37 (Used 1 nobox 1)
# ProcLine[7] stays at 37 (Used 1 nobox 1)
.c create rectangle 1004 454 1196 474 -fill white -width 0
.c create text 1100 464 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 1100 498 700 498 -fill darkblue -tags mesg -width 2
.c create line 700 498 700 550 -fill darkblue -tags mesg -width 2
.c create line 700 550 300 550 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 1100 488 -fill #eef -dash {6 4}
.c create line 1100 480 1100 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 37 to 39 (Used 1 nobox 1)
# ProcLine[7] stays at 39 (Used 1 nobox 1)
.c create rectangle 1002 478 1198 498 -fill white -width 0
.c create text 1100 488 -text "out2!RA,0,0,0,0,2,0,0"
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 1100 512 -fill #eef -dash {6 4}
.c create line 460 456 460 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 35 to 41 (Used 1 nobox 1)
# ProcLine[3] stays at 41 (Used 1 nobox 1)
.c create rectangle 356 502 564 522 -fill white -width 0
.c create text 460 512 -text "in2?NS,0,0,30,0,0,31,0"
.c create line 460 546 780 546 -fill darkblue -tags mesg -width 2
.c create line 780 546 780 1606 -fill darkblue -tags mesg -width 2
.c create line 780 1606 1100 1606 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 1100 536 -fill #eef -dash {6 4}
.c create line 460 528 460 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 41 to 43 (Used 1 nobox 1)
# ProcLine[3] stays at 43 (Used 1 nobox 1)
.c create rectangle 351 526 569 546 -fill white -width 0
.c create text 460 536 -text "out1!NS,0,0,30,0,0,31,0"
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 1100 560 -fill #eef -dash {6 4}
.c create line 300 360 300 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 27 to 45 (Used 1 nobox 1)
# ProcLine[2] stays at 45 (Used 1 nobox 1)
.c create rectangle 204 550 396 570 -fill white -width 0
.c create text 300 560 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 594 700 594 -fill darkblue -tags mesg -width 2
.c create line 700 594 1100 594 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 1100 584 -fill #eef -dash {6 4}
.c create line 300 576 300 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 45 to 47 (Used 1 nobox 1)
# ProcLine[2] stays at 47 (Used 1 nobox 1)
.c create rectangle 191 574 409 594 -fill white -width 0
.c create text 300 584 -text "out1!NS,0,0,20,0,0,21,0"
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 1100 608 -fill #eef -dash {6 4}
.c create line 1100 504 1100 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 39 to 49 (Used 1 nobox 1)
# ProcLine[7] stays at 49 (Used 1 nobox 1)
.c create rectangle 996 598 1204 618 -fill white -width 0
.c create text 1100 608 -text "in2?NS,0,0,20,0,0,21,0"
.c create line 1100 642 700 642 -fill darkblue -tags mesg -width 2
.c create line 700 642 300 642 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 632 -fill #eef -text "51"
.c create line 140 632 1100 632 -fill #eef -dash {6 4}
.c create line 1100 624 1100 620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 49 to 51 (Used 1 nobox 1)
# ProcLine[7] stays at 51 (Used 1 nobox 1)
.c create rectangle 986 622 1214 642 -fill white -width 0
.c create text 1100 632 -text "out2!NA,0,21,20,0,0,21,0"
.c create text 70 656 -fill #eef -text "53"
.c create line 140 656 1100 656 -fill #eef -dash {6 4}
.c create line 300 600 300 644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 47 to 53 (Used 1 nobox 1)
# ProcLine[2] stays at 53 (Used 1 nobox 1)
.c create rectangle 191 646 409 666 -fill white -width 0
.c create text 300 656 -text "in1?NA,0,21,20,0,0,21,0"
.c create text 70 680 -fill #eef -text "55"
.c create line 140 680 1100 680 -fill #eef -dash {6 4}
.c create line 300 672 300 668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 53 to 55 (Used 1 nobox 1)
# ProcLine[2] stays at 55 (Used 1 nobox 1)
.c create rectangle 204 670 396 690 -fill white -width 0
.c create text 300 680 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 714 700 714 -fill darkblue -tags mesg -width 2
.c create line 700 714 1100 714 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 704 -fill #eef -text "57"
.c create line 140 704 1100 704 -fill #eef -dash {6 4}
.c create line 300 696 300 692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 55 to 57 (Used 1 nobox 1)
# ProcLine[2] stays at 57 (Used 1 nobox 1)
.c create rectangle 191 694 409 714 -fill white -width 0
.c create text 300 704 -text "out1!NS,0,0,20,0,0,22,0"
.c create text 70 728 -fill #eef -text "59"
.c create line 140 728 1100 728 -fill #eef -dash {6 4}
.c create line 1100 648 1100 716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 51 to 59 (Used 1 nobox 1)
# ProcLine[7] stays at 59 (Used 1 nobox 1)
.c create rectangle 996 718 1204 738 -fill white -width 0
.c create text 1100 728 -text "in2?NS,0,0,20,0,0,22,0"
.c create line 1100 762 700 762 -fill darkblue -tags mesg -width 2
.c create line 700 762 300 762 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 752 -fill #eef -text "61"
.c create line 140 752 1100 752 -fill #eef -dash {6 4}
.c create line 1100 744 1100 740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 59 to 61 (Used 1 nobox 1)
# ProcLine[7] stays at 61 (Used 1 nobox 1)
.c create rectangle 986 742 1214 762 -fill white -width 0
.c create text 1100 752 -text "out2!NA,0,22,20,0,2,22,0"
.c create text 70 776 -fill #eef -text "63"
.c create line 140 776 1100 776 -fill #eef -dash {6 4}
.c create line 300 720 300 764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 57 to 63 (Used 1 nobox 1)
# ProcLine[2] stays at 63 (Used 1 nobox 1)
.c create rectangle 191 766 409 786 -fill white -width 0
.c create text 300 776 -text "in1?NA,0,22,20,0,2,22,0"
.c create text 70 800 -fill #eef -text "65"
.c create line 140 800 1100 800 -fill #eef -dash {6 4}
.c create line 300 792 300 788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 63 to 65 (Used 1 nobox 1)
# ProcLine[2] stays at 65 (Used 1 nobox 1)
.c create rectangle 204 790 396 810 -fill white -width 0
.c create text 300 800 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 834 700 834 -fill darkblue -tags mesg -width 2
.c create line 700 834 1100 834 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 824 -fill #eef -text "67"
.c create line 140 824 1100 824 -fill #eef -dash {6 4}
.c create line 300 816 300 812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 65 to 67 (Used 1 nobox 1)
# ProcLine[2] stays at 67 (Used 1 nobox 1)
.c create rectangle 191 814 409 834 -fill white -width 0
.c create text 300 824 -text "out1!NS,0,0,20,0,0,23,0"
.c create text 70 848 -fill #eef -text "69"
.c create line 140 848 1100 848 -fill #eef -dash {6 4}
.c create line 1100 768 1100 836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 61 to 69 (Used 1 nobox 1)
# ProcLine[7] stays at 69 (Used 1 nobox 1)
.c create rectangle 996 838 1204 858 -fill white -width 0
.c create text 1100 848 -text "in2?NS,0,0,20,0,0,23,0"
.c create line 1100 882 700 882 -fill darkblue -tags mesg -width 2
.c create line 700 882 300 882 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 872 -fill #eef -text "71"
.c create line 140 872 1100 872 -fill #eef -dash {6 4}
.c create line 1100 864 1100 860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 69 to 71 (Used 1 nobox 1)
# ProcLine[7] stays at 71 (Used 1 nobox 1)
.c create rectangle 986 862 1214 882 -fill white -width 0
.c create text 1100 872 -text "out2!NA,0,23,20,0,2,23,0"
.c create text 70 896 -fill #eef -text "73"
.c create line 140 896 1100 896 -fill #eef -dash {6 4}
.c create line 300 840 300 884 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 67 to 73 (Used 1 nobox 1)
# ProcLine[2] stays at 73 (Used 1 nobox 1)
.c create rectangle 191 886 409 906 -fill white -width 0
.c create text 300 896 -text "in1?NA,0,23,20,0,2,23,0"
.c create text 70 920 -fill #eef -text "75"
.c create line 140 920 1100 920 -fill #eef -dash {6 4}
.c create line 300 912 300 908 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 73 to 75 (Used 1 nobox 1)
# ProcLine[2] stays at 75 (Used 1 nobox 1)
.c create rectangle 204 910 396 930 -fill white -width 0
.c create text 300 920 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 954 700 954 -fill darkblue -tags mesg -width 2
.c create line 700 954 1100 954 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 944 -fill #eef -text "77"
.c create line 140 944 1100 944 -fill #eef -dash {6 4}
.c create line 300 936 300 932 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 75 to 77 (Used 1 nobox 1)
# ProcLine[2] stays at 77 (Used 1 nobox 1)
.c create rectangle 191 934 409 954 -fill white -width 0
.c create text 300 944 -text "out1!NS,0,0,20,0,0,24,0"
.c create text 70 968 -fill #eef -text "79"
.c create line 140 968 1100 968 -fill #eef -dash {6 4}
.c create line 1100 888 1100 956 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 71 to 79 (Used 1 nobox 1)
# ProcLine[7] stays at 79 (Used 1 nobox 1)
.c create rectangle 996 958 1204 978 -fill white -width 0
.c create text 1100 968 -text "in2?NS,0,0,20,0,0,24,0"
.c create line 1100 1002 700 1002 -fill darkblue -tags mesg -width 2
.c create line 700 1002 300 1002 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 992 -fill #eef -text "81"
.c create line 140 992 1100 992 -fill #eef -dash {6 4}
.c create line 1100 984 1100 980 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 79 to 81 (Used 1 nobox 1)
# ProcLine[7] stays at 81 (Used 1 nobox 1)
.c create rectangle 986 982 1214 1002 -fill white -width 0
.c create text 1100 992 -text "out2!NA,0,24,20,0,2,24,0"
.c create text 70 1016 -fill #eef -text "83"
.c create line 140 1016 1100 1016 -fill #eef -dash {6 4}
.c create line 300 960 300 1004 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 77 to 83 (Used 1 nobox 1)
# ProcLine[2] stays at 83 (Used 1 nobox 1)
.c create rectangle 191 1006 409 1026 -fill white -width 0
.c create text 300 1016 -text "in1?NA,0,24,20,0,2,24,0"
.c create text 70 1040 -fill #eef -text "85"
.c create line 140 1040 1100 1040 -fill #eef -dash {6 4}
.c create line 300 1032 300 1028 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 83 to 85 (Used 1 nobox 1)
# ProcLine[2] stays at 85 (Used 1 nobox 1)
.c create rectangle 204 1030 396 1050 -fill white -width 0
.c create text 300 1040 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 1074 700 1074 -fill darkblue -tags mesg -width 2
.c create line 700 1074 1100 1074 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1064 -fill #eef -text "87"
.c create line 140 1064 1100 1064 -fill #eef -dash {6 4}
.c create line 300 1056 300 1052 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 85 to 87 (Used 1 nobox 1)
# ProcLine[2] stays at 87 (Used 1 nobox 1)
.c create rectangle 191 1054 409 1074 -fill white -width 0
.c create text 300 1064 -text "out1!NS,0,0,20,0,0,25,0"
.c create text 70 1088 -fill #eef -text "89"
.c create line 140 1088 1100 1088 -fill #eef -dash {6 4}
.c create line 1100 1008 1100 1076 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 81 to 89 (Used 1 nobox 1)
# ProcLine[7] stays at 89 (Used 1 nobox 1)
.c create rectangle 996 1078 1204 1098 -fill white -width 0
.c create text 1100 1088 -text "in2?NS,0,0,20,0,0,25,0"
.c create line 1100 1122 700 1122 -fill darkblue -tags mesg -width 2
.c create line 700 1122 300 1122 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1112 -fill #eef -text "91"
.c create line 140 1112 1100 1112 -fill #eef -dash {6 4}
.c create line 1100 1104 1100 1100 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 89 to 91 (Used 1 nobox 1)
# ProcLine[7] stays at 91 (Used 1 nobox 1)
.c create rectangle 986 1102 1214 1122 -fill white -width 0
.c create text 1100 1112 -text "out2!NA,0,25,20,0,2,25,0"
.c create text 70 1136 -fill #eef -text "93"
.c create line 140 1136 1100 1136 -fill #eef -dash {6 4}
.c create line 300 1080 300 1124 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 87 to 93 (Used 1 nobox 1)
# ProcLine[2] stays at 93 (Used 1 nobox 1)
.c create rectangle 191 1126 409 1146 -fill white -width 0
.c create text 300 1136 -text "in1?NA,0,25,20,0,2,25,0"
.c create text 70 1160 -fill #eef -text "95"
.c create line 140 1160 1100 1160 -fill #eef -dash {6 4}
.c create line 300 1152 300 1148 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 93 to 95 (Used 1 nobox 1)
# ProcLine[2] stays at 95 (Used 1 nobox 1)
.c create rectangle 204 1150 396 1170 -fill white -width 0
.c create text 300 1160 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 1194 700 1194 -fill darkblue -tags mesg -width 2
.c create line 700 1194 1100 1194 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1184 -fill #eef -text "97"
.c create line 140 1184 1100 1184 -fill #eef -dash {6 4}
.c create line 300 1176 300 1172 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 95 to 97 (Used 1 nobox 1)
# ProcLine[2] stays at 97 (Used 1 nobox 1)
.c create rectangle 191 1174 409 1194 -fill white -width 0
.c create text 300 1184 -text "out1!NS,0,0,20,0,0,26,0"
.c create text 70 1208 -fill #eef -text "99"
.c create line 140 1208 1100 1208 -fill #eef -dash {6 4}
.c create line 1100 1128 1100 1196 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 91 to 99 (Used 1 nobox 1)
# ProcLine[7] stays at 99 (Used 1 nobox 1)
.c create rectangle 996 1198 1204 1218 -fill white -width 0
.c create text 1100 1208 -text "in2?NS,0,0,20,0,0,26,0"
.c create line 1100 1242 700 1242 -fill darkblue -tags mesg -width 2
.c create line 700 1242 300 1242 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1232 -fill #eef -text "101"
.c create line 140 1232 1100 1232 -fill #eef -dash {6 4}
.c create line 1100 1224 1100 1220 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 99 to 101 (Used 1 nobox 1)
# ProcLine[7] stays at 101 (Used 1 nobox 1)
.c create rectangle 986 1222 1214 1242 -fill white -width 0
.c create text 1100 1232 -text "out2!NA,0,26,20,0,2,26,0"
.c create text 70 1256 -fill #eef -text "103"
.c create line 140 1256 1100 1256 -fill #eef -dash {6 4}
.c create line 300 1200 300 1244 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 97 to 103 (Used 1 nobox 1)
# ProcLine[2] stays at 103 (Used 1 nobox 1)
.c create rectangle 191 1246 409 1266 -fill white -width 0
.c create text 300 1256 -text "in1?NA,0,26,20,0,2,26,0"
.c create text 70 1280 -fill #eef -text "105"
.c create line 140 1280 1100 1280 -fill #eef -dash {6 4}
.c create line 300 1272 300 1268 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 103 to 105 (Used 1 nobox 1)
# ProcLine[2] stays at 105 (Used 1 nobox 1)
.c create rectangle 204 1270 396 1290 -fill white -width 0
.c create text 300 1280 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 1314 700 1314 -fill darkblue -tags mesg -width 2
.c create line 700 1314 1100 1314 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1304 -fill #eef -text "107"
.c create line 140 1304 1100 1304 -fill #eef -dash {6 4}
.c create line 300 1296 300 1292 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 105 to 107 (Used 1 nobox 1)
# ProcLine[2] stays at 107 (Used 1 nobox 1)
.c create rectangle 191 1294 409 1314 -fill white -width 0
.c create text 300 1304 -text "out1!NS,0,0,20,0,0,27,0"
.c create text 70 1328 -fill #eef -text "109"
.c create line 140 1328 1100 1328 -fill #eef -dash {6 4}
.c create line 1100 1248 1100 1316 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 101 to 109 (Used 1 nobox 1)
# ProcLine[7] stays at 109 (Used 1 nobox 1)
.c create rectangle 996 1318 1204 1338 -fill white -width 0
.c create text 1100 1328 -text "in2?NS,0,0,20,0,0,27,0"
.c create line 1100 1362 700 1362 -fill darkblue -tags mesg -width 2
.c create line 700 1362 300 1362 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1352 -fill #eef -text "111"
.c create line 140 1352 1100 1352 -fill #eef -dash {6 4}
.c create line 1100 1344 1100 1340 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 109 to 111 (Used 1 nobox 1)
# ProcLine[7] stays at 111 (Used 1 nobox 1)
.c create rectangle 986 1342 1214 1362 -fill white -width 0
.c create text 1100 1352 -text "out2!NA,0,27,20,0,2,27,0"
.c create text 70 1376 -fill #eef -text "113"
.c create line 140 1376 1100 1376 -fill #eef -dash {6 4}
.c create line 300 1320 300 1364 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 107 to 113 (Used 1 nobox 1)
# ProcLine[2] stays at 113 (Used 1 nobox 1)
.c create rectangle 191 1366 409 1386 -fill white -width 0
.c create text 300 1376 -text "in1?NA,0,27,20,0,2,27,0"
.c create text 70 1400 -fill #eef -text "115"
.c create line 140 1400 1100 1400 -fill #eef -dash {6 4}
.c create line 300 1392 300 1388 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 113 to 115 (Used 1 nobox 1)
# ProcLine[2] stays at 115 (Used 1 nobox 1)
.c create rectangle 204 1390 396 1410 -fill white -width 0
.c create text 300 1400 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 1434 700 1434 -fill darkblue -tags mesg -width 2
.c create line 700 1434 1100 1434 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1424 -fill #eef -text "117"
.c create line 140 1424 1100 1424 -fill #eef -dash {6 4}
.c create line 300 1416 300 1412 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 115 to 117 (Used 1 nobox 1)
# ProcLine[2] stays at 117 (Used 1 nobox 1)
.c create rectangle 191 1414 409 1434 -fill white -width 0
.c create text 300 1424 -text "out1!NS,0,0,20,0,0,28,0"
.c create text 70 1448 -fill #eef -text "119"
.c create line 140 1448 1100 1448 -fill #eef -dash {6 4}
.c create line 1100 1368 1100 1436 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 111 to 119 (Used 1 nobox 1)
# ProcLine[7] stays at 119 (Used 1 nobox 1)
.c create rectangle 996 1438 1204 1458 -fill white -width 0
.c create text 1100 1448 -text "in2?NS,0,0,20,0,0,28,0"
.c create line 1100 1482 700 1482 -fill darkblue -tags mesg -width 2
.c create line 700 1482 300 1482 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1472 -fill #eef -text "121"
.c create line 140 1472 1100 1472 -fill #eef -dash {6 4}
.c create line 1100 1464 1100 1460 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 119 to 121 (Used 1 nobox 1)
# ProcLine[7] stays at 121 (Used 1 nobox 1)
.c create rectangle 986 1462 1214 1482 -fill white -width 0
.c create text 1100 1472 -text "out2!NA,0,28,20,0,2,28,0"
.c create text 70 1496 -fill #eef -text "123"
.c create line 140 1496 1100 1496 -fill #eef -dash {6 4}
.c create line 300 1440 300 1484 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 117 to 123 (Used 1 nobox 1)
# ProcLine[2] stays at 123 (Used 1 nobox 1)
.c create rectangle 191 1486 409 1506 -fill white -width 0
.c create text 300 1496 -text "in1?NA,0,28,20,0,2,28,0"
.c create text 70 1520 -fill #eef -text "125"
.c create line 140 1520 1100 1520 -fill #eef -dash {6 4}
.c create line 300 1512 300 1508 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 123 to 125 (Used 1 nobox 1)
# ProcLine[2] stays at 125 (Used 1 nobox 1)
.c create rectangle 204 1510 396 1530 -fill white -width 0
.c create text 300 1520 -text "in1?RA,0,0,0,0,2,0,0"
.c create line 300 1554 700 1554 -fill darkblue -tags mesg -width 2
.c create line 700 1554 1100 1554 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1544 -fill #eef -text "127"
.c create line 140 1544 1100 1544 -fill #eef -dash {6 4}
.c create line 300 1536 300 1532 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 125 to 127 (Used 1 nobox 1)
# ProcLine[2] stays at 127 (Used 1 nobox 1)
.c create rectangle 191 1534 409 1554 -fill white -width 0
.c create text 300 1544 -text "out1!NS,0,0,20,0,0,29,0"
.c create text 70 1568 -fill #eef -text "129"
.c create line 140 1568 1100 1568 -fill #eef -dash {6 4}
.c create line 1100 1488 1100 1556 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 121 to 129 (Used 1 nobox 1)
# ProcLine[7] stays at 129 (Used 1 nobox 1)
.c create rectangle 996 1558 1204 1578 -fill white -width 0
.c create text 1100 1568 -text "in2?NS,0,0,20,0,0,29,0"
.c create line 1100 1602 700 1602 -fill darkblue -tags mesg -width 2
.c create line 700 1602 700 1630 -fill darkblue -tags mesg -width 2
.c create line 700 1630 300 1630 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1592 -fill #eef -text "131"
.c create line 140 1592 1100 1592 -fill #eef -dash {6 4}
.c create line 1100 1584 1100 1580 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 129 to 131 (Used 1 nobox 1)
# ProcLine[7] stays at 131 (Used 1 nobox 1)
.c create rectangle 986 1582 1214 1602 -fill white -width 0
.c create text 1100 1592 -text "out2!NA,0,29,20,0,2,29,0"
.c create text 70 1616 -fill #eef -text "133"
.c create line 140 1616 1100 1616 -fill #eef -dash {6 4}
.c create line 1100 1608 1100 1604 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 131 to 133 (Used 1 nobox 1)
# ProcLine[7] stays at 133 (Used 1 nobox 1)
.c create rectangle 996 1606 1204 1626 -fill white -width 0
.c create text 1100 1616 -text "in1?NS,0,0,30,0,0,31,0"
.c create text 70 1640 -fill #eef -text "135"
.c create line 140 1640 1100 1640 -fill #eef -dash {6 4}
.c create line 300 1560 300 1628 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 127 to 135 (Used 1 nobox 1)
# ProcLine[2] stays at 135 (Used 1 nobox 1)
.c create rectangle 191 1630 409 1650 -fill white -width 0
.c create text 300 1640 -text "in1?NA,0,29,20,0,2,29,0"
.c create text 70 1664 -fill #eef -text "137"
.c create line 140 1664 1100 1664 -fill #eef -dash {6 4}
.c create line 300 1656 300 1652 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 135 to 137 (Used 1 nobox 1)
# ProcLine[2] stays at 137 (Used 1 nobox 1)
.c create rectangle 204 1654 396 1674 -fill white -width 0
.c create text 300 1664 -text "in1?RA,0,0,0,0,2,0,0"
.c lower grid
.c raise mesg
