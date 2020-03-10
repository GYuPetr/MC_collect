integer j,k,l,i,a(6),af(5)
real x(16)
character cr*11, o*10,o2*5,CCC*6,DDD*6,AAA(5)*6,cr2*14,cr3*14

open(1,file='MC_events.dat')

do j=1,10
write(cr,'(a4,i3.3,a4)') 'CASE',j,'.DAT'
write(cr2,'(a4,i3.3,a3,a4)') 'CASE',j,'-SH','.DAT'
write(cr3,'(a4,i3.3,a3,a4)') 'CASE',j,'-MC','.DAT'
open(2,file=cr)
open(3,file=cr2)
open(4,file=cr3)

write(AAA(1),'(a6)') 'ICMESC'
write(AAA(2),'(a6)') 'CME_ST'
write(AAA(3),'(a6)') 'CME_EN'
write(AAA(4),'(a6)') 'MC_STA'
write(AAA(5),'(a6)') 'MC_END'

read(1,*)

do i=1,5
af(i)=99999
enddo

      do l=1,192
      read(1,'(f6.2,1x,a10,1x,a5,I4,9(1x,f7.2),1x,f9.0,5(1x,f7.2),5(1x,I6))') &
      x(1), o,o2,a(1),(x(i),i=2,16),(a(i),i=2,6)
      write(*,'(f6.2,1x,a10,1x,a5,I4,9(1x,f7.2),1x,f9.0,5(1x,f7.2),5(1x,I6))') &
      x(1), o,o2,a(1),(x(i),i=2,16),(a(i),i=2,6)
          write(CCC,'(a6)') '      '
	  do k=4,5
	  if (a(k+1) .ne. af(k)) then
	  write(CCC,'(a6)') AAA(k)
	  af(k)=a(k+1)
	  else
	  endif
	  enddo
	  
	  write(DDD,'(a6)') '      '
	  do k=2,3
	  if (a(k+1) .ne. af(k)) then
	  write(DDD,'(a6)') AAA(k)
	  af(k)=a(k+1)
	  else
	  endif
	  enddo
	  
	  write(2,'(f6.2,1x,a10,1x,a5,I4,9(1x,f7.2),1x,f9.0,5(1x,f7.2),5(1x,I6))') &
	  x(1),o,o2,a(1),(x(i),i=2,16),(a(i),i=2,6)
	  if (CCC .ne. '      ') then
	  write(3,'(f6.2,1x,a10,1x,a5,I4,9(1x,f7.2),1x,f9.0,5(1x,f7.2),5(1x,I6),5(1x,A6))') &
	  x(1),o,o2,a(1),(x(i),i=2,16),(a(i),i=2,6),CCC
	  else
	  endif
	  if (DDD .ne. '      ') then
	  write(4,'(f6.2,1x,a10,1x,a5,I4,9(1x,f7.2),1x,f9.0,5(1x,f7.2),5(1x,I6),5(1x,A6))') &
	  x(1),o,o2,a(1),(x(i),i=2,16),(a(i),i=2,6),DDD
	  else
	  endif
      enddo
close(2)

enddo
end


