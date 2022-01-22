(define (domain ext3)
	
	(:requirements :adl :strips :typing :fluents)
	(:types booking room - object)
	
	(:predicates
		(assigned ?bking - booking ?rm - room)
		(served ?bking - booking)
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
	
	(:action notAsignRoom
		:parameters (?bking - booking)
		:precondition (not (served ?bking))
		:effect (and (served ?bking) (increase (penalitation) 15))
	)
)
