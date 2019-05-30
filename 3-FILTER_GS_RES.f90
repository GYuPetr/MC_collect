integer d(4,9999),HN,i,j,k,l,FN,x(11,-100:9000),fx(11,-100:9000),XNUM,finalX(11,9999)
real SX(11)
character INSERT*10,OUT*15

1000 format(i4,3(1x,i2),11(1x,i5))

FN=24
XNUM=11

do k=65,112

if (k .lt. 100) then
write(INSERT,'(a4,i2.2,a4)') 'R-H-',k,'.DAT'
write(OUT,'(a5,a4,i2.2,a4)') 'FLTD_','R-H-',k,'.DAT'
else
write(INSERT,'(a4,i2.2,a4)') 'R-H-',k-100,'.DAT'
write(OUT,'(a5,a4,i2.2,a4)') 'FLTD_','R-H-',k-100,'.DAT'
endif

open(1,file=INSERT)
open(100,file=OUT)

write(*,*) k, INSERT, OUT

read(1,*)

    do j=1,99999
    read(1,1000,end=10) (d(i,j),i=1,4),(x(i,j),i=1,XNUM)
    !write(*,*) k,(d(i),i=1,4)
    enddo
10 continue
    HN=j
    
    do j=1-FN,0
    do i=1,XNUM
    x(i,0+j)=x(i,0-j+1)
    enddo
    enddo
    
    do j=1,FN
    do i=1,XNUM
    x(i,HN+j)=x(i,HN-j+1)
    enddo
    enddo
    
    do j=1,HN
	do i=1,XNUM
	SX(i)=0
	enddo
	
	do l=j-FN,j+FN
	  do i=1,XNUM
	  SX(i)=SX(i)+x(i,l)
	  enddo
	enddo

	do i=1,XNUM
	fx(i,j)=anint(SX(i)/(FN*2.+1.))
	
	finalX(i,j)=x(i,j)-fx(i,j)
	
	
	if ((finalX(i,j) .lt. -9999) .or. (finalX(i,j) .gt. 9999)) then
	finalX(i,j)=9999
	else
	endif
	
	enddo
    write(100,1000) (d(i,j),i=1,4),(finalX(i,j),i=1,XNUM)
    enddo
    
close(1)
close(100)
enddo
end