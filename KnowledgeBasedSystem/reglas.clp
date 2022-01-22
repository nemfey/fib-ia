;Tipos de preguntas
;Pregunta si o no
(deffunction pregunta-si-no (?pregunta)
    (format t "%s (si/no): " ?pregunta)
    (bind ?respuesta (read))
    (printout t crlf)
    (if (or (eq ?respuesta si) (eq ?respuesta s))
        then TRUE
    else FALSE)
)

;Pregunta numerica
(deffunction pregunta-numerica (?pregunta ?min ?max)
    (format t "%s : " ?pregunta)
    (bind ?respuesta (read))
    (while (not(and(>= ?respuesta ?min)(<= ?respuesta ?max))) do
        ;(format t "%s (numero): " ?pregunta)
        (format t "%s : " ?pregunta)
        (bind ?respuesta (read))
    )
    (printout t crlf)
    ?respuesta
)

;Calcula la distancia euclidea entre dos puntos
(deffunction calcula-distancia (?x1 ?y1 ?x2 ?y2)
    (bind ?distX (- ?x1 ?x2))
    (bind ?distX (* ?distX ?distX))

    (bind ?distY (- ?y1 ?y2))
    (bind ?distY (* ?distY ?distY))

    (bind ?distance (sqrt (+ ?distX ?distY)))

    ?distance
)

;En las funciones relacionadas con las distancias, devolveremos 3 tipos de valores:
;0 -> no hay transporte cerca
;1 -> hay un transporte a media distancia
;2 -> hay un transporte cerca

