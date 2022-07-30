import javafx.util.Pair;
import sun.management.Sensor;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

public class SquareStation implements  Station {
    private FileWriter file;
    private ArrayList<Pair<Double,Double>> events;
    private ArrayList<Pair<Double,Double>> sensors;

    private ArrayList<Double> theorM;
    private ArrayList<Double> theorT;
    private ArrayList<Double> practM;
    private ArrayList<Double> practT;

    private byte[] slots;
    private int[] sizeEventInWindow;
    private int quanExperiment;
    private int quanSensor;
    private int quanSlots;
    private double lambda;
    private double win;
    private int L;
    private int radius;

    public SquareStation(double l, double w, int qExp, int qSen, int qSlot, int l1, int r1) throws IOException {
        lambda = l;
        win = w;
        L = l1;
        radius = r1;
        quanSensor = qSen;
        quanExperiment = qExp;
        quanSlots = qSlot;
        events = new ArrayList<>();
        sensors = new ArrayList<>();

        (theorT = new ArrayList<>()).add(new Double(0));
        (theorM = new ArrayList<>()).add(new Double(0));
        (practT = new ArrayList<>()).add(new Double(0));
        (practM = new ArrayList<>()).add(new Double(0));

        file = new FileWriter("part1.txt");
    }

    public void genEventSize(){
        double t = 0;
        for(int i = 0; i < quanExperiment; i++) {
            while (true) {
                double r  = Math.random();
                t += (- Math.log(r) / lambda);
                if (t <= i + 1){
                    sizeEventInWindow[i]++;
                } else {
                    while (t > i + 1 && i<quanExperiment) i++;
                    sizeEventInWindow[i-1]++;
                    break;
                }
            }
            i--;
        }
    }

    public void genSensors() {
        for (int i = 0; i < quanSensor; i++) {
            sensors.add(genPoint(true));
        }
    }

    public void genEvent(int n){
        for (int i = 0; i < sizeEventInWindow[n]; i++) {
            events.add(genPoint(false));
        }
    }

    public Pair<Double,Double> genPoint(boolean f){
        Random r = new Random();
        double x = 0;
        double y = 0;
        if(f){
            x = Math.random() * (L + radius + 1);
            y = Math.random() * (L + radius + 1);
            while (x < radius) x += Math.random();
            while (y < radius) y += Math.random();
            while (x > L + radius) x -= Math.random();
            while (y > L + radius) y -= Math.random();
            return new Pair<Double,Double>(x,y);
        }
        else {
            x = Math.random() * (2 * radius + L);
            y = Math.random() * (2 * radius + L);
            while (x > 2 * radius + L) x -= Math.random();
            while (y > 2 * radius + L) y -= Math.random();
            return new Pair<Double,Double>(x,y);
        }
    }

    public int countAllEvent(){
        int n = 0;
        for (int i = 0; i < sensors.size(); i++){
            for (int j = 0; j < events.size(); j++) {
                if (inCircle(sensors.get(i),events.get(j))) {
                    n++;
                    break;
                }
            }
        }
        return n;
    }

    public double countSeccesEvent(){
        double n = 0;
        for (int i = 0; i < sensors.size(); i++){
            for (int j = 0; j < events.size(); j++) {
                if (inCircle(sensors.get(i),events.get(j))) {
                    int numberOfSlot = new Random().nextInt(slots.length);
                    if (slots[numberOfSlot]==0){
                        slots[numberOfSlot] = 1;
                        n++;
                    } else if (slots[numberOfSlot] == 1){
                        n--;
                        slots[numberOfSlot] = 2;
                    }
                    break;
                }
            }
        }
        return n;
    }

    public boolean inCircle (Pair<Double,Double> s, Pair<Double,Double> e) {
        return (Math.pow((s.getKey()-e.getKey()),2) + Math.pow((s.getValue() - e.getValue()),2)) <= (radius * radius);
    }

    public double fi(int i){
        return 1-Math.pow(((L*L + 4*L*radius)/(Math.PI*radius*radius + L*L + 4*L*radius)),i);
    }

    public int factorial(int n){
        int res = 1;
        for (int i = 2; i<= n; i++){
            res *= i;
        }
        return res;
    }

    public void theor1(){

        double pr2 = 0;
        double pr1 = 0;
        double f = 0;
        for (int i = 100; i <= 7000; i+=100){
            pr2 = 0;
            for (int j = 1; j <= 80; j++) {
                f = fi(j);
                pr1 = i*(f/quanSlots)*Math.pow(1-(f/quanSlots),i-1);
                double chis = Math.pow(lambda,j);
                for(double z = 2; z <= j; z++){
                    chis /= z;
                }
                pr2 += chis*Math.exp(-lambda)*pr1;
            }
            pr2 *= quanSlots;
            theorT.add(pr2);
        }
    }


    public void imit1(double l){
        lambda = l;
        double sum;
        for (quanSensor = 100; quanSensor <= 7000; quanSensor += 100){
            sizeEventInWindow = new int[quanExperiment];
            genEventSize();
            genSensors();
            sum = 0;
            for (int time = 0; time < quanExperiment; time++){
                slots = new byte[quanSlots];
                genEvent(time);
                sum += countSeccesEvent();
                events.clear();
            }
            sum /= quanExperiment;
            practT.add(sum);
            sensors.clear();
        }
        theor1();
    }

    public void imit4(int s) {
        quanSensor = s;
        genSensors();
        double sum;
        for (lambda = 1; lambda <= 30; lambda++){
            sizeEventInWindow = new int[quanExperiment];
            genEventSize();
            sum = 0;
            for (int time = 0; time < quanExperiment; time++){
                genEvent(time);
                sum += countAllEvent();
                events.clear();
            }
            sum /= quanExperiment;
            practM.add(sum);
            theorM.add((1 - (Math.exp((-lambda/((2 * radius + L)*(2 * radius + L)))*Math.PI*radius*radius)))*quanSensor);
        }
    }

    public void printResult() throws IOException {
        for (int i=0; i< theorT.size();i++) {
            file.write(theorT.get(i) + " " + practT.get(i) + "\n");
        }
        file.flush();
        file.close();
        file = new FileWriter("part11.txt");
        for (int i=0; i< theorM.size();i++) {
            file.write(theorM.get(i) + " " + practM.get(i) + "\n");
        }
        file.flush();
        file.close();
    }
}
