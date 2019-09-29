function profit= profit_2(S,K,rate,sigma,period)
c0=blsprice(S(1),K,rate,1,sigma);
cT=max(S(366)-K,0);
x=zeros(366,1); % x=1 means buy stock, x=-1 means sell stock, x=0 means do nothing
T=(linspace(1,0,366))';
df=exp(rate.*T);
for a=1:period:366
    if a+period<=366
    if S(a)<K && S(a+period)>K
        x(a+period)=1;
    elseif S(a)>K && S(a+period)<K
        x(a+period)=-1;
    end
    end
end
switch x(end)
    case 0
        if sum(x)==1
            x(end)=-1;
        end
    case 1
        x(end)=0;
end
    profit=c0*exp(rate)-cT-sum(x.*S.*df);    
end

