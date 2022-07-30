import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        //лямбда, окно, эксперименты, сенсоры, слоты, сторона поля, радиус
       SquareStation a = new SquareStation(0,1, 1000, 1000, 150, 100,  15);
        a.imit1(5); //лямбда
        a.imit4(1000); //число сенсоров
        a.printResult();
        /*CircleStation b = new CircleStation(50,150,1000);
        b.imit();
        b.printResult();*/
    }
}
