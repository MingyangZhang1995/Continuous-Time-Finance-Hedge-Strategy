function profit = profit_42(S,K,rate,fsigma,period)
%use current sigma
c0=blsprice(S(1),K,rate,1,rms(fsigma(linspace(0,1,9999))));
cT=max(S(366)-K,0);
T=transpose(1:-1/365:1/365);
sigma=rms(fsigma(linspace(0,1,9999)));
delta=blsdelta(S(1:365),K,rate,T,sigma); %delta is a 365*1 vector
for dt=1:period:366
    delta_new=delta(1:period:365);
    T_new=T(1:period:365);
    if mod(365,period)~=0
        S_new=S([1:period:366,366]);
    else
        S_new=S(1:period:366);
    end
    middle_cost=sum(S_new(2:end-1).*diff(delta_new).*exp(rate.*T_new(2:end)));
    origin_cost=-c0+delta(1)*S(1);
    last_return=-cT+delta(end)*S(end);
    profit=last_return-origin_cost-middle_cost;
end
end
