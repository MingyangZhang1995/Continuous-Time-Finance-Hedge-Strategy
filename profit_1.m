function profit = profit_1(S,K,rate,sigma,period)
%this function return a percentage return of a portfolio.
%t time period to change portfolio
%S is a 366*1 vextor
%enter period as unit of day
%(1)calculate all the delta for each stock price
c0=blsprice(S(1),K,rate,1,sigma);
cT=max(S(366)-K,0);
T=transpose(1:-1/365:1/365);
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

