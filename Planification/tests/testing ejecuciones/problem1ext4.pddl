(define (problem problemext4)
 
   (:domain ext4)
   (:objects
       room0 room1 room2 room3 - room
       booking0 booking1 booking2 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 1)
       (= (iniDay booking0) 10)
       (= (finDay booking0) 26)
 
       (= (peopleBooking booking1) 3)
       (= (iniDay booking1) 4)
       (= (finDay booking1) 24)
 
       (= (peopleBooking booking2) 1)
       (= (iniDay booking2) 10)
       (= (finDay booking2) 13)
 
       ;ROOMS
       (= (peopleRoom room0) 2)
       (= (peopleRoom room1) 3)
       (= (peopleRoom room2) 4)
       (= (peopleRoom room3) 3)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
