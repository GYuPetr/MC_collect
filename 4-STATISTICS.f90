integer a(5),z
real b(5)
character src*5, plr*2,zzz(10)*5,Zpol(4)*2

open(1,file='MC_ZHANG_OUT')
open(2,file='MC_ZHANG_OUT_SORTED')

write(zzz(1),'(a5)') 'AF___'
write(zzz(2),'(a5)') 'TF___'
write(zzz(3),'(a5)') 'LF___'
write(zzz(4),'(a5)') 'SH___'
write(zzz(5),'(a5)') 'TF_TF'
write(zzz(6),'(a5)') 'LF_LF'
write(zzz(7),'(a5)') 'LF_TF'
write(zzz(8),'(a5)') 'S_LF_'
write(zzz(9),'(a5)') 'S_TF_'
write(zzz(10),'(a5)') '#####'

write(Zpol(1),'(a2)') 'NS'
write(Zpol(2),'(a2)') 'SN'
write(Zpol(3),'(a2)') 'N_'
write(Zpol(4),'(a2)') 'S_'

do z=1,3
write(2,*) '________________________ZZZZZZ', z, 'ZZZZZZZ_______________'
!do k=1,10
      do j=1,104

      read(1,*) b(1),a(1),a(2),b(2),a(3),b(3),a(4),a(5),src,plr,b(4),b(5)

	    !if ((src .eq. zzz(k)) .and. (a(4) .eq. z)) then
	    if ((a(4) .eq. z)) then
	    write(2,'(f6.2,1x,i4,1x,i3,1x,f6.2,1x,i3,1x,f6.2,1x,i2,1x,i4,1x,a5,1x,a2,2(1x,f6.2))') b(1),&
	    a(1),a(2),b(2),a(3),b(3),a(4),a(5),src,plr,b(4),b(5)
	    else
	    endif

     enddo

      rewind(1)
      write(2,*) '--------------'
!enddo

!do k=1,4
!      do j=1,104

!      read(1,*) b(1),a(1),a(2),b(2),a(3),b(3),a(4),a(5),src,plr,b(4),b(5)
!
!	    if ((plr .eq. Zpol(k)) .and. (a(4) .eq. z)) then
!	    write(2,'(f6.2,1x,i4,1x,i3,1x,f6.2,1x,i3,1x,f6.2,1x,i2,1x,i4,1x,a5,1x,a2,2(1x,f6.2))') b(1),&
!	    a(1),a(2),b(2),a(3),b(3),a(4),a(5),src,plr,b(4),b(5)
!	    else
!	    endif
!
!     enddo

!       rewind(1)
      write(2,*) '--------------'
!enddo
enddo
end