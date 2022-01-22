(define (problem problemext3)

	(:domain ext3)
	(:objects
		room0 room1 room2 - room
		booking0 booking1 booking2 booking3 - booking
	)

	(:init

		;SOLICITUDES
		(= (peopleBooking booking0) 1)
		(= (iniDay booking0) 13)
		(= (finDay booking0) 28)

		(= (peopleBooking booking1) 2)
		(= (iniDay booking1) 27)
		(= (finDay booking1) 29)

        (= (peopleBooking booking2) 2)
		(= (iniDay booking1) 28)
		(= (finDay booking1) 29)

		(= (peopleBooking booking3) 3)
		(= (iniDay booking1) 28)
		(= (finDay booking1) 29)
		;ROOMS
		(= (peopleRoom room0) 3)
		(= (peopleRoom room1) 2)
		(= (peopleRoom room2) 2)

		(= (penalitation) 0)

	)

	(:goal
		(forall (?bking - booking) (served ?bking))
	)

	(:metric minimize (penalitation))
)