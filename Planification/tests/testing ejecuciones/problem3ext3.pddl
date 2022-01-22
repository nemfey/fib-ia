(define (problem problemext3)
 
   (:domain ext3)
   (:objects
       room0 room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 room12 room13 room14 room15 room16 room17 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 booking7 booking8 booking9 booking10 booking11 booking12 booking13 booking14 booking15 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 2)
       (= (iniDay booking0) 13)
       (= (finDay booking0) 28)
 
       (= (peopleBooking booking1) 2)
       (= (iniDay booking1) 28)
       (= (finDay booking1) 29)
 
       (= (peopleBooking booking2) 3)
       (= (iniDay booking2) 19)
       (= (finDay booking2) 28)
 
       (= (peopleBooking booking3) 4)
       (= (iniDay booking3) 29)
       (= (finDay booking3) 30)
 
       (= (peopleBooking booking4) 1)
       (= (iniDay booking4) 27)
       (= (finDay booking4) 30)
 
       (= (peopleBooking booking5) 3)
       (= (iniDay booking5) 29)
       (= (finDay booking5) 30)
 
       (= (peopleBooking booking6) 3)
       (= (iniDay booking6) 6)
       (= (finDay booking6) 9)
 
       (= (peopleBooking booking7) 1)
       (= (iniDay booking7) 13)
       (= (finDay booking7) 30)
 
       (= (peopleBooking booking8) 2)
       (= (iniDay booking8) 5)
       (= (finDay booking8) 20)
 
       (= (peopleBooking booking9) 3)
       (= (iniDay booking9) 19)
       (= (finDay booking9) 25)
 
       (= (peopleBooking booking10) 1)
       (= (iniDay booking10) 16)
       (= (finDay booking10) 24)
 
       (= (peopleBooking booking11) 4)
       (= (iniDay booking11) 2)
       (= (finDay booking11) 16)
 
       (= (peopleBooking booking12) 3)
       (= (iniDay booking12) 27)
       (= (finDay booking12) 29)
 
       (= (peopleBooking booking13) 4)
       (= (iniDay booking13) 14)
       (= (finDay booking13) 27)
 
       (= (peopleBooking booking14) 4)
       (= (iniDay booking14) 21)
       (= (finDay booking14) 24)
 
       (= (peopleBooking booking15) 4)
       (= (iniDay booking15) 14)
       (= (finDay booking15) 27)
 
       ;ROOMS
       (= (peopleRoom room0) 1)
       (= (peopleRoom room1) 1)
       (= (peopleRoom room2) 2)
       (= (peopleRoom room3) 3)
       (= (peopleRoom room4) 1)
       (= (peopleRoom room5) 1)
       (= (peopleRoom room6) 3)
       (= (peopleRoom room7) 3)
       (= (peopleRoom room8) 2)
       (= (peopleRoom room9) 1)
       (= (peopleRoom room10) 4)
       (= (peopleRoom room11) 1)
       (= (peopleRoom room12) 1)
       (= (peopleRoom room13) 3)
       (= (peopleRoom room14) 4)
       (= (peopleRoom room15) 4)
       (= (peopleRoom room16) 3)
       (= (peopleRoom room17) 4)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
