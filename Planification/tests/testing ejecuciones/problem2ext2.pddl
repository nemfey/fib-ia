(define (problem problemext2)
 
   (:domain ext2)
   (:objects
       room0 room1 room2 room3 room4 room5 room6 room7 room8 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 booking7 booking8 booking9 booking10 booking11 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 3)
       (= (orientationBooking booking0) 1)
       (= (iniDay booking0) 21)
       (= (finDay booking0) 24)
 
       (= (peopleBooking booking1) 4)
       (= (orientationBooking booking1) 2)
       (= (iniDay booking1) 17)
       (= (finDay booking1) 27)
 
       (= (peopleBooking booking2) 4)
       (= (orientationBooking booking2) 4)
       (= (iniDay booking2) 23)
       (= (finDay booking2) 24)
 
       (= (peopleBooking booking3) 1)
       (= (orientationBooking booking3) 3)
       (= (iniDay booking3) 29)
       (= (finDay booking3) 30)
 
       (= (peopleBooking booking4) 2)
       (= (orientationBooking booking4) 1)
       (= (iniDay booking4) 24)
       (= (finDay booking4) 29)
 
       (= (peopleBooking booking5) 1)
       (= (orientationBooking booking5) 3)
       (= (iniDay booking5) 9)
       (= (finDay booking5) 28)
 
       (= (peopleBooking booking6) 4)
       (= (orientationBooking booking6) 1)
       (= (iniDay booking6) 17)
       (= (finDay booking6) 30)
 
       (= (peopleBooking booking7) 4)
       (= (orientationBooking booking7) 4)
       (= (iniDay booking7) 2)
       (= (finDay booking7) 14)
 
       (= (peopleBooking booking8) 2)
       (= (orientationBooking booking8) 3)
       (= (iniDay booking8) 3)
       (= (finDay booking8) 16)
 
       (= (peopleBooking booking9) 3)
       (= (orientationBooking booking9) 2)
       (= (iniDay booking9) 17)
       (= (finDay booking9) 26)
 
       (= (peopleBooking booking10) 1)
       (= (orientationBooking booking10) 4)
       (= (iniDay booking10) 18)
       (= (finDay booking10) 29)
 
       (= (peopleBooking booking11) 2)
       (= (orientationBooking booking11) 1)
       (= (iniDay booking11) 25)
       (= (finDay booking11) 28)
 
       ;ROOMS
       (= (peopleRoom room0) 1)
       (= (orientationRoom room0) 1)
 
       (= (peopleRoom room1) 2)
       (= (orientationRoom room1) 4)
 
       (= (peopleRoom room2) 3)
       (= (orientationRoom room2) 4)
 
       (= (peopleRoom room3) 2)
       (= (orientationRoom room3) 4)
 
       (= (peopleRoom room4) 2)
       (= (orientationRoom room4) 4)
 
       (= (peopleRoom room5) 3)
       (= (orientationRoom room5) 3)
 
       (= (peopleRoom room6) 2)
       (= (orientationRoom room6) 3)
 
       (= (peopleRoom room7) 4)
       (= (orientationRoom room7) 2)
 
       (= (peopleRoom room8) 2)
       (= (orientationRoom room8) 2)
 
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
