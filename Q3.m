%gamma hedging of n share of far-out-of-the-money opt with spot and another opt.
%spot=stock
%another opt= at-the-money opt. K1 represents strike price.
%n need to be high enough otherwise result may be inaccurate.
mu_list=linspace(0.12,0.24,5);
sigma_list=linspace(0.12,0.24,5);
S0=100;
K=105;
K1=100;
rate=0.02;
variance=zeros(10,6);
meanvalue=zeros(10,6);
period_list=[1,7,30,60,90,180];
for j=1:10
    if j<=5
        mu=mu_list(j);
        sigma=sigma_list(1);
    else
        mu=mu_list(1);
        sigma=sigma_list(j-5);
    end 
for b=1:size(period_list,2)
    period=period_list(b);
    portfolio_r=zeros(1000,1);
    for a=1:1000
        S=stockprice_1year(mu,sigma,S0);
        portfolio_r(a)=profit_3(S,K,K1,rate,sigma,period);
    end
    meanvalue(j,b)=mean(portfolio_r);
    variance(j,b)=var(portfolio_r);
end 
end
