(define (problem problemExt2)
    
    (:domain ext2)
    (:objects
   	 room1 - room
   	 booking1 booking2 booking3 booking4 booking5 booking6 - booking
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
   	 
   	 (= (peopleBooking booking5) 3)
   	 (= (orientationBooking booking5) 3)
   	 (= (iniDay booking5) 7)
   	 (= (finDay booking5) 8)
   	 
   	 (= (peopleBooking booking6) 3)
   	 (= (orientationBooking booking6) 3)
   	 (= (iniDay booking6) 9)
   	 (= (finDay booking6) 11)
   	 
   	 (= (peopleRoom room1) 3)
   	 (= (orientationRoom room1) 1)
   	 
   	 (= (penalitation) 0)
    )
    
    (:goal
   	 (forall (?bking - booking) (served ?bking))
    )
    
    (:metric minimize (penalitation))
)
