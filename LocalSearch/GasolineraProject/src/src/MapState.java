package src;

import java.util.ArrayList;
import java.util.Map;

import IA.Gasolina.Distribucion;
import IA.Gasolina.Gasolinera;
import IA.Gasolina.Gasolineras;

public class MapState {
    private ArrayList<Truck> list_trucks = new ArrayList<>();
    private Map<Distribucion,Integer> distribution_id;
    private Map<Gasolinera,Integer> gasolineras_id;
    
    private ArrayList<ArrayList<Integer>> petitions;
    
    private int dist_gg[][]; //Matrix de distancias entre gasolineras
    private int dist_cg[][]; //Matrix de distancias entre centros y gasolineras

    //CONSTRUCTORA
    public MapState(ArrayList<Truck> list_trucks, Map<Distribucion,Integer> distribution_id,
                    Map<Gasolinera,Integer> gasolineras_id, ArrayList<ArrayList<Integer>> petitions,
                    int[][] dist_gg, int[][] dist_cg) {
        this.list_trucks = list_trucks;
        this.distribution_id = distribution_id;
        this.gasolineras_id = gasolineras_id;
        this.petitions = petitions;
        this.dist_gg = dist_gg;
        this.dist_cg = dist_cg;
    }
    
    //GETTERS
    public ArrayList<Truck> getList_trucks() {
        return list_trucks;
    }
    public Map<Distribucion, Integer> getDistribution_id() {
        return distribution_id;
    }
    public Map<Gasolinera, Integer> getGasolineras_id() {
        return gasolineras_id;
    }
    public ArrayList<ArrayList<Integer>> getPetitions() {
        return petitions;
    }
    public int[][] getDist_gg() {
        return dist_gg;
    }
    public int[][] getDist_cg() {
        return dist_cg;
    }
    
    //SETTERS
    public void setList_trucks(ArrayList<Truck> list_trucks) {
        this.list_trucks = list_trucks;
    }
    public void setDistribution_id(Map<Distribucion, Integer> distribution_id) {
        this.distribution_id = distribution_id;
    }
    public void setGasolineras_id(Map<Gasolinera, Integer> gasolineras_id) {
        this.gasolineras_id = gasolineras_id;
    }
    public void setPetitions(ArrayList<ArrayList<Integer>> petitions) {
        this.petitions = petitions;
    }
    public void setDist_gg(int[][] dist_gg) {
        this.dist_gg = dist_gg;
    }
    public void setDist_cg(int[][] dist_cg) {
        this.dist_cg = dist_cg;
    }
    
    
    //OPERADORES DE ESTADO 
    //Truck t1 contains g1 and Truck t2 contains g2
    public void swap_gasolineras_trucks(Truck t1, Gasolinera g1, Truck t2, Gasolinera g2) {
        int g1Index, g2Index;
        g1Index = t1.getList_gasolineras().indexOf(g1);
        g2Index = t2.getList_gasolineras().indexOf(g2);
        
        t1.getList_gasolineras().remove(g1);
        t2.getList_gasolineras().remove(g2);
        
        t1.getList_gasolineras().add(g1Index,g2);
        t2.getList_gasolineras().add(g2Index,g1);
    }
    //Truck t1 contains g1 and g2 has a petition without trucks asigned
    public void swap_gasolineras_map(Truck t, Gasolinera g1, Gasolinera g2) {
        int g1Index;
        if(!g2.getPeticiones().isEmpty()) {
            g1Index = t.getList_gasolineras().indexOf(g1);

            t.getList_gasolineras().remove(g1);
            g1.getPeticiones().add(t.getList_petitions_added().get(g1Index));

            t.getList_gasolineras().add(g1Index,g2);
            g2.getPeticiones().remove(0);
        }
    }
    
    //FUNCIONES AUXILIARES
    public void setStrategy(boolean first_fit, Gasolineras gs, MapState state) {
        for(int i=0; i<list_trucks.size(); ++i) {
            list_trucks.get(i).initial_state(first_fit, gs, state);
        }
    }
    
    public boolean isValid_state() {
        Truck t;
        boolean valid = true;
        for(int i=0; i<list_trucks.size() && valid; ++i) {
            t = list_trucks.get(i);
            int km = 640;
            int index_k, index_l;
            index_k = distribution_id.get(t.getTruck_c());
            
            for(int j=0; j<t.getList_gasolineras().size()-1 && valid; ++j) {
                index_l = gasolineras_id.get(t.getList_gasolineras().get(j));
                km = km - dist_cg[index_k][index_l];
                if(j%2==0) {
                    int index_m = gasolineras_id.get(t.getList_gasolineras().get(j+1));
                    km = km-dist_gg[index_l][index_m];
                }
                
                if(km<0) valid = false;
            }
            if(valid) t.setKm(km); //Si es valido se actualizan los km
        }
        return valid;
    }
    
    //AIMA  
    public double heuristic() {
        GasolineraHeuristicFunction h = new GasolineraHeuristicFunction();
        return h.getHeuristicValue(this);
    }
    
    public boolean is_goal() {
        return false;
    }
}
