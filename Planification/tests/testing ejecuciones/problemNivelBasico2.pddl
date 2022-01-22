(define (problem problemnivelBasico)
 
   (:domain nivelBasico)
   (:objects
       room0 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 - booking
   )
 
   (:init
 
       ;INICIALIZACIÓN
       (not (served booking0))
       (not (served booking1))
       (not (served booking2))
       (not (served booking3))
       (not (served booking4))
       (not (served booking5))
       (not (served booking6))
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 1)
       (= (iniDay booking0) 7)
       (= (finDay booking0) 28)
 
       (= (peopleBooking booking1) 1)
       (= (iniDay booking1) 15)
       (= (finDay booking1) 24)
 
       (= (peopleBooking booking2) 2)
       (= (iniDay booking2) 17)
       (= (finDay booking2) 28)
 
       (= (peopleBooking booking3) 4)
       (= (iniDay booking3) 4)
       (= (finDay booking3) 30)
 
       (= (peopleBooking booking4) 1)
       (= (iniDay booking4) 2)
       (= (finDay booking4) 29)
 
       (= (peopleBooking booking5) 4)
       (= (iniDay booking5) 1)
       (= (finDay booking5) 6)
 
       (= (peopleBooking booking6) 3)
       (= (iniDay booking6) 13)
       (= (finDay booking6) 18)
 
       ;ROOMS
       (= (peopleRoom room0) 1)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
)
