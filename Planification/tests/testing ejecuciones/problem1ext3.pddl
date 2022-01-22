(define (problem problemext3)
 
   (:domain ext3)
   (:objects
       room0 room1 room2 - room
       booking0 booking1 booking2 booking3 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 1)
       (= (iniDay booking0) 15)
       (= (finDay booking0) 16)
 
       (= (peopleBooking booking1) 3)
       (= (iniDay booking1) 14)
       (= (finDay booking1) 30)
 
       (= (peopleBooking booking2) 2)
       (= (iniDay booking2) 4)
       (= (finDay booking2) 24)
 
       (= (peopleBooking booking3) 3)
       (= (iniDay booking3) 29)
       (= (finDay booking3) 30)
 
       ;ROOMS
       (= (peopleRoom room0) 2)
       (= (peopleRoom room1) 3)
       (= (peopleRoom room2) 4)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
