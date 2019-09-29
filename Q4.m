mu=0.1;
%fsigma=@(t)(sin(4*pi*t)/4).^2;
fsigma=@(t)exp(-6*t)/4+0.05;
S0=100;
K=100;
rate=0.02;
variance1=zeros(1,6);
variance2=zeros(1,6);
variance3=zeros(1,6);
period_list=[1,7,30,60,90,180];
for b=1:size(period_list,2)
    period=period_list(b);
    portfolio_r1=zeros(1000,1);
    portfolio_r2=zeros(1000,1);
    portfolio_r3=zeros(1000,1);
    for a=1:1000
        S=stockprice_1year_timedsigma(mu,fsigma,S0);
        portfolio_r1(a)=profit_41(S,K,rate,fsigma,period);
        portfolio_r2(a)=profit_42(S,K,rate,fsigma,period);
        portfolio_r3(a)=profit_43(S,K,rate,fsigma,period);
    end
    variance1(1,b)=var(portfolio_r1);
    variance2(1,b)=var(portfolio_r2);
    variance3(1,b)=var(portfolio_r3);
end 
