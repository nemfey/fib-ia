package src;

import aima.search.framework.GoalTest;

public class GasolineraGoalTest implements GoalTest{
    
    @Override
    public boolean isGoalState(Object state){
           return false;    //Siempre devolvera falso porque es busqueda local
    }
}
