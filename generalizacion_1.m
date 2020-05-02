clear;close all;clc;
load('pesos_r5');
numeros=["cero","uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve"];
[entradas,n]=size(x_gen);
vo=zeros(ne_o,1);
yo=zeros(ne_o,1);
vs=zeros(ne_s,1);
ys=zeros(ne_s,1);
con=0;
for i=1:n
    xi=[1; x_gen(:,i)];
    vo=wo'*xi;
    yo=tanh(vo);
    xs=[1;yo];
    vs=ws'*xs;
    ys=1./(1+exp(-vs));
    [~,ind1]=max(yd_gen(:,i));
    [~,ind2]=max(ys);
    if ind1==ind2
       con=con+1;
    end
    a=[numeros(ind1),numeros(ind2)];
    disp(a);
end
porcen=(con*100)/n;
disp(porcen);