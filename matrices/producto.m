function r=producto(A,B)
  A_row=length(A(:,1));
  A_col=length(A(1,:));
  B_row=length(B(:,1));
  B_col=length(B(1,:));
  if(A_col==B_row)
    r=zeros(A_row,B_col);
    total=0;
    for i=1:A_row
        for j=1:B_col
            for z=1:A_col
                total = total + A(i,z) * B(z,j);
            end    
            r(i,j) =total;
            total=0;
        end
    end
  else
    error("no se puede multiplicar \n");  
  end
endfunction
