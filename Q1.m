mu_list=linspace(0.04,0.48,5);
sigma_list=linspace(0.04,0.24,5);
S0=100;
K=100;
rate=0.02;
variance=zeros(10,6);
meanvalue=zeros(10,6);
period_list=[1,7,30,60,90,180];
for j=1:10
    if j<=5
        mu=mu_list(j);
        sigma=sigma_list(3);
    else
        mu=mu_list(3);
        sigma=sigma_list(j-5);
    end 
for b=1:size(period_list,2)
    period=period_list(b);
    portfolio_r=zeros(1000,1);
    for a=1:1000
        S=stockprice_1year(mu,sigma,S0);
        portfolio_r(a)=profit_1(S,K,rate,sigma,period);
    end
    variance(j,b)=var(portfolio_r);
    meanvalue(j,b)=mean(portfolio_r);
end 
end
muchange=transpose(variance(1:5,:));
sigmachange=transpose(variance(6:10,:));
plot(period_list,muchange)
legend('\mu=4%','\mu=15%','\mu=26%','\mu=37%','\mu=48%')
plot(period_list,sigmachange)
legend('\sigma=4%','\sigma=9%','\sigma=14%','\sigma=19%','\sigma=24%')




