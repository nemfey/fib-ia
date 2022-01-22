# PracticaIA3
Para ejectuar el programa seguir los siguientes pasos:

- Descomprimir zip dentro de la carpeta MetricFF para poder ejecutar los comandos adecuados a pddl

- Ejectuar desde la carpeta de Metric (y no la del proyecto) el siguiente comando para ejecutar :
         ./ff -O -o PracticaIA3/*nivel*/domain.pddl -f PracticaIA3/*nivel*/problem.pddl
         
         o sino:
         
         ./ff -O -o PracticaIA3/*nivel*/domain.pddl -f PracticaIA3/tests/testing ejecuciones/*ficheroProblema*
         
         *nivel* hace referencia a la extension que queremos ejecutar: nivelBasico, ext1, ext2, ext3, ext4
         *ficheroProblema* hace referencia al problema que queramos usar como fichero problema (tiene que corresponder al dominio que estemos usando
         
- Para generar un fichero de problema con el generador ejectuar desde la carpeta del proyecto los siguientes comandoos y seguir las instrucciones del programa:
          
         g++ -o generador generador.cc
         
         ./generador
         
- Para ejecutar el programa con un fichero de problema generado con el generador ejecutar desde la carpeta Metric el siguiente comando:

          ./ff -O -o PracticaIA3/*nivel*/domain.pddl -f PracticaIA3/problem.pddl
          
          *nivel* tiene que correspoder al dominio del problema generador previamente
