integer q,d(2,4),i,j,k,l,m,aa(4),b(10),dd(12),omnib,omnid(3),n,z,n1,n2,Dst,HN
real code,h(2),x(4,3000,366,0:25),omnia(10),omnix(3000,366,0:25,11),INTE,ANIS,IMAX(300),IMIN(300),AMAX(300)
character o(2)*3,A*10,mm(12)*3,ICMEDATE(3)*10,ICMEHOUR(3)*4,o1*1,OUT*6,Class*5,Polar*2
integer ICMED(9999,3,3),MONTH,DAY,ICMEnum,CHECKICME(3),CHECKMC(2),grbgI,DOYMM(3000,366,0:25),DOYDD(3000,366,0:25)

open(1,file='MC_DATE_OLD_ZHANG-SRT.txt')
open(300,file='MC_ZHANG_OUT')
read(1,*)
read(1,*)
read(1,*)

write(mm(1),'(A3)')  'Jan'
write(mm(2),'(A3)')  'Feb'
write(mm(3),'(A3)')  'Mar'
write(mm(4),'(A3)')  'Apr'
write(mm(5),'(A3)')  'May'
write(mm(6),'(A3)')  'Jun'
write(mm(7),'(A3)')  'Jul'
write(mm(8),'(A3)')  'Aug'
write(mm(9),'(A3)')  'Sep'
write(mm(10),'(A3)') 'Oct'
write(mm(11),'(A3)') 'Nov'
write(mm(12),'(A3)') 'Dec'

open(100,file='omni_1990-2012.lst')
open(101,file='MC_events.dat')
open(102,file='MC_list.dat')

open(103,file='ICME_list.dat')

read(103,*)

do k=1,9999
read(103,'(3(A10,1x,A4,1x))',end=11) ICMEDATE(1),ICMEHOUR(1),ICMEDATE(2),ICMEHOUR(2),ICMEDATE(3),ICMEHOUR(3)
write(*,'(3(1x,A10,1x,A4))') ICMEDATE(1),ICMEHOUR(1),ICMEDATE(2),ICMEHOUR(2),ICMEDATE(3),ICMEHOUR(3)
    do i=1,3
    read(ICMEDATE(i),'(I4,2(A1,I2))') ICMED(k,i,1),o1,MONTH,o1,DAY

    dd(1)=0
    dd(2)=dd(1)+31
	if (mod(ICMED(k,i,1),4) .eq. 0) then
	dd(3)=dd(2)+29
	else
	dd(3)=dd(2)+28
	endif
    dd(4)=dd(3)+31
    dd(5)=dd(4)+30
    dd(6)=dd(5)+31
    dd(7)=dd(6)+30
    dd(8)=dd(7)+31
    dd(9)=dd(8)+31
    dd(10)=dd(9)+30
    dd(11)=dd(10)+31
    dd(12)=dd(11)+30

    ICMED(k,i,2)=dd(MONTH)+DAY
    read(ICMEHOUR(i),'(I2,I2)') ICMED(k,i,3),grbgI
    enddo
enddo
11 continue
ICMEnum=k

write(102,'(A6,1x,A4,2(1x,A2),1x,A3,1x,A2,1x,A5,1x,A5)') ' MCnum','YEAR','MM','DD','DOY','HH','QLTY','POSIT'
      
write(101,'(A6,1x,A4,2(a1,A2),1x,A2,A3,1x,A3,3(5x,A3),6(1x,A7),3x,A7,5(1x,A7),5(1x,A6))') ' MCnum','YEAR','/','MM','/',&
'DD','HH',':00','DOY',&
' Int_CR','X11','Y11','Z11',' Bscala','  Bmagn','     Bx','     By','     Bz',' SWtemp',' SWdens','SWspeed','FlPress',&
'PlasmB','Dst-ind','ICMESC','CME_ST','CME_EN','MC_ST','MC_EN'

do j=1,999999
read(100,'(2(i4),i3,5(f6.1),f9.0,f6.1,f6.0,f6.2,f7.2,i6)',end=20) (omnid(i),i=1,3),(omnia(i),i=1,10),omnib
    do i=1,10
    omnix(omnid(1),omnid(2),omnid(3)+1,i)=omnia(i)
    enddo
    omnix(omnid(1),omnid(2),omnid(3)+1,11)=omnib
enddo

20 continue


do j=1990,2012

dd(1)=0
dd(2)=dd(1)+31
    if (mod(j,4) .eq. 0) then
    dd(3)=dd(2)+29
    else
    dd(3)=dd(2)+28
    endif
dd(4)=dd(3)+31
dd(5)=dd(4)+30
dd(6)=dd(5)+31
dd(7)=dd(6)+30
dd(8)=dd(7)+31
dd(9)=dd(8)+31
dd(10)=dd(9)+30
dd(11)=dd(10)+31
dd(12)=dd(11)+30

    if (j .lt. 2000) then
    write(A,'(A4,I2.2,A4)') 'R-H-',j-1900,'.DAT'
    else
    write(A,'(A4,I2.2,A4)') 'R-H-',j-2000,'.DAT'
    endif

    open(j-1980,file=A)

    read(j-1980,*)

    do k=1,99999
    read(j-1980,'(I4,3(1x,I2),10(I6))',end=10) (aa(i),i=1,4),(b(i),i=1,10)
    write(*,'(I4,3(1x,I2),10(I6))') (aa(i),i=1,4),(b(i),i=1,10)
    x(1,aa(1),dd(aa(2))+aa(3),aa(4))=b(10)
    x(2,aa(1),dd(aa(2))+aa(3),aa(4))=b(2)
    x(3,aa(1),dd(aa(2))+aa(3),aa(4))=b(4)
    x(4,aa(1),dd(aa(2))+aa(3),aa(4))=b(5)
    
    DOYMM(aa(1),dd(aa(2))+aa(3),aa(4))=aa(2)
    DOYDD(aa(1),dd(aa(2))+aa(3),aa(4))=aa(3)
    enddo
