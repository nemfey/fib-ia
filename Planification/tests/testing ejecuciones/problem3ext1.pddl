(define (problem problemext1)
 
   (:domain ext1)
   (:objects
       room0 room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 room12 room13 room14 room15 room16 room17 room18 room19 - room
       booking0 booking1 booking2 booking3 booking4 booking5 booking6 booking7 booking8 booking9 booking10 booking11 booking12 booking13 booking14 booking15 booking16 booking17 booking18 booking19 booking20 - booking
   )
 
   (:init
 
       ;SOLICITUDES
       (= (peopleBooking booking0) 3)
       (= (iniDay booking0) 28)
       (= (finDay booking0) 30)
 
       (= (peopleBooking booking1) 1)
       (= (iniDay booking1) 23)
       (= (finDay booking1) 25)
 
       (= (peopleBooking booking2) 3)
       (= (iniDay booking2) 15)
       (= (finDay booking2) 26)
 
       (= (peopleBooking booking3) 1)
       (= (iniDay booking3) 17)
       (= (finDay booking3) 22)
 
       (= (peopleBooking booking4) 3)
       (= (iniDay booking4) 15)
       (= (finDay booking4) 18)
 
       (= (peopleBooking booking5) 3)
       (= (iniDay booking5) 1)
       (= (finDay booking5) 26)
 
       (= (peopleBooking booking6) 2)
       (= (iniDay booking6) 10)
       (= (finDay booking6) 27)
 
       (= (peopleBooking booking7) 1)
       (= (iniDay booking7) 8)
       (= (finDay booking7) 28)
 
       (= (peopleBooking booking8) 4)
       (= (iniDay booking8) 22)
       (= (finDay booking8) 23)
 
       (= (peopleBooking booking9) 2)
       (= (iniDay booking9) 9)
       (= (finDay booking9) 22)
 
       (= (peopleBooking booking10) 3)
       (= (iniDay booking10) 13)
       (= (finDay booking10) 20)
 
       (= (peopleBooking booking11) 2)
       (= (iniDay booking11) 20)
       (= (finDay booking11) 26)
 
       (= (peopleBooking booking12) 3)
       (= (iniDay booking12) 5)
       (= (finDay booking12) 6)
 
       (= (peopleBooking booking13) 2)
       (= (iniDay booking13) 9)
       (= (finDay booking13) 16)
 
       (= (peopleBooking booking14) 1)
       (= (iniDay booking14) 14)
       (= (finDay booking14) 16)
 
       (= (peopleBooking booking15) 3)
       (= (iniDay booking15) 17)
       (= (finDay booking15) 23)
 
       (= (peopleBooking booking16) 2)
       (= (iniDay booking16) 18)
       (= (finDay booking16) 28)
 
       (= (peopleBooking booking17) 2)
       (= (iniDay booking17) 8)
       (= (finDay booking17) 25)
 
       (= (peopleBooking booking18) 3)
       (= (iniDay booking18) 27)
       (= (finDay booking18) 29)
 
       (= (peopleBooking booking19) 3)
       (= (iniDay booking19) 22)
       (= (finDay booking19) 28)
 
       (= (peopleBooking booking20) 3)
       (= (iniDay booking20) 22)
       (= (finDay booking20) 27)
 
       ;ROOMS
       (= (peopleRoom room0) 2)
       (= (peopleRoom room1) 3)
       (= (peopleRoom room2) 4)
       (= (peopleRoom room3) 4)
       (= (peopleRoom room4) 2)
       (= (peopleRoom room5) 3)
       (= (peopleRoom room6) 2)
       (= (peopleRoom room7) 2)
       (= (peopleRoom room8) 3)
       (= (peopleRoom room9) 1)
       (= (peopleRoom room10) 3)
       (= (peopleRoom room11) 3)
       (= (peopleRoom room12) 1)
       (= (peopleRoom room13) 1)
       (= (peopleRoom room14) 1)
       (= (peopleRoom room15) 2)
       (= (peopleRoom room16) 3)
       (= (peopleRoom room17) 4)
       (= (peopleRoom room18) 2)
       (= (peopleRoom room19) 3)
 
       (= (penalitation) 0)
 
   )
 
   (:goal
       (forall (?bking - booking) (served ?bking))
   )
 
   (:metric minimize (penalitation))
)
