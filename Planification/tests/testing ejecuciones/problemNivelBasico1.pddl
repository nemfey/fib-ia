(define (problem problemnivelBasico)
 
   (:domain nivelBasico)
   (:objects
       room0 room1 room2 room3 - room
       booking0 booking1 booking2 - booking
   )
 
   (:init
 
       ;INICIALIZACIÓN
       (not (served booking0))
       (not (served booking1))
       (not (served booking2))
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 4)
       (= (iniDay booking0) 24)
       (= (finDay booking0) 26)
 
       (= (peopleBooking booking1) 2)
       (= (iniDay booking1) 10)
       (= (finDay booking1) 20)
 
       (= (peopleBooking booking2) 2)
       (= (iniDay booking2) 25)
       (= (finDay booking2) 26)
 
       ;ROOMS
       (= (peopleRoom room0) 4)
       (= (peopleRoom room1) 1)
       (= (peopleRoom room2) 4)
       (= (peopleRoom room3) 1)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
)
