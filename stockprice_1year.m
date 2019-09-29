function S = stockprice_1year(mu,sigma,S0)
S=zeros(366,1);
S(1)=S0;
for a=2:366
    ds=mu*S(a-1)*1/365+sigma*sqrt(1/365)*S(a-1)*randn;
    S(a)=S(a-1)+ds;
end 
end

