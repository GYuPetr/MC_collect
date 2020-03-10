set terminal eps enhanced color font 'Helvetica,8' size 3.,4.5

set output 'FFFR104-GSE.eps'
        FN='FFFR104'


set xdata time
set timefmt "%Y/%m/%d %H:%M"
set format x '%j/%Y'
set xtics 86400

set autoscale x
set autoscale y

set ylabel 'Amplitude, %'
set xlabel 'time, DoY/YYYY'

set label 'AAAAAAAA'

set multiplot layout 2,1 columnsfirst scale 0.9,0.9 

plot FN using 2:5 w l lt -1 t "dI/I, %",\
     FN using 2:5:20 w labels center tc lt -1 font 'Helvetica, 12' notitle,\
     FN using 2:6 w l lt 3 t 'Ax, %',\
     FN using 2:7 w l lt 1 t "Ay,%", \
     FN using 2:8 w l lt 2 t "Az,%" #, FNMC u 2:6:(0):(0) with p pt 6 lc 3 lw 2 ps 2 t 'MC'

set ylabel 'B, nT'
     
set autoscale y
plot FN using 2:9 w l lt -1 t "|B|,nT",\
     FN using 2:9:20 w labels center tc lt -1 font 'Helvetica, 12'  notitle,\
     FN using 2:11 w l lt 3 t "Bx,%",\
     FN using 2:12 w l lt 1 t "By,%",\
     FN using 2:13 w l lt 2 t "Bz,%" #, FNMC u 2:11:(0):(0) with p pt 6 lc 3 lw 2 ps 2 t 'MC'

unset xlabel
unset xlabel
unset multiplot