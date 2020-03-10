!a10 - napravlena na sever vdol' osi vrashenia Zemli
!a11 - napravlena no 0 h LT
!b11 - napravlena na 6 h LT 

!Transform  from heliographical coordinate system 
!(GSM method results), into GSE coordinate system

integer j,i,k,l,x(14),z,AI(3)
real a10,a11,b11,psi,tau,pi,A(3),AGSE(3),BGSE(3),Mlat(3,3),Mlon(3,3)
character CR*10, CR2*11

do l=65,112

if (l .ge. 100) then
write(CR,'(a4,i2.2,a4)') 'R-H-',l-100,'.DAT'
write(CR2,'(a5,i2.2,a4)') 'CR-H-',l-100,'.DAT'
else
write(CR,'(a4,i2.2,a4)') 'R-H-',l,'.DAT'
write(CR2,'(a5,i2.2,a4)') 'CR-H-',l,'.DAT'
endif

open(1,file=CR)
open(2,file=CR2)

write(*,*) CR,' AND ', CR2

read(1,*)
write(2,'(a4,3(1x,a2),10(3x,a3))') 'YYYY','MM','DD','HH','a00','a10','a20','a11','b11','a21','b21',&
'a22','b22','izo'

do z=1,999999
read(1,'(i4,3(1x,i2),10(i6))',end=10) (x(i),i=1,14)

pi=3.1415926

a10=x(6)
a11=x(8)
b11=x(9)

k=x(2)

psi=-23.5*cos((k-12.)*30.*pi/180.)*pi/180.

tau=-23.5*sin((k-12.)*30.*pi/180.)*pi/180.

A(1)=-a11 !X
A(2)=-b11 !Y
A(3)=a10  !Z

Mlat(1,1)=cos(psi)
Mlat(1,2)=0.
Mlat(1,3)=sin(psi)
Mlat(2,1)=0.
Mlat(2,2)=1.
Mlat(2,3)=0.
Mlat(3,1)=-sin(psi)
Mlat(3,2)=0.
Mlat(3,3)=cos(psi)

Mlon(1,1)=1.
Mlon(1,2)=0.
Mlon(1,3)=0.
Mlon(2,1)=0.
Mlon(2,2)=cos(tau)
Mlon(2,3)=-sin(tau)
Mlon(3,1)=0.
Mlon(3,2)=sin(tau)
Mlon(3,3)=cos(tau)

      do j=1,3
      !write(*,'(3(f6.3,1x))') (Mlat(j,i),i=1,3)
      enddo

      do j=1,3
      AGSE(j)=0.
      BGSE(j)=0.
      enddo

      do j=1,3
      do i=1,3
      AGSE(j)=AGSE(j)+Mlat(j,i)*A(i)
      enddo
      enddo
      
      do j=1,3
      do i=1,3
      BGSE(j)=BGSE(j)+Mlon(j,i)*AGSE(i)
      enddo
      enddo
      
      do j=1,3      
      AI(j)=nint(BGSE(j))
      enddo
      
      do j=1,3
      if ((AI(j) .gt. 25000) .or. (AI(j) .lt. -25000)) then !25% anisotropii nevozmozhno...???
      AI(j)=99999
      else
      endif
      enddo
!write(*,'(a3,4(1x,f8.3))') 'old', (A(i),i=1,3), psi*180/pi

write(2,'(i4,3(1x,i2),10(i6))') (x(i),i=1,4),-999,AI(3),-999,AI(1),AI(2),(-999,i=10,13),x(14)
!enddo
enddo
10 continue
close(1)
close(2)
enddo
end
