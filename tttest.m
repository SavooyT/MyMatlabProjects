function newSig = tttest(rawSig)
    
    % 分子系数
    Nume=[2.39927447302976e-10, 2.15934702572678e-09, 8.63738810290713e-09, 2.01539055734500e-08, 3.02308583601750e-08,   3.02308583601750e-08, 2.01539055734500e-08, 8.63738810290713e-09, 2.15934702572678e-09, 2.39927447302976e-10];

    % 分母系数
    Deno=[1, -7.96, 28.23, -58.48, 78.03, -69.53, 41.37, -15.85, 3.55, -0.35];
    
    %   y(n) = b(1)*x(10) + b(2)*x(9) + b(3)*x(8) + ... + b(10)*x(1) → 10 个
    %                        - a(2)*y(9) - a(3)*y(8) - ... - a(10)*y(1) →  9 个
    
    L=length(rawSig);
    newSig=rawSig;
    
    for i=10:L
	    
	    NumeCalc=0;
	    DenoCalc=0;
	    
	    for j=1:10
		    NumeTmp = Nume(j)*newSig(i-j+1);
		    NumeCalc = NumeCalc + NumeTmp;
	    end
    
	    for k=2:10
		    DenoTmp = Deno(k)*newSig(i-k+1);
		    DenoCalc = DenoCalc + DenoTmp;
	    end
	    
	    newSig(i) = NumeCalc - DenoCalc;
    
    end

end