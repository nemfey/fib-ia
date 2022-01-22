(define (problem problemext4)
 
   (:domain ext4)
   (:objects
       room0 room1 room2 room3 room4 room5 room6 room7 room8 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 booking7 booking8 booking9 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 2)
       (= (iniDay booking0) 25)
       (= (finDay booking0) 27)
 
       (= (peopleBooking booking1) 1)
       (= (iniDay booking1) 28)
       (= (finDay booking1) 29)
 
       (= (peopleBooking booking2) 3)
       (= (iniDay booking2) 17)
       (= (finDay booking2) 22)
 
       (= (peopleBooking booking3) 1)
       (= (iniDay booking3) 17)
       (= (finDay booking3) 27)
 
       (= (peopleBooking booking4) 1)
       (= (iniDay booking4) 9)
       (= (finDay booking4) 28)
 
       (= (peopleBooking booking5) 3)
       (= (iniDay booking5) 3)
       (= (finDay booking5) 15)
 
       (= (peopleBooking booking6) 4)
       (= (iniDay booking6) 19)
       (= (finDay booking6) 24)
 
       (= (peopleBooking booking7) 2)
       (= (iniDay booking7) 25)
       (= (finDay booking7) 27)
 
       (= (peopleBooking booking8) 1)
       (= (iniDay booking8) 23)
       (= (finDay booking8) 24)
 
       (= (peopleBooking booking9) 4)
       (= (iniDay booking9) 6)
       (= (finDay booking9) 12)
 
       ;ROOMS
       (= (peopleRoom room0) 3)
       (= (peopleRoom room1) 4)
       (= (peopleRoom room2) 1)
       (= (peopleRoom room3) 4)
       (= (peopleRoom room4) 4)
       (= (peopleRoom room5) 2)
       (= (peopleRoom room6) 2)
       (= (peopleRoom room7) 2)
       (= (peopleRoom room8) 4)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
