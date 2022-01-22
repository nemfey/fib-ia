package src;

import java.util.ArrayList;

import IA.Gasolina.Gasolinera;
import IA.Gasolina.Gasolineras;
import IA.Gasolina.Distribucion;
 
public class Truck
{
    private ArrayList<Gasolinera> list_gasolineras = new ArrayList<>();
    private ArrayList<Integer> list_petitions_added = new ArrayList<>();
    private int km;  //Km restantes
    private int nTravels;  //Viajes restantes
    private Gasolinera truck_g; //ultima gasolinera visitada; por defecto null
    private Distribucion truck_c;   //centro original del camion
    private boolean inDistribution; //estamos en el centro de distribucion¿?
    
    //Constructoras, Getters & Setters
    public Truck(int km, int nTravels, Distribucion location_c) {
        this.km = km;
        this.nTravels = nTravels;
        this.truck_g = null;
        this.truck_c = location_c;
        this.inDistribution = true;
    }
    
    //GETTERS
    public ArrayList<Gasolinera> getList_gasolineras() {
        return list_gasolineras;
    }
    public ArrayList<Integer> getList_petitions_added() {
        return list_petitions_added;
    }
    public int getKm() {    
        return km;
    }
    public int getnTravels() {
        return nTravels;
    }
    public Distribucion getTruck_c() {
        return truck_c;
    }
    
    //SETTERS
    public void setList_gasolineras(ArrayList<Gasolinera> list_gasolineras) {
        this.list_gasolineras = list_gasolineras;
    }
    public void setList_petitions_added(ArrayList<Integer> list_petitions_added) {
        this.list_petitions_added = list_petitions_added;
    }
    public void setKm(int km) {
        this.km = km;
    }
    public void setnTravels(int nTravels) {
        this.nTravels = nTravels;
    }

    
    public void initial_state(boolean first_fit, Gasolineras gs, MapState state) {
        while(nTravels >0) {
            if(first_fit) {
                find_gasolinera_firstfit(gs, state);
                find_gasolinera_firstfit(gs, state);
            }
            else {
                find_gasolinera_near(gs, state);
                find_gasolinera_near(gs, state);
            }
            //Vuelve al centro
            if(truck_g!=null) {
            km = km - dist_centro_gasolinera(state,truck_g);
            }
            inDistribution = true;
            --nTravels;
        }
    }
    
    public void find_gasolinera_firstfit(Gasolineras gs, MapState state) {
        boolean found = false;
        //Recorremos todas las gasolineras
        for(int i=0; i<gs.size() && !found; ++i) {
            boolean petEmpty = gs.get(i).getPeticiones().isEmpty();
            //Vamos a las que tengan peticiones y sean accesibles
            if(!petEmpty && can_travel(gs.get(i), state)) {
                km = km - km_travelled(gs.get(i),state);
                truck_g = gs.get(i);
                
                list_gasolineras.add(gs.get(i));
                list_petitions_added.add(gs.get(i).getPeticiones().get(0));
                
                gs.get(i).getPeticiones().remove(0); //Elimina la peticion
                
                inDistribution = false;
                found = true;
            }
        }
    }
    
    public void find_gasolinera_near(Gasolineras gs, MapState state) {
        Gasolinera g_min = null;
        int d_min, d_aux;
        d_min = 10000;
        boolean first = true;
        //Recorremos todas las gasolineras
        for(int i=0; i<gs.size(); ++i) {
            boolean petEmpty = gs.get(i).getPeticiones().isEmpty();
            //Vamos a las que tengan peticiones y sean accesibles
            if(!petEmpty && can_travel(gs.get(i), state)) {
                d_aux = km_travelled(gs.get(i),state);
                
                if(first) {
                    g_min = gs.get(i);
                    d_min = d_aux;
                    first = false;
                }
                if(d_aux < d_min) {
                    d_min = d_aux;
                    g_min = gs.get(i);
                }
            }
        }
        if(g_min != null) {
            km = km - d_min;
            truck_g = g_min;
            list_gasolineras.add(g_min);
            list_petitions_added.add(g_min.getPeticiones().get(0));
            g_min.getPeticiones().remove(0); //Elimina la peticion
            inDistribution = false; 
        }
    }
    
    //FUNCIONES AUXILIARES
    public int dist_centro_gasolinera(MapState state, Gasolinera g) {
        int i, j;
        i = state.getDistribution_id().get(truck_c);
        j = state.getGasolineras_id().get(g);
        return state.getDist_cg()[i][j];
    }
    
    public int dist_gasolinera_gasolinera(MapState state, Gasolinera g1, Gasolinera g2) {
        int i, j;
        i = state.getGasolineras_id().get(g1);
        j = state.getGasolineras_id().get(g2);
        return state.getDist_gg()[i][j];
    }
  
    public boolean can_travel(Gasolinera g, MapState state) {
        //truck -> gasolinera
        int dist_tg = km_travelled(g,state);
        //gasolinera -> centro
        int dist_gc = dist_centro_gasolinera(state,g);
        
        //nos aseguramos que si es el ultimo viaje podra volver
        return km - dist_tg - dist_gc > 0;
    }
    
    public int km_travelled(Gasolinera g, MapState state) {
        int d;
        if(inDistribution) d = dist_centro_gasolinera(state,g);
        else d = dist_gasolinera_gasolinera(state,truck_g,g);
        
        return d;
    }   
}