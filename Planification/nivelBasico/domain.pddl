(define (domain nivelBasico)
	(:requirements :adl :typing :fluents)
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
		:effect (and (served ?bking) (assigned ?bking ?rm))
	)
)
