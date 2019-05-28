function ind=ordersign(a,b,c)
% ORDERSIGN Order signature
% ind = ordersign(a,b,c)
%
% It calculates the order signature of the 3-note pitch sequence (a,b,c).
%
% INPUT
% (a,b,c): 3-note pitch sequence
%       
% OUTPUT
% ind: Order signature (1,2,3,?,13)
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

    if a<b
        if b<c
            ind=1;
        elseif b==c
            ind=2;
        elseif b>c
            if a<c
                ind=3;
            elseif a==c
                ind=4;
            elseif a>c
                ind=5;
            end
        end
    elseif a==b
        if b<c
            ind=6;
        elseif b==c
            ind=7;
        elseif b>c
            ind=8;
        end
    elseif a>b
        if a<c
            ind=9;
        elseif a==c
            ind=10;
        elseif a>c
            if b<c
                ind=11;
            elseif b==c
                ind=12;
            elseif b>c
                ind=13;
            end
        end
    end
end