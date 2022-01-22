Para poder ejecutar el proyecto, introducir las siguientes líneas en CLIPS, donde path es el path absoluto hasta los ficheros

(reset)
(clear)
(load *path*\MiOntologia.pont)
(load-instances *path*\MiOntologia.pins)
(load *path*\reglas.clp)
(assert(initial-fact))
(run)


*********
segun la version de CLIPS puede ser no necesaria la linea (assert(initial-fact))