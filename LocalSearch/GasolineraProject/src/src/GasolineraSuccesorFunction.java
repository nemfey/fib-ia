package src;

import IA.Gasolina.Gasolinera;
import aima.search.framework.SuccessorFunction;
import aima.search.framework.Successor;
import java.util.ArrayList;
import java.util.List;

public class GasolineraSuccesorFunction implements SuccessorFunction {
    
    @Override
    public List getSuccessors(Object inputState){
        
        ArrayList retval = new ArrayList();
        
        MapState state = (MapState) inputState;
        
        String action;
        Truck t1, t2;
        
        //swapeo de gasolineras entre distintos camiones
        for(int i=0; i<state.getList_trucks().size(); ++i) {
            t1 = state.getList_trucks().get(i);
            for(int j=0; j<state.getList_trucks().size(); ++j) {
                t2 = state.getList_trucks().get(j);
                if(i!=j) {
                    for(int k=0; k<t1.getList_gasolineras().size(); ++k) {
                        for(int l=0; l<t2.getList_gasolineras().size(); ++l) {
                            ArrayList<Truck> newList_trucks = copyList_trucks(state);
                            MapState newMapstate = new MapState(newList_trucks, state.getDistribution_id(),
                                    state.getGasolineras_id(), state.getPetitions(), state.getDist_gg(), state.getDist_cg());
                            
                            t1 = newMapstate.getList_trucks().get(i);
                            t2 = newMapstate.getList_trucks().get(j);
                            newMapstate.swap_gasolineras_trucks(t1, t1.getList_gasolineras().get(k), t2, t2.getList_gasolineras().get(l));
                            
                            if (newMapstate.isValid_state()) {
                                action = "gasolinera "+k+" del truck "+i+" <-> gasolinera "+l+" del truck "+j;
                                retval.add(new Successor(action, newMapstate));
                            }
                        }
                    }
                }
            }
            //Aplicacion segundo operador
            for(int j=0; j<t1.getList_gasolineras().size(); ++j) {
                for(Gasolinera g : state.getGasolineras_id().keySet()) {
                    if(t1.getList_gasolineras().get(j)!=g) {
                        ArrayList<Truck> newList_trucks = copyList_trucks(state);
                        MapState newMapstate = new MapState(newList_trucks, state.getDistribution_id(),
                                state.getGasolineras_id(), state.getPetitions(), state.getDist_gg(), state.getDist_cg());
                        
                        t1 = newMapstate.getList_trucks().get(i);
                        Gasolinera gt = t1.getList_gasolineras().get(j);
                        newMapstate.swap_gasolineras_map(t1,gt,g);
                        
                        if (newMapstate.isValid_state()) {
                            action = "gasolinera "+j+" del truck "+i+" <-> gasolinera "+newMapstate.getGasolineras_id().get(g);
                            retval.add(new Successor(action, newMapstate));
                        }
                    }
                }
            }
        }
        return retval;
    }
    
    public static ArrayList<Truck> copyList_trucks(MapState state) {
        ArrayList<Truck> list = new ArrayList<>();
        for(int i=0; i<state.getList_trucks().size(); ++i) {
            list.add(copyTruck(state.getList_trucks().get(i)));
        }
        return list;
    }
    
    public static Truck copyTruck(Truck t) {
        ArrayList<Gasolinera> list_gs = new ArrayList<>();
        for(int i=0; i<t.getList_gasolineras().size(); ++i) {
            list_gs.add(t.getList_gasolineras().get(i));
        }
        ArrayList<Integer> list_pet = new ArrayList<>();
        for(int i=0; i<t.getList_petitions_added().size(); ++i) {
            list_pet.add(t.getList_petitions_added().get(i));
        }
        Truck aux = new Truck(t.getKm(), t.getnTravels(), t.getTruck_c());
        aux.setList_gasolineras(list_gs);
        aux.setList_petitions_added(list_pet);
        return aux;
    }
}