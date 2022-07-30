import javafx.util.Pair;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Random;

public class CircleStation {
    private ArrayList<Double> events;
    private ArrayList<Double> fixSensors;
    private ArrayList<Double> randomSensors;
    private ArrayList<Double> seccessRandomSensorsPr;
    private ArrayList<Double> seccessFixSensorsPr;
    private ArrayList<Double> theorTlist;
    private ArrayList<Double> randomSensorT;
    private ArrayList<Double> fixSensorT;
    private int[] slots;
    private int[] sizeEventInWindow;
    private int quanExperiment;
    private int quanSensor;
    private int quanSlots;
    private double lambda;
    private double[] pr;
    private double epsilon;
    private double radius;
    private double sizeEvent;
    private int time = 0;
    private FileWriter file;

    public CircleStation(double l, int qSlot, int qExp) throws IOException {
        lambda = l;
        quanSlots = qSlot;
        quanExperiment = qExp;
        events = new ArrayList<>();
        fixSensors = new ArrayList<>();
        randomSensors = new ArrayList<>();
        (seccessRandomSensorsPr = new ArrayList<>()).add((double) 0);
        (seccessFixSensorsPr = new ArrayList<>()).add((double) 0);
        (theorTlist = new ArrayList<>()).add((double) 0);
        (randomSensorT = new ArrayList<>()).add((double) 0);
        (fixSensorT = new ArrayList<>()).add((double) 0);
        file = new FileWriter("part2.txt");
        radius = 0.005;
        epsilon = 2 * radius;
        quanSlots = (int) ((1 - Math.exp(-lambda * epsilon)) / epsilon);
        radius = 0.005 * 360;
        epsilon = 2 * radius;
    }

    public void theorT() {
        radius = 0.005;
        epsilon = 2 * radius;
        double c = (1 - Math.exp(-lambda * epsilon)) / quanSlots;
        for (int i = 10; i <= 2000; i += 10) { //настроить рост сенсоров под эпсилон
            double n = quanSlots * i * c * Math.pow(1 - c, i - 1);
            theorTlist.add(n);
        }
    }

    public void genPointOfEvents() {
        for (int i = 0; i < sizeEventInWindow[time]; i++) {
            events.add(360 * Math.random());
        }
    }

    public void genPointOfSensors() {
        double n = 360 / (double) quanSensor;
        for (int i = 0; i < quanSensor; i++) {
            fixSensors.add(i * n);
            randomSensors.add(360 * Math.random());
        }
    }



    public void genEventSize2() {
        if (pr == null) {
            pr = new double[100];
            pr[0] = Math.exp(-lambda);
            for (int i = 1; i < pr.length; i++) {
                pr[i] = pr[i - 1] * lambda / i;
            }
        }
        sizeEvent = 0;
        sizeEventInWindow = new int[quanExperiment];
        for (int i = 0; i < quanExperiment; i++) {
            double p = Math.random();
            double sum = 0;
            for (int j = 0; j < pr.length; j++) {
                sum += pr[j];
                if (p < sum) {
                    sizeEventInWindow[i] = j;
                    break;
                }
            }
        }
        for (int i = 0; i < quanExperiment; i++) sizeEvent += sizeEventInWindow[i];
    }

    public double countSeccesEventPr(ArrayList<Double> list) {
        int number;
        ArrayList<Integer>[] listEventInSensors = new ArrayList[quanSensor];
        LinkedHashSet<Integer> set = new LinkedHashSet<>();
        slots = new int[quanSlots];
        for (int i = 0; i < listEventInSensors.length; i++) {
            listEventInSensors[i] = new ArrayList<>();
            for (int j = 0; j < events.size(); j++) {
                if (inSensor(list.get(i), events.get(j))) {
                    listEventInSensors[i].add(j);
                }
            }
            if (listEventInSensors[i].size() > 0) {
                number = new Random().nextInt(slots.length);
                if (slots[number] == 0) {
                    slots[number] = i + 1;
                } else slots[number] = -1;
            }
        }
        int n = 0;
        for (int i = 0; i < slots.length; i++) if (slots[i] > 0) set.addAll(listEventInSensors[slots[i] - 1]);
        return set.size();
    }

    public boolean inSensor(double p1, double p2) {
        return Math.abs(p1 - p2) <= radius || 360 - Math.abs(p1 - p2) <= radius;
    }


    public double countSeccesEvent2(ArrayList<Double> list) {
        int number;
        ArrayList<Integer>[] listEventInSensors = new ArrayList[quanSensor];
        slots = new int[quanSlots];
        for (int i = 0; i < listEventInSensors.length; i++) {
            listEventInSensors[i] = new ArrayList<>();
            for (int j = 0; j < events.size(); j++) {
                if (inSensor(list.get(i), events.get(j))) {
                    listEventInSensors[i].add(j);
                    break;
                }
            }
            if (listEventInSensors[i].size() > 0) {
                number = new Random().nextInt(slots.length);
                if (slots[number] == 0) {
                    slots[number] = i + 1;
                } else slots[number] = -1;
            }

        }
        int n = 0;
        for (int i = 0; i < slots.length; i++) if (slots[i] > 0) n++;
        return n;
    }

    public void printResult() throws IOException {
        for (int i = 0; i < theorTlist.size(); i++) {
            file.write(theorTlist.get(i) + " " + fixSensorT.get(i) + " " + randomSensorT.get(i) + " " + seccessFixSensorsPr.get(i) + " " + seccessRandomSensorsPr.get(i) + "\n");
        }
        file.flush();
        file.close();
    }

    public void imit() {
        double sumFixPr;
        double sumRandomPr;
        double sumFixT;
        double sumRandomT;
        for (quanSensor = 10; quanSensor <= 2000; quanSensor += 10) {
            genEventSize2();
            genPointOfSensors();
            sumFixPr = 0;
            sumRandomPr = 0;
            sumFixT = 0;
            sumRandomT = 0;
            for (time = 0; time < quanExperiment; time++) {
                genPointOfEvents();
                sumFixPr += countSeccesEventPr(fixSensors);
                sumRandomPr += countSeccesEventPr(randomSensors);
                sumFixT += countSeccesEvent2(fixSensors);
                sumRandomT += countSeccesEvent2(randomSensors);
                events.clear();
            }
            sumFixPr /= sizeEvent;
            sumRandomPr /= sizeEvent;
            sumFixT /= quanExperiment;
            sumRandomT /= quanExperiment;
            seccessFixSensorsPr.add(sumFixPr);
            seccessRandomSensorsPr.add(sumRandomPr);
            randomSensorT.add(sumRandomT);
            fixSensorT.add(sumFixT);
            fixSensors.clear();
            randomSensors.clear();
        }
        theorT();
    }
}

   /* public void genEventSize() {
        sizeEvent = 0;
        sizeEventInWindow = new int[quanExperiment];
        double t = 0;
        for (int i = 0; i < quanExperiment; i++) {
            while (true) {
                double r = Math.random();
                t += (-Math.log(r) / lambda);
                if (t <= i + 1) {
                    sizeEventInWindow[i]++;
                } else {
                    while (t > i + 1 && i < quanExperiment) i++;
                    sizeEventInWindow[i - 1]++;
                    break;
                }
            }
            i--;
        }
        for (int i = 0; i < quanExperiment; i++) sizeEvent += sizeEventInWindow[i];
        System.out.println(sizeEvent);
    }