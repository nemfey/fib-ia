(define (problem problemExt2)
    
    (:domain ext2)
    (:objects
   	 room1 room2 - room
   	 booking1 booking2 booking3 booking4 - booking
    )

    (:init
   	 ;es mejor 1 reserva bien orientada que 3 mal orientadas
   	 
   	 (= (peopleBooking booking1) 1)
   	 (= (orientationBooking booking1) 1)
   	 (= (iniDay booking1) 1)
   	 (= (finDay booking1) 15)
   	 
   	 (= (peopleBooking booking2) 2)
   	 (= (orientationBooking booking2) 2)
   	 (= (iniDay booking2) 1)
   	 (= (finDay booking2) 2)
   	 
   	 (= (peopleBooking booking3) 3)
   	 (= (orientationBooking booking3) 3)
   	 (= (iniDay booking3) 3)
   	 (= (finDay booking3) 4)
   	 
   	 (= (peopleBooking booking4) 3)
   	 (= (orientationBooking booking4) 3)
   	 (= (iniDay booking4) 5)
   	 (= (finDay booking4) 6)
   	 
   	 (= (peopleRoom room1) 3)
   	 (= (orientationRoom room1) 1)
   	 
   	 (= (peopleRoom room2) 1)
   	 (= (orientationRoom room2) 1)
   	 
   	 (= (penalitation) 0)
    )
    
    (:goal
   	 (forall (?bking - booking) (served ?bking))
    )
    
    (:metric minimize (penalitation))
)