10 continue

enddo

do j=1,104+4
read(1,*) code, d(1,1),o(1),d(1,3),d(1,4),h(1),o(2),d(2,3),d(2,4),h(2),q,Dst,Class,Polar

write(OUT,'(A3,i3.3)') 'OUT',j
open(200,file=OUT)


  if (d(1,1) .lt. 10) then
    d(1,1)=2000+d(1,1)
  else
    d(1,1)=1900+d(1,1)
  endif

  d(2,1)=d(1,1)

d(1,2)=99
d(2,2)=99

      do k=1,2
	do i=1,12
	  if (o(k) .eq. mm(i)) then
	    d(k,2)=i
	  else
	    	    
	  endif
	enddo
      enddo

      write(102,'(f6.2,1x,I4,2(1x,I2),1x,I3,1x,I2,1x,I2,1x,A5)') code,(d(1,i),i=1,3),d(1,4),nint(h(1)+1),q,'START'
      write(102,'(f6.2,1x,I4,2(1x,I2),1x,I3,1x,I2,1x,I2,1x,A5)') code,(d(2,i),i=1,3),d(2,4),nint(h(2)+1),q,'END  '
      
      CHECKMC(1)=99999
      CHECKMC(2)=99999
      CHECKICME(1)=99999
      CHECKICME(2)=99999
      CHECKICME(3)=99999
      
      do l=d(1,1),d(1,1)
      HN=0
	do k=d(1,4),d(2,4)
	if (k .eq. d(1,4)) then
	   n1=nint(h(1)+1)
	   n2=24
	else
	    if (k .eq. d(2,4)) then
	     n1=1
	     n2=nint(h(2)+1)
	    else
	     n1=1
	     n2=24
	    endif
	endif
	do n=n1,n2
	HN=HN+1
		do z=1,ICMEnum
		  do i=1,3
		      !CHECKICME(i)=-9999
		      if ((l .eq. ICMED(z,i,1)) .and. (k .eq. ICMED(z,i,2)) .and. (n .eq. (ICMED(z,i,3)+1))) then
			CHECKICME(i)=-CHECKICME(i)
			goto 21
		      else
		      endif
		  enddo
		enddo
		21 continue
		
		do i=1,2
		
		
		if ((d(i,1) .eq. l) .and. (d(i,4) .eq. k) .and. (nint(h(i)+1) .eq. n)) then
		CHECKMC(i)=-CHECKMC(i)
		else
			
		endif
		enddo
	    write(101,'(f6.2,1x,I4.4,2(a1,I2.2),a1,I2.2,A3,I4,9(1x,f7.2),1x,f9.0,5(1x,f7.2),5(1x,I6))') code,l,'/',DOYMM(l,k,n),&
	    '/',DOYDD(l,k,n),' ',n,':00',k,x(1,l,k,n)/1000.,x(2,l,k,n)/1000.,x(3,l,k,n)/1000.,x(4,l,k,n)/1000.,&
	    (omnix(l,k,n,i),i=1,11),(CHECKICME(i),i=1,3),(CHECKMC(i),i=1,2)
	    
	    INTE=x(1,l,k,n)/1000.
	    ANIS=sqrt((x(2,l,k,n)/1000.)**2+(x(3,l,k,n)/1000.)**2+(x(4,l,k,n)/1000.)**2)
	    
	    if (INTE .gt. IMAX(j)) then
	    IMAX(j)=INTE
	    else
	    endif
	    
	    if (INTE .lt. IMIN(j)) then
	    IMIN(j)=INTE
	    else
	    endif
	    
	    if (ANIS .gt. AMAX(j)) then
	    AMAX(j)=ANIS
	    else
	    endif
	       
	    
	    write(200,'(f6.2,1x,I4.4,2(a1,I2.2),a1,I2.2,A3,I4,9(1x,f7.2),1x,f9.0,5(1x,f7.2),5(1x,I6))') code,l,'/',DOYMM(l,k,n),&
	    '/',DOYDD(l,k,n),' ',n,':00',k,x(1,l,k,n)/1000.,x(2,l,k,n)/1000.,x(3,l,k,n)/1000.,x(4,l,k,n)/1000.,&
	    (omnix(l,k,n,i),i=1,11),(CHECKICME(i),i=1,3),(CHECKMC(i),i=1,2)
	  enddo
	enddo
      write(*,'(f4.1,1x,i4,1x,i3,1x,f4.1,1x,i3,1x,f4.1,1x,i1,1x,i4,1x,a5,1x,a2,1x,i2)') code, &
      d(1,1),d(1,4),h(1),d(2,4),h(2),q,Dst,Class,Polar,HN
      enddo
      write(101,'(24(a1,1x))') ('-',i=1,24)
      close(200)
      write(300,'(f6.2,1x,i4,2(1x,i3,1x,f6.2),1x,i2,1x,i4,1x,a5,1x,a2,2(1x,f8.2))') code, d(1,1),d(1,4),h(1),d(2,4),h(2),q,&
      Dst,Class,Polar,IMAX(j)-IMIN(j),AMAX(j)
enddo
end