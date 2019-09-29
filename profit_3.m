function profit = profit_3(S,K,K1,rate,sigma,period)
%y stock shares
%x at-the-money opt shares
c0=blsprice(S(1),K,rate,1,sigma);
cT=max(S(366)-K,0);
T=transpose(1:-1/365:1/365);
chedge=blsprice(S(1:365),K1,rate,T,sigma);
chedge=[chedge;max(S(366)-K1,0)];
delta=blsdelta(S(1:365),K,rate,T,sigma); %delta is a 365*1 vector
delta1=blsdelta(S(1:365),K1,rate,T,sigma);
gamma=blsgamma(S(1:365),K,rate,T,sigma); 
gamma1=blsgamma(S(1:365),K1,rate,T,sigma);
x=zeros(365,1);
y=zeros(365,1);
for a=1:365
h=[delta1(a),1;gamma1(a),1]\[delta(a);gamma(a)];
x(a)=h(1);
y(a)=h(2);
end
for dt=1:period:366
    x_new=x(1:period:365);
    y_new=y(1:period:365);
    T_new=T(1:period:365);
    if mod(365,period)~=0
        S_new=S([1:period:366,366]);
        chedge_new=chedge([1:period:366,366]);
    else
        S_new=S(1:period:366);
        chedge_new=chedge(1:period:366);
    end
    middle_cost=sum(chedge_new(2:end-1).*diff(x_new).*exp(rate.*T_new(2:end)))...
        +sum(S_new(2:end-1).*diff(y_new).*exp(rate.*T_new(2:end)));
    origin_cost=-c0+x(1)*chedge(1)+y(1)*S(1);
    last_return=-cT+x(end)*chedge(end)+y(end)*S(end);
    profit=last_return-origin_cost-middle_cost;
end 
end

