(define (problem problemext2)
 
   (:domain ext2)
   (:objects
       room0 room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 room12 room13 room14 room15 room16 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 booking7 booking8 booking9 booking10 booking11 booking12 booking13 booking14 booking15 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 4)
       (= (orientationBooking booking0) 4)
       (= (iniDay booking0) 2)
       (= (finDay booking0) 19)
 
       (= (peopleBooking booking1) 3)
       (= (orientationBooking booking1) 1)
       (= (iniDay booking1) 2)
       (= (finDay booking1) 27)
 
       (= (peopleBooking booking2) 4)
       (= (orientationBooking booking2) 3)
       (= (iniDay booking2) 28)
       (= (finDay booking2) 29)
 
       (= (peopleBooking booking3) 2)
       (= (orientationBooking booking3) 4)
       (= (iniDay booking3) 16)
       (= (finDay booking3) 28)
 
       (= (peopleBooking booking4) 4)
       (= (orientationBooking booking4) 3)
       (= (iniDay booking4) 24)
       (= (finDay booking4) 29)
 
       (= (peopleBooking booking5) 2)
       (= (orientationBooking booking5) 2)
       (= (iniDay booking5) 7)
       (= (finDay booking5) 11)
 
       (= (peopleBooking booking6) 2)
       (= (orientationBooking booking6) 4)
       (= (iniDay booking6) 15)
       (= (finDay booking6) 25)
 
       (= (peopleBooking booking7) 3)
       (= (orientationBooking booking7) 2)
       (= (iniDay booking7) 9)
       (= (finDay booking7) 10)
 
       (= (peopleBooking booking8) 4)
       (= (orientationBooking booking8) 3)
       (= (iniDay booking8) 11)
       (= (finDay booking8) 25)
 
       (= (peopleBooking booking9) 2)
       (= (orientationBooking booking9) 2)
       (= (iniDay booking9) 11)
       (= (finDay booking9) 30)
 
       (= (peopleBooking booking10) 2)
       (= (orientationBooking booking10) 4)
       (= (iniDay booking10) 19)
       (= (finDay booking10) 25)
 
       (= (peopleBooking booking11) 4)
       (= (orientationBooking booking11) 1)
       (= (iniDay booking11) 4)
       (= (finDay booking11) 6)
 
       (= (peopleBooking booking12) 4)
       (= (orientationBooking booking12) 2)
       (= (iniDay booking12) 16)
       (= (finDay booking12) 19)
 
       (= (peopleBooking booking13) 4)
       (= (orientationBooking booking13) 2)
       (= (iniDay booking13) 24)
       (= (finDay booking13) 28)
 
       (= (peopleBooking booking14) 2)
       (= (orientationBooking booking14) 2)
       (= (iniDay booking14) 16)
       (= (finDay booking14) 18)
 
       (= (peopleBooking booking15) 1)
       (= (orientationBooking booking15) 1)
       (= (iniDay booking15) 5)
       (= (finDay booking15) 6)
 
       ;ROOMS
       (= (peopleRoom room0) 2)
       (= (orientationRoom room0) 1)
 
       (= (peopleRoom room1) 3)
       (= (orientationRoom room1) 3)
 
       (= (peopleRoom room2) 4)
       (= (orientationRoom room2) 1)
 
       (= (peopleRoom room3) 4)
       (= (orientationRoom room3) 4)
 
       (= (peopleRoom room4) 1)
       (= (orientationRoom room4) 2)
 
       (= (peopleRoom room5) 1)
       (= (orientationRoom room5) 4)
 
       (= (peopleRoom room6) 3)
       (= (orientationRoom room6) 1)
 
       (= (peopleRoom room7) 1)
       (= (orientationRoom room7) 1)
 
       (= (peopleRoom room8) 4)
       (= (orientationRoom room8) 2)
 
       (= (peopleRoom room9) 4)
       (= (orientationRoom room9) 2)
 
       (= (peopleRoom room10) 1)
       (= (orientationRoom room10) 2)
 
       (= (peopleRoom room11) 3)
       (= (orientationRoom room11) 1)
 
       (= (peopleRoom room12) 4)
       (= (orientationRoom room12) 4)
 
       (= (peopleRoom room13) 4)
       (= (orientationRoom room13) 4)
 
       (= (peopleRoom room14) 4)
       (= (orientationRoom room14) 2)
 
       (= (peopleRoom room15) 1)
       (= (orientationRoom room15) 2)
 
       (= (peopleRoom room16) 2)
       (= (orientationRoom room16) 4)
 
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
