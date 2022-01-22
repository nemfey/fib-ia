(define (problem problemext1)
 
   (:domain ext1)
   (:objects
       room0 room1 room2 room3 - room
       booking0 booking1 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 4)
       (= (iniDay booking0) 4)
       (= (finDay booking0) 5)
 
       (= (peopleBooking booking1) 1)
       (= (iniDay booking1) 22)
       (= (finDay booking1) 23)
 
       ;ROOMS
       (= (peopleRoom room0) 2)
       (= (peopleRoom room1) 1)
       (= (peopleRoom room2) 1)
       (= (peopleRoom room3) 1)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
