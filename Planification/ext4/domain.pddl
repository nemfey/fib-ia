(define (domain ext4)
	
	(:requirements :adl :strips :typing :fluents)
	(:types booking room - object)
	
	(:predicates
		(assigned ?bking - booking ?rm - room)
		(served ?bking - booking)
		(used ?rm - room)
	)
	
	(:functions
		(peopleBooking ?bking - booking)
		(iniDay ?bking - booking)
		(finDay ?bking - booking)
		(peopleRoom ?rm - room)
		(penalitation)
	)
	
	(:action asignRoom
		:parameters (?bking - booking ?rm - room)
		:precondition (and 	(not (served ?bking))
					(>= (peopleRoom ?rm) (peopleBooking ?bking))
					(used ?rm)
					(forall (?auxBking - booking)
						(or	(not (assigned ?auxBking ?rm))
							(or 	(< (finDay ?auxBking) (iniDay ?bking))
								(> (iniDay ?auxBking) (finDay ?bking))
							)
						)
					)
				)
		:effect (and 	(served ?bking) (assigned ?bking ?rm)
				(increase (penalitation) (- (peopleRoom ?rm) (peopleBooking ?bking)))
			)
	)
	
	(:action asignNewRoom
		:parameters (?bking - booking ?rm - room)
		:precondition (and (not (served ?bking)) (>= (peopleRoom ?rm) (peopleBooking ?bking)) (not (used ?rm)))
		:effect (and 	(served ?bking) (assigned ?bking ?rm) (used ?rm)
				(increase (penalitation) (- (peopleRoom ?rm) (peopleBooking ?bking)))
				(increase (penalitation) 5)
			)
	)
	
	(:action notAsignRoom
		:parameters (?bking - booking)
		:precondition (not (served ?bking))
		:effect (and (served ?bking) (increase (penalitation) 15))
	)
)
