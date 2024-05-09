function [VReg,efficency]= performance(A,B,C,D,VR_line,choice)
switch(choice)
    case 1
    PR = 0:100;
    powerfactor = 0.8;
    VoltageMatrix = zeros( size(PR) );
    EfficiencyMatrix = zeros( size(PR) );
    VR_line=1000*VR_line;
    for z = 1 : length(PR) 
        S = PR(z)*1000 / powerfactor;
        VR = VR_line/sqrt(3);
        IR = (S ./ (3 * VR)) * exp(1i * ( -1 * acos(powerfactor)));
        VS = A * VR + B * IR;
        IS = C * VR + D * IR;
        PS = (3 * (abs(VS)) .* (abs(IS)) .* (cos( angle(VS) - angle(IS) )));
        V_noload= abs(VS) .* sqrt(3)/abs(A);
        VoltageMatrix(z) = (abs(V_noload) - abs(VR_line))./abs(VR_line) * 100;
        EfficiencyMatrix(z) = (PR(z)*1000/abs(PS)) * 100;
    end
    
    figure;
    subplot(1,2,1);
    plot(PR, EfficiencyMatrix);
    xlabel('Active Power');
    ylabel('Efficiency');
    title('Efficiency vs Active Power');
    subplot(1,2,2);
    plot(PR, VoltageMatrix);
    xlabel('Active Power');
    ylabel('Voltage Regulation');
    title('Voltage Regulation vs Active Power');
    
    case 2
    PR =100000;
    powerfactor =0.3:0.01:1;
    lagVoltageMatrix = zeros( size(powerfactor) );
    lagEfficiencyMatrix = zeros( size(powerfactor) );
    leadVoltageMatrix = zeros( size(powerfactor) );
    leadEfficiencyMatrix = zeros( size(powerfactor) );
    VR_line=1000*VR_line;
    for z = 1:length(powerfactor) 
        S = PR / powerfactor(z);
        VR = VR_line/sqrt(3);
        IR = (S / (3 * VR)) * exp(1i * ( -1 * acos(powerfactor(z))));
        VS = A * VR + B * IR;
        IS = C * VR + D * IR;
        PS = (3 * (abs(VS)) * (abs(IS)) * (cos( angle(VS) - angle(IS) )));
        V_noload= abs(VS) * sqrt(3)/abs(A);
        lagVoltageMatrix(z) = (abs(V_noload) - abs(VR_line))/abs(VR_line) * 100;
        lagEfficiencyMatrix(z) = (PR/abs(PS)) * 100;
    end
    for z = 1:length(powerfactor)
        S = PR /powerfactor(z);
        VR = VR_line/sqrt(3);
        IR = (S / (3 * VR)) * exp(1i * ( 1 * acos(powerfactor(z))));
        VS = A * VR + B * IR;
        IS = C * VR + D * IR;
        PS = (3 * (abs(VS)) * (abs(IS)) * (cos( angle(VS) - angle(IS) )));
        V_noload= abs(VS) * sqrt(3)/abs(A);
        leadVoltageMatrix(z) = (abs(V_noload) - abs(VR_line))/abs(VR_line) * 100;
        leadEfficiencyMatrix(z) = (PR/abs(PS)) * 100;
    end

    figure;
    subplot(2,2,1);
    plot(powerfactor, lagEfficiencyMatrix);
    xlabel('lag pf');
    ylabel('Efficiency');
    title('Efficiency vs lag pf');
    subplot(2,2,2);
    plot(powerfactor, lagVoltageMatrix);
    xlabel('lag pf');
    ylabel('Voltage Regulation');
    title('Voltage Regulation vs lag pf');
    subplot(2,2,3);
    plot(powerfactor, leadEfficiencyMatrix);
    xlabel('lead pf');
    ylabel('Efficiency');
    title('Efficiency vs lead pf');
    subplot(2,2,4);
    plot(powerfactor, leadVoltageMatrix);
    xlabel('lead pf');
    ylabel('Voltage Regulation');
    title('Voltage Regulation vs lead pf');
    
    
    
end
end