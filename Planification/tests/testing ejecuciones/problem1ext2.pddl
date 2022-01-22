(define (problem problemext2)
 
   (:domain ext2)
   (:objects
       room0 room1 room2 - room
       booking0 booking1 booking2 booking3 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 1)
       (= (orientationBooking booking0) 1)
       (= (iniDay booking0) 28)
       (= (finDay booking0) 30)
 
       (= (peopleBooking booking1) 4)
       (= (orientationBooking booking1) 2)
       (= (iniDay booking1) 25)
       (= (finDay booking1) 27)
 
       (= (peopleBooking booking2) 1)
       (= (orientationBooking booking2) 3)
       (= (iniDay booking2) 14)
       (= (finDay booking2) 25)
 
       (= (peopleBooking booking3) 1)
       (= (orientationBooking booking3) 3)
       (= (iniDay booking3) 12)
       (= (finDay booking3) 22)
 
       ;ROOMS
       (= (peopleRoom room0) 3)
       (= (orientationRoom room0) 4)
 
       (= (peopleRoom room1) 4)
       (= (orientationRoom room1) 3)
 
       (= (peopleRoom room2) 1)
       (= (orientationRoom room2) 2)
 
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
