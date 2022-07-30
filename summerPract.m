%part2
file = load('C:\Users\Соня\Desktop\Summer\part2.txt');
theorT = file(:,1);
fixT = file(:,2);
randT = file(:,3);
fixPr = file(:,4);
randPr = file(:,5);
n = 0:10:2000;

figure(1);
plot(n,theorT,'Linewidth',2);
hold on;
plot(n,fixT,'.','MarkerSize',20);
hold on;
plot(n,randT,'--','Linewidth',2);

legend("theorT","fixT","randT");
xlabel('N');
ylabel('T');


figure(2);
plot(n,fixPr,'--','Linewidth',2);
hold on;
plot(n,randPr,'--','Linewidth',2);

legend("fixPr","randPr");
xlabel('N');
ylabel('Pr');

