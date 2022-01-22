package src;

import IA.Gasolina.Gasolineras;
import IA.Gasolina.Gasolinera;
import IA.Gasolina.CentrosDistribucion;

import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Scanner;

public class GasolineraMain {

    public static void makeIds(CentrosDistribucion cd, Gasolineras gs, MapState state) {
        for(int i=0; i<cd.size(); ++i) {
            state.getDistribution_id().put(cd.get(i),i);
        }
        for(int i=0; i<gs.size(); ++i) {
            state.getGasolineras_id().put(gs.get(i), i);
        }
    }
  
    public static void makeDistances(CentrosDistribucion cd, Gasolineras gs, MapState state) {
        int dist_g[][] = new int[gs.size()][gs.size()];
        
        for(int i=0; i<gs.size(); ++i) {
            for(int j=0; j<=i; ++j) {
                if(i==j) dist_g[i][j] = 0;
                int aux = calcula_distancia(gs.get(i).getCoordX(), gs.get(i).getCoordY(), gs.get(j).getCoordX(), gs.get(j).getCoordY());
                dist_g[i][j] = aux;
                dist_g[j][i] = aux;
            }
        }
        state.setDist_gg(dist_g);
        
        int dist_cg[][] = new int[cd.size()][gs.size()];
        for(int i=0; i<cd.size(); ++i) {
            for(int j=0; j<gs.size(); ++j) {
                dist_cg[i][j] = calcula_distancia(cd.get(i).getCoordX(), cd.get(i).getCoordY(), gs.get(j).getCoordX(), gs.get(j).getCoordY());
            }
        }
        state.setDist_cg(dist_cg);
    }
    
    public static void savePetitions(Gasolineras gs, MapState state) {
        state.setPetitions(new ArrayList<>());
        for(int i=0; i<gs.size(); ++i) {
            ArrayList<Integer> aux = new ArrayList<>();
            for(int j=0; j<gs.get(i).getPeticiones().size(); ++j) {
                aux.add(gs.get(i).getPeticiones().get(j));
            }
            state.getPetitions().add(aux);
        }
    }
 
    public static int calcula_distancia(int x, int y, int a, int b) {
        a = x - a;
        if(a<0) a = -a;
        b = y -b;
        if(b<0) b = -b;
        
        return a+b;
    }
    
    public static ArrayList<Gasolinera> copy_gasolineras(Gasolineras gs) {
        ArrayList<Gasolinera> aux = new ArrayList<>();
        for(int i=0; i<gs.size(); ++i) {
            aux.add(gs.get(i));
        }
        return aux;
    }
    
    
    public static void main(String[] args) throws Exception {
        Scanner entrada = new Scanner(System.in);
        
        System.out.println("Introduzca la seed del problema: ");
        int seed = entrada.nextInt();
        
        System.out.println("Introduzca el numero de centros y la multiplicidad de estos: ");
        int ncentros = entrada.nextInt();
        int mult = entrada.nextInt();
        
        System.out.println("Introduzca el numero de gasolineras: ");
        int ngasolineras = entrada.nextInt();
        
        System.out.println("Introduzca la estrategia de inicilización: ");
        System.out.println("1. Estrategia pseudo-aleatoria");
        System.out.println("2. Estrategia greedy");
        int aux = entrada.nextInt();
        //boolean first_fit = false;    //Por defecto estrategia greedy
        boolean first_fit = aux==1;
        
        System.out.println("Introduzca el algoritmo de Búsqueda Local a utilizar: ");
        System.out.println("1. Hill Climbing");
        System.out.println("2. Simulated Annealing");
        aux = entrada.nextInt();
        boolean hillClimbing;
        int it = 1000;
        int it_temp = 100;
        int k = 5;
        double lambda = 0.1;
        if(aux==1) hillClimbing = true;
        else {
            hillClimbing = false;
            
            System.out.println("Introduzca los 4 parámetros del Simulated Anneling: ");
            it = entrada.nextInt();
            it_temp = entrada.nextInt();
            k = entrada.nextInt();
            lambda = entrada.nextDouble();
        }
        
        System.out.println("Calculando beneficio...");
        
        
        
        CentrosDistribucion cd = new CentrosDistribucion(ncentros,mult,seed);
        Gasolineras gs = new Gasolineras(ngasolineras,seed);
        
        ArrayList<Truck> list_trucks = new ArrayList<>();
        Truck truck;
        for(int i=0; i<cd.size(); ++i) {
            truck = new Truck(640,5,cd.get(i));
            list_trucks.add(truck);
        }
        
        MapState state = new MapState(list_trucks,new HashMap<>(),new HashMap<>(),new ArrayList<>(),
                                        new int[cd.size()][gs.size()],new int[gs.size()][gs.size()]);
        makeIds(cd,gs,state);
        savePetitions(gs,state);
        makeDistances(cd,gs,state);
        
        state.setList_trucks(list_trucks);
        state.setStrategy(first_fit,gs,state);
        
        if(hillClimbing) search_hillClimbing(state);
        else search_simulatedAnnealing(state,it,it_temp,k,lambda); 
    }
    
    private static void printInstrumentation(Properties properties) {
        Iterator keys = properties.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            String property = properties.getProperty(key);
            System.out.println(key + ": " + property);
        }

    }
    
    private static void printActions(List actions) {
        for (int i = 0; i < actions.size(); i++) {
            String action = (String) actions.get(i);
            System.out.println(action);
        }
    }
    
    private static void search_hillClimbing(MapState state) throws Exception {
        long time = System.currentTimeMillis();
        Problem p = new Problem(state,
                                new GasolineraSuccesorFunction(),
                                new GasolineraGoalTest(),
                                new GasolineraHeuristicFunction());
        Search search = new HillClimbingSearch();
        SearchAgent agent = new SearchAgent(p, search);
        
        MapState newState = (MapState)search.getGoalState();
        time =  System.currentTimeMillis() - time;
        
        printActions(agent.getActions());
        System.out.println("--------------------");
        System.out.println("Beneficio obtenido: "+-newState.heuristic());
        System.out.println("Tiempo requerido: "+time+" ms");
        printInstrumentation(agent.getInstrumentation());
    }
    
    private static void search_simulatedAnnealing(MapState state, int it, int it_temp, int k, double lambda) throws Exception {
        long time = System.currentTimeMillis();
        Problem p = new Problem(state,
                                new GasolineraSuccesorFunction(),
                                new GasolineraGoalTest(),
                                new GasolineraHeuristicFunction());
        //Search search = new SimulatedAnnealingSearch(1000,100,5,0.1);
        Search search = new SimulatedAnnealingSearch(it,it_temp,k,lambda);
        SearchAgent agent = new SearchAgent(p, search);
        
        MapState newState = (MapState)search.getGoalState();
        time =  System.currentTimeMillis() - time;
        
        System.out.println("--------------------");
        System.out.println("Beneficio obtenido: "+-newState.heuristic());
        System.out.println("Tiempo requerido: "+time+" ms");
        printInstrumentation(agent.getInstrumentation());
    }
}
