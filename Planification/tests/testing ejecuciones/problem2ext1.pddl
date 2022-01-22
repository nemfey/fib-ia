(define (problem problemext1)
 
   (:domain ext1)
   (:objects
       room0 room1 room2 room3 room4 room5 room6 room7 room8 room9 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 booking7 booking8 booking9 booking10 booking11 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 2)
       (= (iniDay booking0) 25)
       (= (finDay booking0) 29)
 
       (= (peopleBooking booking1) 4)
       (= (iniDay booking1) 29)
       (= (finDay booking1) 30)
 
       (= (peopleBooking booking2) 1)
       (= (iniDay booking2) 26)
       (= (finDay booking2) 30)
 
       (= (peopleBooking booking3) 4)
       (= (iniDay booking3) 19)
       (= (finDay booking3) 24)
 
       (= (peopleBooking booking4) 2)
       (= (iniDay booking4) 11)
       (= (finDay booking4) 24)
 
       (= (peopleBooking booking5) 4)
       (= (iniDay booking5) 26)
       (= (finDay booking5) 29)
 
       (= (peopleBooking booking6) 3)
       (= (iniDay booking6) 2)
       (= (finDay booking6) 7)
 
       (= (peopleBooking booking7) 2)
       (= (iniDay booking7) 27)
       (= (finDay booking7) 30)
 
       (= (peopleBooking booking8) 1)
       (= (iniDay booking8) 5)
       (= (finDay booking8) 22)
 
       (= (peopleBooking booking9) 2)
       (= (iniDay booking9) 2)
       (= (finDay booking9) 16)
 
       (= (peopleBooking booking10) 3)
       (= (iniDay booking10) 18)
       (= (finDay booking10) 22)
 
       (= (peopleBooking booking11) 2)
       (= (iniDay booking11) 18)
       (= (finDay booking11) 27)
 
       ;ROOMS
       (= (peopleRoom room0) 4)
       (= (peopleRoom room1) 3)
       (= (peopleRoom room2) 3)
       (= (peopleRoom room3) 4)
       (= (peopleRoom room4) 3)
       (= (peopleRoom room5) 2)
       (= (peopleRoom room6) 4)
       (= (peopleRoom room7) 2)
       (= (peopleRoom room8) 4)
       (= (peopleRoom room9) 4)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
