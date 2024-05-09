%function to calculate ABCD

function [A,B,C,D]=calc_abcd(capacitance_per_km,inductance_per_km,resistance_dc,conductor_length,type,f) %user take capacitance/km and inductance/km and resistance/km,length by km and type
l=inductance_per_km*conductor_length;            %multiply inductance_per_km with length
c=capacitance_per_km*conductor_length;           %multiply capacitance_per_km with length
xl=2*pi*f*l;      %inductive reactance
resistance_AC=resistance_dc*1.1;
z=(resistance_AC+i*xl); %impedance equation
y=2*pi*f*c*i;    %admidance equation

if(conductor_length<80) %short line
      A=1;
      B=z;
      C=0;
      D=1;
     
     
    
 
elseif(conductor_length>=80 &&conductor_length<=250 ) %medium line
    
     % the user  enters the type of medium line pi or T
   
    
    switch(type)
        case "Pi_model"  % pi model
             A=1+((z*y)/2);
             B=z;
             C=y*(1+(z*y)/4);
             D=1+((z*y)/2);
            
        case "T_model" %T model
            A=1+((z*y)/2); 
            B=z*(1+(z*y)/4);
            C=y;
            D=1+((z*y)/2);
        otherwise
          A=0 ;
          B=0;
          C=0;
          D=0;
        end
 else
    disp('invalid length');
end
end