(deffunction dist-transporte (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?transportes (find-all-instances ((?instancia Transporte)) TRUE))

    (while (and (<= ?i (length$ ?transportes)) (< ?n 2)) do
        ;t = transporte actual
        (bind ?t (nth$ ?i ?transportes))
        (bind ?tx (send ?t get-coordenadaX))
        (bind ?ty (send ?t get-coordenadaY))

        (bind ?dist (calcula-distancia ?x ?y ?tx ?ty))
        (if (<= ?dist 100)
            then (bind ?n 1)
        )
        (if (<= ?dist 50)
            then (bind ?n 2)
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

(deffunction dist-metro (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?transportes (find-all-instances ((?instancia Transporte)) TRUE))

    (while (and (<= ?i (length$ ?transportes)) (< ?n 2)) do
        ;t = transporte actual
        (bind ?t (nth$ ?i ?transportes))
        (bind ?tipo (send ?t get-tipoTransporte))
        (if(eq ?tipo "Metro")
            then
                (bind ?tx (send ?t get-coordenadaX))
                (bind ?ty (send ?t get-coordenadaY))

                (bind ?dist (calcula-distancia ?x ?y ?tx ?ty))
                (if (<= ?dist 100)
                    then (bind ?n 1)
                )
                (if (<= ?dist 50)
                    then (bind ?n 2)
                )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

(deffunction dist-autobus (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?transportes (find-all-instances ((?instancia Transporte)) TRUE))

    (while (and (<= ?i (length$ ?transportes)) (< ?n 2)) do
        ;t = transporte actual
        (bind ?t (nth$ ?i ?transportes))
        (bind ?tipo (send ?t get-tipoTransporte))
        (if(eq ?tipo "Autobus")
            then
                (bind ?tx (send ?t get-coordenadaX))
                (bind ?ty (send ?t get-coordenadaY))

                (bind ?dist (calcula-distancia ?x ?y ?tx ?ty))
                (if (<= ?dist 100)
                    then (bind ?n 1)
                )
                (if (<= ?dist 50)
                    then (bind ?n 2)
                )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

(deffunction dist-tren (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?transportes (find-all-instances ((?instancia Transporte)) TRUE))

    (while (and (<= ?i (length$ ?transportes)) (< ?n 2)) do
        ;t = transporte actual
        (bind ?t (nth$ ?i ?transportes))
        (bind ?tipo (send ?t get-tipoTransporte))
        (if(eq ?tipo "Tren")
            then
                (bind ?tx (send ?t get-coordenadaX))
                (bind ?ty (send ?t get-coordenadaY))

                (bind ?dist (calcula-distancia ?x ?y ?tx ?ty))
                (if (<= ?dist 100)
                    then (bind ?n 1)
                )
                (if (<= ?dist 50)
                    then (bind ?n 2)
                )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-parque (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?parques (find-all-instances ((?instancia Parque)) TRUE))

    (while (and (<= ?i (length$ ?parques)) (< ?n 2)) do
        ;parque actual
        (bind ?p (nth$ ?i ?parques))
        (bind ?px (send ?p get-coordenadaX))
        (bind ?py (send ?p get-coordenadaY))
        
        (bind ?dist (calcula-distancia ?x ?y ?px ?py))

        (if (<= ?dist 100)
            then (bind ?n 1)
        )
        (if (<= ?dist 50)
            then (bind ?n 2)
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-salud (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?centrossalud (find-all-instances ((?instancia Salud)) TRUE))

    (while (and (<= ?i (length$ ?centrossalud)) (< ?n 2)) do
        ;cs = centro de salud actual
        (bind ?cs (nth$ ?i ?centrossalud))
        (bind ?csx (send ?cs get-coordenadaX))
        (bind ?csy (send ?cs get-coordenadaY))
        
        (bind ?dist (calcula-distancia ?x ?y ?csx ?csy))

        (if (<= ?dist 100)
            then (bind ?n 1)
        )
        (if (<= ?dist 50)
            then (bind ?n 2)
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-ocio (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?ocios (find-all-instances ((?instancia Ocio)) TRUE))

    (while (and (<= ?i (length$ ?ocios)) (< ?n 2)) do
        ;o = ocio actual
        (bind ?o (nth$ ?i ?ocios))
        (bind ?ox (send ?o get-coordenadaX))
        (bind ?oy (send ?o get-coordenadaY))
        
        (bind ?dist (calcula-distancia ?x ?y ?ox ?oy))

        (if (<= ?dist 100)
            then (bind ?n 1)
        )
        (if (<= ?dist 50)
            then (bind ?n 2)
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-discoteca (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?ocios (find-all-instances ((?instancia Ocio)) TRUE))

    (while (and (<= ?i (length$ ?ocios)) (< ?n 2)) do
        ;o = ocio actual
        (bind ?o (nth$ ?i ?ocios))
        (bind ?tipo (send ?o get-tipoOcio))
        (if(eq ?tipo "Discoteca")     ;solo calculamos si es de tipo discoteca
            then
                (bind ?ox (send ?o get-coordenadaX))
                (bind ?oy (send ?o get-coordenadaY))
                
                (bind ?dist (calcula-distancia ?x ?y ?ox ?oy))
                (printout t "distancia disco: " ?dist crlf)
                (if (<= ?dist 100)
                    then (bind ?n 1)
                )
                (if (<= ?dist 50)
                    then (bind ?n 2)
                )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-primaria (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?centroseducacion (find-all-instances ((?instancia Educacion)) TRUE))

    (while (and (<= ?i (length$ ?centroseducacion)) (< ?n 2)) do
        ;ce = centro educacion actual
        (bind ?ce (nth$ ?i ?centroseducacion))
        (bind ?tipo (send ?ce get-tipoEducacion))
        (if(eq ?tipo Primaria)
            then
                (bind ?cex (send ?ce get-coordenadaX))
                (bind ?cey (send ?ce get-coordenadaY))
                
                (bind ?dist (calcula-distancia ?x ?y ?cex ?cey))

            (if (<= ?dist 100)
                then (bind ?n 1)
            )
            (if (<= ?dist 50)
                then (bind ?n 2)
            )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-secundaria (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?centroseducacion (find-all-instances ((?instancia Educacion)) TRUE))

    (while (and (<= ?i (length$ ?centroseducacion)) (< ?n 2)) do
        ;ce = centro educacion actual
        (bind ?ce (nth$ ?i ?centroseducacion))
        (bind ?tipo (send ?ce get-tipoEducacion))
        (if(eq ?tipo Secundaria)     ;;;solo calculamos si es de tipo secundaria
            then
                (bind ?cex (send ?ce get-coordenadaX))
                (bind ?cey (send ?ce get-coordenadaY))
                
                (bind ?dist (calcula-distancia ?x ?y ?cex ?cey))

            (if (<= ?dist 100)
                then (bind ?n 1)
            )
            (if (<= ?dist 50)
                then (bind ?n 2)
            )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-universitaria (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?centroseducacion (find-all-instances ((?instancia Educacion)) TRUE))

    (while (and (<= ?i (length$ ?centroseducacion)) (< ?n 2)) do
        ;ce = centro educacion actual
        (bind ?ce (nth$ ?i ?centroseducacion))
        (bind ?tipo (send ?ce get-tipoEducacion))
        (if(eq ?tipo Universitaria)     ;;;solo calculamos si es de tipo universitaria
            then
                (bind ?cex (send ?ce get-coordenadaX))    ;;;no se si esto automaticamente busca en la superclase servicio(?)
                (bind ?cey (send ?ce get-coordenadaY))
                
                (bind ?dist (calcula-distancia ?x ?y ?cex ?cey))

            (if (<= ?dist 100)
                then (bind ?n 1)
            )
            (if (<= ?dist 50)
                then (bind ?n 2)
            )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;mismo sistema con devolucion de valores 0/1/2
(deffunction dist-supermercado (?vivienda)
    (bind ?x (send ?vivienda get-coordenadaX))
    (bind ?y (send ?vivienda get-coordenadaY))

    (bind ?i 1)
    (bind ?n 0)
    (bind ?comercios (find-all-instances ((?instancia Comercio)) TRUE))

    (while (and (<= ?i (length$ ?comercios)) (< ?n 2)) do
        ;c = comercio actual
        (bind ?c (nth$ ?i ?comercios))
        (bind ?tipo (send ?c get-tipoComercio))
        (if(eq ?tipo Supermercado)     ;;;solo calculamos si es de tipo supermercado
            then
                (bind ?cx (send ?c get-coordenadaX))
                (bind ?cy (send ?c get-coordenadaY))
                
                (bind ?dist (calcula-distancia ?x ?y ?cx ?cy))

            (if (<= ?dist 100)
                then (bind ?n 1)
            )
            (if (<= ?dist 50)
                then (bind ?n 2)
            )
        )
        (bind ?i (+ ?i 1))
    )
    ?n
)

;Definición de Clases y Templates
(defclass Candidata
	(is-a USER)
	(role concrete)
	(slot vivienda
		(type INSTANCE)
		(allowed-classes Vivienda)
		(create-accessor read-write))
	(slot puntuacion
		(type INTEGER)
		(create-accessor read-write))
)

;muy recomendable

(defclass muyRecomendable
    (is-a Candidata)
    (role concrete)
    (multislot cosasBuenas
        (type STRING)
        (create-accessor read-write))
)


(defclass Adecuada
	(is-a Candidata)
	(role concrete)
)

(defclass parcialmenteAdecuada
    (is-a Candidata)
    (role concrete)
    (multislot cosasBuenas
        (type STRING)
        (create-accessor read-write))
    (multislot cosasMalas
        (type STRING)
        (create-accessor read-write))
)

(defclass NoAdecuada
	(is-a Candidata)
	(role concrete)
    (multislot cosasMalas
        (type STRING)
        (create-accessor read-write))
)

; ***********************************************
; ****** obtener los datos de los clientes ******
; ***********************************************

;guardar los datos de los clientes
(deftemplate datosCliente
    (slot precio-max            (type INTEGER))
    (slot precio-min            (type INTEGER))
	(slot metros-cuadrados-max  (type INTEGER))
	(slot metros-cuadrados-min  (type INTEGER))
    (slot tipo-piso             (type INTEGER)) ;1.Familiar 2.Estudiante 3.Jubilado 4.Otro
    (slot tipo-educacion        (type INTEGER)) ;1.Primaria 2.Secundaria 3.Universitaria
	(slot tiene-mascota         (type SYMBOL) (allowed-values FALSE TRUE) (default FALSE))
    (slot tipo-transporte       (type INTEGER)) ;0.No usa 1.Metro 2.Autobus 3.Tren
)

;guardar las exigencias del cliente
(deftemplate exigenciasCliente
    (slot num-habitaciones  (type INTEGER) (default 1))
    (slot num-lavabos       (type INTEGER) (default 1))
    (slot equipado          (type INTEGER) (default 1)) ;1.Me da igual 2.Me interesa 3.SI 4.NO
    (slot ascensor          (type INTEGER) (default 1)) ;1.Me da igual 2.Me interesa 3.SI 4.NO
    (slot garaje            (type INTEGER) (default 1)) ;1.Me da igual 2.Me interesa 3.SI 4.NO
    (slot vistas            (type INTEGER) (default 1)) ;1.Me da igual 2.Me interesa 3.SI 4.NO
    (slot piscina           (type INTEGER) (default 1)) ;1.Me da igual 2.Me interesa 3.SI 4.NO
    (slot terraza           (type INTEGER) (default 1)) ;1.Me da igual 2.Me interesa 3.SI 4.NO
    (slot ubicacion         (type INTEGER) (default 0)) ;0.No preferencia 1.Centro 2.Afueras 3.Mar 4.Montaña
)

(defrule saludo-initial "saludo"
	(initial-fact)
	=>
	(printout t crlf)
    (printout t "                       .|"                                 crlf)
    (printout t "                       | |"                                crlf)
    (printout t "                       |'|            ._____"              crlf)
    (printout t "               ___    |  |            |.   |' .---'|"      crlf)
    (printout t "       _    .-'   '-. |  |     .--'|  ||   | _|    |"      crlf)
    (printout t "    .-'|  _.|  |    ||   '-__  |   |  |    ||      |"      crlf)
    (printout t "    |' | |.    |    ||       | |   |  |    ||      |"      crlf)
    (printout t " ___|  '-'     '    ||       '-'   '-.'    '`      |____"  crlf)
    (printout t "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  crlf)
    (printout t crlf)
    (printout t "   ¡Bienvenido al buscador de viviendas en Barcelona!   "  crlf)
    (printout t crlf)
	(printout t "A continuación vamos a realizarle una serie de preguntas para poder buscar pisos que sean de su agrado:" crlf)
    (printout t crlf)
	(assert (preguntar-datos))
)

(defrule datos "Preguntas para cliente"
	?puntero <- (preguntar-datos)

	=>
    ;Preguntas referentes a los datos del cliente
	;Precio
 	(bind ?precio-min (pregunta-numerica "¿Cuál es el precio mínimo que desea?" 0 9999))
	(bind ?precio-max (pregunta-numerica "¿Cuál es el precio máximo que desea?" 0 9999))

	;Metros cuadrados
	(bind ?sq-min (pregunta-numerica "¿Cuántos son los metros cuadrados mínimos que desea?" 0 9999))
	(bind ?sq-max (pregunta-numerica "¿Cuántos son los metros cuadrados máximos que desea?" 0 9999))

    ;Tipo de piso
    (printout t "¿Que tipo de piso está buscando?"  crlf)
    (bind ?tipo-piso (pregunta-numerica "(1.Familiar 2.Estudiante 3.Jubilado 4.Otro)" 1 4))

    ;Tipo educacion (solo si tipopiso != Jubilado)
    (if (or (eq ?tipo-piso 1) (eq ?tipo-piso 2))
        then
            (printout t "¿Que tipo de educación le interesa más?"  crlf)
            (bind ?tipo-educacion (pregunta-numerica "(1.Primaria 2.Secundaria 3.Universitaria)" 1 3))
    else (bind ?tipo-educacion 0)
    )

	;Mascota
	(bind ?mascota (pregunta-si-no "¿Tiene alguna mascota?"))

    ;Tipo transporte
    (bind ?usa-transporte (pregunta-si-no "¿Suele desplazarse en transporte público?"))
    (if (eq ?usa-transporte TRUE)
        then
            (printout t "¿En qué suele desplazarse??"  crlf)
            (bind ?tipo-transporte (pregunta-numerica "(1.Metro 2.Autobus 3.Tren)" 1 3))
    else (bind ?tipo-transporte 0)
    )

	;Guardar datos del cliente
	(assert (datosCliente
			(precio-max ?precio-max)
			(precio-min ?precio-min)
			(metros-cuadrados-min ?sq-min)
			(metros-cuadrados-max ?sq-max)
            (tipo-piso ?tipo-piso)
            (tipo-educacion ?tipo-educacion)
			(tiene-mascota ?mascota)
            (tipo-transporte ?tipo-transporte)
			)
	)

    ;Preguntas referentes a las exigencias del cliente
    
    ;Numero habitaciones
    (bind ?exigencia (pregunta-si-no "¿Requiere de un mínimo número de habitaciones?"))
    (if (eq ?exigencia TRUE)
        then (bind ?num-habitaciones (pregunta-numerica "¿Cuántas?" 1 10))
    else
        then (bind ?num-habitaciones 1)
    )
    ;Numero lavabos
    (bind ?exigencia (pregunta-si-no "¿Requiere de un mínimo número de lavabos?"))
    (if (eq ?exigencia TRUE)
        then (bind ?num-lavabos (pregunta-numerica "¿Cuántos?" 1 10))
    else
        then (bind ?num-lavabos 1)
    )

    ;Equipado
    (printout t "¿Requiere que si o si este equipada?"  crlf)
    (bind ?equipado (pregunta-numerica "(1.Me da igual 2.Estaría bien 3.Tiene que estarlo 4.No puede estarlo)" 1 4))

    ;Ascensor
    (printout t "¿Requiere que si o si haya ascensor?"  crlf)
    (bind ?ascensor (pregunta-numerica "(1.Me da igual 2.Estaría bien 3.Tiene que haber 4.No puede haber)" 1 4))
    
    ;Garaje
    (printout t "¿Requiere que si o si haya garaje?"  crlf)
    (bind ?garaje (pregunta-numerica "(1.Me da igual 2.Estaría bien 3.Tiene que haber 4.No puede haber)" 1 4))

    ;Vistas
    (printout t "¿Requiere que si o si tenga buenas vistas?"  crlf)
    (bind ?vistas (pregunta-numerica "(1.Me da igual 2.Estaría bien 3.Tiene que haber 4.No puede haber)" 1 4))

    ;Piscina
    (printout t "¿Requiere que si o si haya piscina?"  crlf)
    (bind ?piscina (pregunta-numerica "(1.Me da igual 2.Estaría bien 3.Tiene que haber 4.No puede haber)" 1 4))

    ;Terraza
    (printout t "¿Requiere que si o si haya terraza?"  crlf)
    (bind ?terraza (pregunta-numerica "(1.Me da igual 2.Estaría bien 3.Tiene que haber 4.No puede haber)" 1 4))

    ;Ubicacion
    (bind ?exigencia (pregunta-si-no "¿Requiere de buscar piso en una ubicación en concreta?"))
    (if (eq ?exigencia TRUE)
        then
            (printout t "¿En que zona le gustaría buscar viviendas?"  crlf)
            (bind ?ubicacion (pregunta-numerica "(1.Centro 2.Afueras 3.Mar 4.Montaña)" 1 4))
    else
        then (bind ?ubicacion 0)
    )

    ;Guardar exigencias del cliente
    (assert (exigenciasCliente
            (num-habitaciones ?num-habitaciones)
            (num-lavabos ?num-lavabos)
            (equipado ?equipado)
            (ascensor ?ascensor)
            (garaje ?garaje)
            (vistas ?vistas)
            (piscina ?piscina)
            (terraza ?terraza)
            (ubicacion ?ubicacion) ;1=centro | 2=afueras | 3=mar | 4=montaña
            )
    )

	;Notificar crear cliente
	(retract ?puntero)
	(assert (nuevo-cliente))
)

;Buscamos viviendas adecuadas a partir de los datos del cliente
(defrule buscar-vivienda "Busqueda de vivienda"
    ?datos <- (datosCliente
        (precio-max ?pmax)
        (precio-min ?pmin)
        (metros-cuadrados-min ?sq-min)
	    (metros-cuadrados-max ?sq-max)
        (tipo-piso ?tipo-piso)
        (tipo-educacion ?tipo-educacion)
        (tiene-mascota ?mascota)
        (tipo-transporte ?tipo-transporte))

    ?exigencias <- (exigenciasCliente
        (num-habitaciones ?exig-num-habitaciones)
        (num-lavabos ?exig-num-lavabos)
        (equipado ?exig-equipado)
        (ascensor ?exig-ascensor)
        (garaje ?exig-garaje)
        (vistas ?exig-vistas)
        (piscina ?exig-piscina)
        (terraza ?exig-terraza)
        (ubicacion ?exig-ubicacion))

    ?puntero <- (nuevo-cliente)
	=>

    ;Iteramos sobre todas las instancias de viviendas
    (bind $?viviendas (find-all-instances ((?instancia Vivienda)) TRUE))
    (loop-for-count (?i 1 (length$ $?viviendas)) do                 
        
        (bind ?actual (nth$ ?i ?viviendas)) ;Vivienda actual
        (bind ?valor 0) ;valor que tendra una vivienda para un usuario

        (bind ?razonesBuenas(create$))
        (bind ?razonesMalas(create$))
        (bind ?exigFalladas(create$))

        ;Exigencia numero de habitaciones
        (if(< (send ?actual get-numeroHabitaciones) ?exig-num-habitaciones)
            then 
                (bind ?valor (- ?valor 9999))
                (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Numero de habitaciones menor que el solicitado"))
        )

        ;Exigencia numero de lavabos
        (if(< (send ?actual get-numeroLavabos) ?exig-num-lavabos)
            then 
                (bind ?valor (- ?valor 9999))
                (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Numero de lavabos menor que el solicitado"))
        )
        
        ;Exigencia equipado
        (switch ?exig-equipado
            (case 2 then (bind ?valor (+ ?valor 10)))
            (case 3 then
                (if(eq(send ?actual get-equipada) "false")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Vivienda no equipada"))
                )
            )
            (case 4 then
                (if(eq(send ?actual get-equipada) "true")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Vivienda equipada"))
                )
            )
        )

        ;Exigencia ascensor
        (switch ?exig-ascensor
            (case 2 then (bind ?valor (+ ?valor 10)))
            (case 3 then
                (if(eq(send ?actual get-ascensor) "false")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No tiene ascensor"))
                )
            )
            (case 4 then
                (if(eq(send ?actual get-ascensor) "true")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Si tiene ascensor"))
                )
            )
        )

        ;Exigencia garaje
        (switch ?exig-garaje
            (case 2 then (bind ?valor (+ ?valor 10)))
            (case 3 then
                (if(eq(send ?actual get-garaje) "false")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No tiene garaje"))
                )
            )
            (case 4 then
                (if(eq(send ?actual get-garaje) "true")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Si tiene garaje"))
                )
            )
        )

        ;Exigencia vistas
        (switch ?exig-vistas
            (case 2 then (bind ?valor (+ ?valor 10)))
            (case 3 then
                (if(eq(send ?actual get-vistas) "false")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No tiene vistas"))
                )
            )
            (case 4 then
                (if(eq(send ?actual get-vistas) "true")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Si tiene vistas"))
                )
            )
        )

        ;Exigencias piscina
        (switch ?exig-piscina
            (case 2 then (bind ?valor (+ ?valor 10)))
            (case 3 then
                (if(eq(send ?actual get-piscina) "false")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No tiene piscina"))
                )
            )
            (case 4 then
                (if(eq(send ?actual get-piscina) "true")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Si tiene piscina"))
                )
            )
        )

        ;Exigencia terraza
        (switch ?exig-terraza
            (case 2 then (bind ?valor (+ ?valor 10)))
            (case 3 then
                (if(eq(send ?actual get-terraza) "false")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No tiene terraza"))
                )
            )
            (case 4 then
                (if(eq(send ?actual get-terraza) "true")
                    then
                        (bind ?valor (- ?valor 9999))
                        (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "Si tiene terraza"))
                )
            )
        )

        ;Exigencia ubicacion
        (switch ?exig-ubicacion
            (case 1
                then
                    (bind ?ubi (send ?actual get-esta_en))
                    (if(not(eq ?ubi [centro]))
                        then
                            (bind ?valor (- ?valor 9999))
                            (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No está en el centro"))
                    )
            )
            (case 2
                then
                    (bind ?ubi (send ?actual get-esta_en))
                    (if(not(eq ?ubi [afueras]))
                        then
                            (bind ?valor (- ?valor 9999))
                            (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No está en las afueras"))
                    )
            )
            (case 3
                then
                    (bind ?ubi (send ?actual get-esta_en))
                    (if(not(eq ?ubi [mar]))
                        then 
                            (bind ?valor (- ?valor 9999))
                            (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No está en el mar"))
                    )
            )
            (case 4
                then
                    (bind ?ubi (send ?actual get-esta_en))
                    (if(not(eq ?ubi [montana]))
                        then
                            (bind ?valor (- ?valor 9999))
                            (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "No está en las montañas"))
                    )
            )
        )

        ;Asegurarnos que admitan mascotas si cliente tiene mascota
        (if(and (eq ?mascota TRUE) (eq (send ?actual get-mascotas) "false"))
            then 
                (bind ?valor (- ?valor 9999))
                (bind ?exigFalladas (insert$ ?exigFalladas (+ (length$ ?exigFalladas) 1) "La vivienda no acepta mascotas"))
        )

        ;Presupuesto
        (bind ?precio-actual (send ?actual get-precio))
        (if (and (<= ?precio-actual ?pmax) (>= ?precio-actual ?pmin))
            then (bind ?valor (+ ?valor 20))
        )
        (if (> ?precio-actual ?pmax)
            then
                (if(> ?precio-actual (+ ?pmax 200))
                    then
                        (bind ?valor (- ?valor 200))
                        (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "La vivienda es mucho más cara de lo deseada"))
                else
                    then
                        (bind ?valor (- ?valor 60))
                        (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "La vivienda es más cara de lo deseada"))
                )
        )
        (if (< ?precio-actual ?pmin)
            then
                (bind ?valor (+ ?valor 30))
                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "La vivienda es más barata de lo deseada"))
        )
        

        ;Metros cuadrados
        (bind ?medida-actual (send ?actual get-superficie))
        (if (and (<= ?medida-actual ?sq-max) (>= ?medida-actual ?sq-min))
            then (bind ?valor (+ ?valor 20))
        )
        (if (< ?medida-actual ?sq-min)
            then
                (bind ?valor (- ?valor 20))
                (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "La vivienda es más pequeña de lo deseada"))
        )
        (if (> ?medida-actual ?sq-max)
            then
                (bind ?valor (+ ?valor 30))
                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "La vivienda es más grande de lo deseada"))
        )

        (switch ?tipo-piso
            (case 1
                then
                    (bind ?n (dist-parque ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún parque cerca")))
                        (case 1 then (bind ?valor (+ ?valor 20)))
                        (case 0
                            then (bind ?valor (- ?valor 15)))
                    )
                    (bind ?n (dist-ocio ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 20))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de ocio cerca")))
                        (case 1 then (bind ?valor (+ ?valor 10)))
                        (case 0
                            then (bind ?valor (- ?valor 10)))
                    )
                    (bind ?n (dist-supermercado ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún supermercado cerca")))
                        (case 1 then (bind ?valor (+ ?valor 25)))
                        (case 0
                            then (bind ?valor (- ?valor 15)))
                    )
                    (switch ?tipo-educacion
                        (case 1
                            then
                                (bind ?n (dist-primaria ?actual))
                                (switch ?n
                                    (case 2
                                        then
                                            (bind ?valor (+ ?valor 50))
                                            (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de educación primaria cerca")))
                                    (case 1 then (bind ?valor (+ ?valor 25)))
                                    (case 0
                                        then
                                            (bind ?valor (- ?valor 50))
                                            (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún centro de educación primaria cerca")))
                                )
                        )
                        (case 2
                            then
                                (bind ?n (dist-secundaria ?actual))
                                (switch ?n
                                    (case 2 
                                        then 
                                            (bind ?valor (+ ?valor 50))
                                            (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de educación secundaria cerca")))
                                    (case 1 then (bind ?valor (+ ?valor 25)))
                                    (case 0
                                        then
                                            (bind ?valor (- ?valor 50))
                                            (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún centro de educación secundaria cerca")))
                                )
                        )
                        (case 3
                            then
                                (bind ?n (dist-universitaria ?actual))
                                (switch ?n
                                    (case 2
                                        then
                                            (bind ?valor (+ ?valor 50))
                                            (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de educación universitaria cerca")))
                                    (case 1 then (bind ?valor (+ ?valor 25)))
                                    (case 0
                                        then
                                            (bind ?valor (- ?valor 50))
                                            (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún centro de educación universitaria cerca")))

                                )
                        )
                    )
            )
            (case 2
                then
                    (bind ?n (dist-ocio ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 30))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de ocio cerca")))
                        (case 1 then (bind ?valor (+ ?valor 15)))
                        (case 0
                            then (bind ?valor (- ?valor 15)))
                    )
                    (bind ?n (dist-discoteca ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 25))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay alguna discoteca cerca")))
                        (case 1 then (bind ?valor (+ ?valor 20)))
                        (case 0
                            then (bind ?valor (- ?valor 15)))
                    )
                    (bind ?n (dist-supermercado ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún supermercado")))
                        (case 1 then (bind ?valor (+ ?valor 25)))
                        (case 0
                            then (bind ?valor (- ?valor 15)))
                    )
                    (switch ?tipo-educacion
                        (case 1
                            then
                                (bind ?n (dist-primaria ?actual))
                                (switch ?n
                                    (case 2
                                        then
                                            (bind ?valor (+ ?valor 50))
                                            (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de educación primaria cerca")))
                                    (case 1 then (bind ?valor (+ ?valor 25)))
                                    (case 0
                                        then
                                            (bind ?valor (- ?valor 50))
                                            (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún centro de educación primaria cerca")))
                                )
                        )
                        (case 2
                            then
                                (bind ?n (dist-secundaria ?actual))
                                (switch ?n
                                    (case 2 
                                        then 
                                            (bind ?valor (+ ?valor 50))
                                            (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de educación secundaria cerca")))
                                    (case 1 then (bind ?valor (+ ?valor 25)))
                                    (case 0
                                        then
                                            (bind ?valor (- ?valor 50))
                                            (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún centro de educación secundaria cerca")))
                                )
                        )
                        (case 3
                            then
                                (bind ?n (dist-universitaria ?actual))
                                (switch ?n
                                    (case 2
                                        then
                                            (bind ?valor (+ ?valor 50))
                                            (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de educación universitaria cerca")))
                                    (case 1 then (bind ?valor (+ ?valor 25)))
                                    (case 0
                                        then
                                            (bind ?valor (- ?valor 50))
                                            (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún centro de educación universitaria cerca")))

                                )
                        )
                    )
            )
            (case 3
                then
                    (bind ?n (dist-salud ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de salud cerca")))
                        (case 1 then (bind ?valor (+ ?valor 35)))
                        (case 0
                            then (bind ?valor (- ?valor 25)))
                    )
                    (bind ?n (dist-discoteca ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (- ?valor 50))
                                (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "Hay alguna discoteca cerca")))
                        (case 1 then (bind ?valor (- ?valor 10)))
                        (case 0
                            then (bind ?valor (+ ?valor 20)))
                    )
            )
            (case 4
                then
                    (bind ?n (dist-supermercado ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún supermercado cerca")))
                        (case 1 then (bind ?valor (+ ?valor 25)))
                        (case 0
                            then (bind ?valor (- ?valor 15)))
                    )
                    (bind ?n (dist-ocio ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 30))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún centro de ocio cerca")))
                        (case 1 then (bind ?valor (+ ?valor 15)))
                        (case 0
                            then (bind ?valor (- ?valor 15)))
                    )
            )
        )

        (switch ?tipo-transporte
            (case 1
                then
                    (bind ?n (dist-metro ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún metro cerca")))
                        (case 1 then (bind ?valor (+ ?valor 25)))
                        (case 0
                            then
                                (bind ?valor (- ?valor 50))
                                (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún metro cerca")))
                    )
            )
            (case 2
                then
                    (bind ?n (dist-autobus ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún autobús cerca")))
                        (case 1 then (bind ?valor (+ ?valor 25)))
                        (case 0
                            then
                                (bind ?valor (- ?valor 50))
                                (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún autobús cerca")))
                    )
            )
            (case 3
                then
                    (bind ?n (dist-tren ?actual))
                    (switch ?n
                        (case 2
                            then
                                (bind ?valor (+ ?valor 50))
                                (bind ?razonesBuenas (insert$ ?razonesBuenas (+ (length$ ?razonesBuenas) 1) "Hay algún tren cerca")))
                        (case 1 then (bind ?valor (+ ?valor 25)))
                        (case 0
                            then
                                (bind ?valor (- ?valor 50))
                                (bind ?razonesMalas (insert$ ?razonesMalas (+ (length$ ?razonesMalas) 1) "No hay ningún tren cerca")))
                    )
            )
        )

        (bind ?numRazonaBuenas (length$ ?razonesBuenas))
        (bind ?numRazonesMalas (length$ ?razonesMalas))

        ;MuyAdecuada
        (if (and (> ?valor 75) (eq ?numRazonesMalas 0))
            then (make-instance (gensym) of muyRecomendable (vivienda ?actual) (puntuacion ?valor) (cosasBuenas ?razonesBuenas))
        else
            then
                ;Adecuada
                (if (> ?valor 0)
                    then (make-instance (gensym) of Adecuada (vivienda ?actual) (puntuacion ?valor))
                else
                    then
                        ;Parcialmente Adecuada
                        (if (> ?valor -300)
                            then (make-instance (gensym) of parcialmenteAdecuada (vivienda ?actual) (puntuacion ?valor) (cosasBuenas ?razonesBuenas) (cosasMalas ?razonesMalas))
                        else
                            ;No Adecuada
                            then (make-instance (gensym) of NoAdecuada (vivienda ?actual) (puntuacion ?valor)(cosasMalas ?exigFalladas))
                        )
                )
        )
    )

    (assert (mostrar-resultado))
    (retract ?puntero)
)


;Impresion de los resultados
(deffunction print-vivienda (?vivienda)
				(printout t " "(instance-name ?vivienda) " " crlf)
				(printout t crlf)
)

(deffunction print-razones (?razones)
    (printout t crlf)
    (loop-for-count (?i 1 (length$ ?razones)) do
		(printout t " - "(nth$ ?i ?razones) crlf)
	)
	(printout t crlf)
)

(defrule mostrar-resultado "Muestra los resultados"
	?p <- (mostrar-resultado)
	=>
	;(bind ?limit (length$ (find-all-instances ((?inst Candidata)) TRUE)))
	(bind ?limit 5)
    (bind ?n 0)
	(bind ?total 0)

	(printout t crlf)

    ;Viviendas Muy Recomendables
    (bind ?soluciones (find-all-instances ((?inst muyRecomendable)) TRUE))
	(printout t crlf)
	(if (and (not (eq (length$ ?soluciones) 0)) (< ?n ?limit)) then (printout t "-------------Viviendas Muy Recomendables-------------" crlf))
	(loop-for-count (?i 1 (length$ ?soluciones)) do
		(if (< ?n ?limit) then
			(bind ?curr (nth$ ?i ?soluciones))
			(printout t crlf)
			;(printout t "-> Vivienda " (+ ?total ?i) ":")
            (printout t "-> Vivienda:")
			(print-vivienda (send ?curr get-vivienda))
            (printout t "Cosas positivas:")
            (print-razones(send ?curr get-cosasBuenas))
			(printout t "______________________________" crlf)
			(bind ?n (+ ?n 1))
		)
	)
	(bind ?total (+ ?total (length$ ?soluciones)))

    ;Viviendas Adecuadas
    (bind ?n 0)
	(bind ?soluciones (find-all-instances ((?inst Adecuada)) TRUE))
	(printout t crlf)
	(if (and (not (eq (length$ ?soluciones) 0)) (< ?n ?limit)) then (printout t "-------------Viviendas adecuadas-------------" crlf))
	(loop-for-count (?i 1 (length$ ?soluciones)) do
		(if (< ?n ?limit) then
			(bind ?curr (nth$ ?i ?soluciones))
			(printout t crlf)
            (printout t "-> Vivienda:")
			(print-vivienda (send ?curr get-vivienda))
			(printout t "______________________________" crlf)
			(bind ?n (+ ?n 1))
		)
	)
	(bind ?total (+ ?total (length$ ?soluciones)))

    ;Viviendas parcialmente adecuadas
    (bind ?n 0)
    (bind ?soluciones (find-all-instances ((?inst parcialmenteAdecuada)) TRUE))
	(printout t crlf)
	(if (and (not (eq (length$ ?soluciones) 0)) (< ?n ?limit)) then (printout t "-------------Viviendas Parcialmente Adecuadas-------------" crlf))
	(loop-for-count (?i 1 (length$ ?soluciones)) do
		(if (< ?n ?limit) then
			(bind ?curr (nth$ ?i ?soluciones))
			(printout t crlf)
            (printout t "-> Vivienda:")
			(print-vivienda (send ?curr get-vivienda))
            (printout t "Cosas positivas:")
            (print-razones(send ?curr get-cosasBuenas))
            (printout t "Cosas negativas:")
            (print-razones(send ?curr get-cosasMalas))
			(printout t "______________________________" crlf)
			(bind ?n (+ ?n 1))
		)
	)
	(bind ?total (+ ?total (length$ ?soluciones)))

    ;Viviendas no adecuadas
    (bind ?n 0)
	(bind ?soluciones (find-all-instances ((?inst NoAdecuada)) TRUE))
	(printout t crlf)
	(if (and (not (eq (length$ ?soluciones) 0)) (< ?n ?limit)) then (printout t "-------------Viviendas No Adecuadas-------------" crlf))
	(loop-for-count (?i 1 (length$ ?soluciones)) do
		(if (< ?n ?limit) then
			(printout t crlf)
			(bind ?curr (nth$ ?i ?soluciones))
            (printout t "-> Vivienda:")
			(print-vivienda (send ?curr get-vivienda))
            (printout t "Exigencias no cumplidas:")
            (print-razones(send ?curr get-cosasMalas))
			(printout t "______________________________" crlf)
			(bind ?n (+ ?n 1))
		)
	)
	
	(printout t crlf)
	(printout t "¡Muchas gracias por usar nuestro sistema!" crlf)
	(printout t crlf)
	(retract ?p)
)