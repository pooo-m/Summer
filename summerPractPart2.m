%part1
file = load('C:\Users\Соня\Desktop\Summer\part1.txt');
file1 = load('C:\Users\Соня\Desktop\Summer\part11.txt');
theorT = file(:,1);
practT = file(:,2);
theorM = file1(:,1);
practM = file1(:,2);
lambda = 0:30;
N = 0:100:7000;

figure(1);
plot(N,theorT,'Linewidth',2);
hold on;
plot(N,practT,'--','Linewidth',2);
legend("theorT","practT");
xlabel('N');
ylabel('T');

figure(2);
plot(lambda,theorM,'Linewidth',2);
hold on;
plot(lambda,practM,'--','Linewidth',2);
legend("theorM","practM");
xlabel('lambda');
ylabel('M');
