(define (problem problemext3)
 
   (:domain ext3)
   (:objects
       room0 room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 booking7 booking8 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 2)
       (= (iniDay booking0) 16)
       (= (finDay booking0) 24)
 
       (= (peopleBooking booking1) 4)
       (= (iniDay booking1) 25)
       (= (finDay booking1) 30)
 
       (= (peopleBooking booking2) 3)
       (= (iniDay booking2) 16)
       (= (finDay booking2) 18)
 
       (= (peopleBooking booking3) 4)
       (= (iniDay booking3) 11)
       (= (finDay booking3) 24)
 
       (= (peopleBooking booking4) 3)
       (= (iniDay booking4) 1)
       (= (finDay booking4) 29)
 
       (= (peopleBooking booking5) 1)
       (= (iniDay booking5) 25)
       (= (finDay booking5) 29)
 
       (= (peopleBooking booking6) 4)
       (= (iniDay booking6) 9)
       (= (finDay booking6) 14)
 
       (= (peopleBooking booking7) 4)
       (= (iniDay booking7) 16)
       (= (finDay booking7) 17)
 
       (= (peopleBooking booking8) 2)
       (= (iniDay booking8) 11)
       (= (finDay booking8) 18)
 
       ;ROOMS
       (= (peopleRoom room0) 4)
       (= (peopleRoom room1) 3)
       (= (peopleRoom room2) 2)
       (= (peopleRoom room3) 4)
       (= (peopleRoom room4) 1)
       (= (peopleRoom room5) 2)
       (= (peopleRoom room6) 1)
       (= (peopleRoom room7) 1)
       (= (peopleRoom room8) 4)
       (= (peopleRoom room9) 2)
       (= (peopleRoom room10) 3)
       (= (peopleRoom room11) 1)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
