#include <iostream>
#include <fstream>
#include<time.h>
using namespace std;

ofstream rellenar(string extension){
    ofstream file;
    file.open("problem.pddl");
    file << "(define (problem problem" << extension << ")\n\n";
    file << "	(:domain " << extension << ")\n";
    file << "	(:objects\n		";
    cout << "\nNúmero de habitaciones: ";
    int habitaciones;
    cin >> habitaciones;
    for (int i = 0; i < habitaciones; ++i){
        if (i == habitaciones-1) file << "room" << i << " - room\n";
        else file << "room" << i << ' ';
    }
    file << "		";
    cout << "Número de solicitudes: ";
    int solicitudes;
    cin >> solicitudes;
    for (int i = 0; i < solicitudes; ++i){
        if (i == solicitudes-1) file << "booking" << i << " - booking\n";
        else file << "booking" << i << ' ';
    }
    file << "	)\n\n";
    file << "	(:init\n\n";
    srand(time(NULL));
    int num1, num2;
    
    if (extension == "nivelBasico"){
        file << "		;INICIALIZACIÓN\n";
        for (int j = 0; j < solicitudes; ++j){
            file << "		(not (served booking" << j << "))\n";
        }

        file << "\n		;SOLICITUDES\n";
        for (int j = 0; j < solicitudes; ++j){
            num1 = 1+rand()%(5-1);
            file << "		(= (peopleBooking booking" << j << ") "<< num1 << ")\n";
            num1 = 1+rand()%(30-1);
		    file << "		(= (iniDay booking" << j << ") "<< num1 << ")\n";
            num2 = 1+rand()%(31-1);
            while (num2 <= num1) num2 = 1+rand()%(31-1);
		    file << "		(= (finDay booking" << j << ") "<< num2 << ")\n\n";
        }
        file << "		;ROOMS\n";
        for (int j = 0; j < habitaciones; ++j){
            num1 = 1+rand()%(5-1);
            file << "		(= (peopleRoom room" << j << ") "<< num1 << ")\n";
        }
    }

    else if (extension == "ext1" || extension == "ext3" || extension == "ext4"){
        file << "		;SOLICITUDES\n";
        for (int j = 0; j < solicitudes; ++j){
            num1 = 1+rand()%(5-1);
            file << "		(= (peopleBooking booking" << j << ") "<< num1 << ")\n";
            num1 = 1+rand()%(30-1);
		    file << "		(= (iniDay booking" << j << ") "<< num1 << ")\n";
            num2 = 1+rand()%(31-1);
            while (num2 <= num1) num2 = 1+rand()%(31-1);
		    file << "		(= (finDay booking" << j << ") "<< num2 << ")\n\n";
        }
        file << "		;ROOMS\n";
        for (int j = 0; j < habitaciones; ++j){
            num1 = 1+rand()%(5-1);
            file << "		(= (peopleRoom room" << j << ") "<< num1 << ")\n";
        }

        file << "\n		(= (penalitation) 0)\n";
    }

    else if (extension == "ext2"){
        file << "		;SOLICITUDES\n";
        for (int j = 0; j < solicitudes; ++j){
            num1 = 1+rand()%(5-1);
            file << "		(= (peopleBooking booking" << j << ") "<< num1 << ")\n";
            num1 = 1+rand()%(5-1);
            file << "		(= (orientationBooking booking" << j << ") "<< num1 << ")\n";
            num1 = 1+rand()%(30-1);
		    file << "		(= (iniDay booking" << j << ") "<< num1 << ")\n";
            num2 = 1+rand()%(31-1);
            while (num2 <= num1) num2 = 1+rand()%(31-1);
		    file << "		(= (finDay booking" << j << ") "<< num2 << ")\n\n";
        }

        file << "		;ROOMS\n";
        for (int j = 0; j < habitaciones; ++j){
            num1 = 1+rand()%(5-1);
            file << "		(= (peopleRoom room" << j << ") "<< num1 << ")\n";
            num1 = 1+rand()%(5-1);
            file << "		(= (orientationRoom room" << j << ") "<< num1 << ")\n\n";
        }

        file << "\n		(= (penalitation) 0)\n";
    }

    file << "\n	)\n\n";
    file <<	"	(:goal\n";
	file << "		(forall (?bking - booking) (served ?bking))\n";
	file << "	)\n";

    if (extension != "nivelBasico"){
        file << "\n	(:metric minimize (penalitation))\n";
    }
    file << ")";
    cout << "\n[problem.pddl generado con éxito]" << endl;
    return file;
}

int menu(){
    int seleccion;
    cout << "¿Para qué extensión generaremos el problema?\n" << endl;
    cout << "------OPCIONES-----" << endl;
    cout << "[0] nivelBasico" << endl;
    cout << "[1] ext1" << endl;
    cout << "[2] ext2" << endl;
    cout << "[3] ext3" << endl;
    cout << "[4] ext4" << endl;
    cout << "\nSelección: ";
    cin >> seleccion;
    if (seleccion == 0 || seleccion == 1 || seleccion == 2 || seleccion == 3 || seleccion == 4) return seleccion;
    else {
        cout << "ERROR:Escoge un número válido\n" << endl;
        return menu();
    }
}

int main(){
    
    int sel = menu();

    string ext;

    switch (sel)
    {
    case 0:
        ext = "nivelBasico";
        break;

    case 1:
        ext = "ext1";
        break;

    case 2:
        ext = "ext2";
        break;

    case 3:
        ext = "ext3";
        break;

    case 4:
        ext = "ext4";
        break;

    default:
        break;
    }

    ofstream file = rellenar(ext);
    file.close();
}