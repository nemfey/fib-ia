package src;

import aima.search.framework.HeuristicFunction;
        

public class GasolineraHeuristicFunction implements HeuristicFunction{
    
    @Override
    public double getHeuristicValue(Object state) {
        return calulateValueByDistancesAndDelays(state);
        //return calculateValueByDistances(state);
    }
    
    private double calculateValueByDistances(Object state) {
        MapState map = (MapState) state;
        double money_saved = 0;
        for(int i=0; i<map.getList_trucks().size(); ++i) {
            money_saved += (2*(640-map.getList_trucks().get(i).getKm()));
        }
        return money_saved;
    }

    private double calulateValueByDistancesAndDelays(Object state) {
        MapState map = (MapState) state;
        return -benefit(map);
    }

    public static double benefit(MapState state) {
        double gain = 0;
        int days, g1Index, km;
        km = 0;
        
        Truck t;
        for (int i = 0; i < state.getList_trucks().size(); ++i){
            t = state.getList_trucks().get(i);
            for (int j = 0; j < t.getList_gasolineras().size(); ++j){
                g1Index = t.getList_gasolineras().indexOf(t.getList_gasolineras().get(j));
                days = t.getList_petitions_added().get(g1Index);
                if (days==0) gain += 1020;
                else gain += 10*(100-Math.pow(2,days));
            }
            km += (640-t.getKm());
        }
        return (gain - 2*km);
    }
}
