(define (problem problemext4)

	(:domain ext4)
	(:objects
		room0 room1 room2 room3 - room
		booking0 booking1 booking2 - booking
	)

	(:init

		(= (peopleBooking booking0) 3)
		(= (iniDay booking0) 27)
		(= (finDay booking0) 29)

        (= (peopleBooking booking1) 3)
		(= (iniDay booking1) 15)
		(= (finDay booking1) 20)

        (= (peopleBooking booking2) 3)
		(= (iniDay booking2) 25)
		(= (finDay booking2) 26)
		;ROOMS
		(= (peopleRoom room0) 3)
		(= (peopleRoom room1) 3)
		(= (peopleRoom room2) 3)
		(= (peopleRoom room3) 3)

		(= (penalitation) 0)

	)

	(:goal
		(forall (?bking - booking) (served ?bking))
	)

	(:metric minimize (penalitation))
)