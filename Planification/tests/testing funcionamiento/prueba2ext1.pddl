(define (problem problemext1)

    (:domain ext1)
    (:objects
   	 room0 room1 - room
   	 booking0 booking1 booking2 booking3 booking4 - booking
    )

    (:init

   	 ;SOLICITUDES
   	 (= (peopleBooking booking0) 2)
   	 (= (iniDay booking0) 1)
   	 (= (finDay booking0) 14)

   	 (= (peopleBooking booking1) 4)
   	 (= (iniDay booking1) 16)
   	 (= (finDay booking1) 30)

   	 (= (peopleBooking booking2) 1)
   	 (= (iniDay booking2) 3)
   	 (= (finDay booking2) 10)

   	 (= (peopleBooking booking3) 2)
   	 (= (iniDay booking3) 14)
   	 (= (finDay booking3) 17)
   	 
   	 (= (peopleBooking booking4) 2)
   	 (= (iniDay booking4) 26)
   	 (= (finDay booking4) 30)

   	 ;ROOMS
   	 (= (peopleRoom room0) 4)
   	 (= (peopleRoom room1) 2)

   	 (= (penalitation) 0)

    )

    (:goal
   	 (forall (?bking - booking) (served ?bking))
    )

    (:metric minimize (penalitation))
)
