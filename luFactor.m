ys
function [L, U, P] = luFactor(A)


P=eye(size(A));%creates identity matrix

%column 1
D=length(A(:,1)); %finds the columns 
W=length(A(1,:)); %finds number of rows
L=zeros(W,D);
if D~=W
    error('not a valid martix')
end
for j=1:W-1  
        
    
    [~,M]=max(abs(A(j+1:W,j))); %checks for the greatest coefficient in columns 1->j and stores as M
    M=M+j-1;
    
    pivotA= A(M,:);%shows the row that will be pivoted
    pivotp=P(M,:);%shows the pivot matrix row that will be pivoted
    pivotL=L(M,:);
    
    %%%%%%%%Pivoting P matrix 
    P(M,:)=P(j,:);%takes the pivot row and sets it as the first row. 
    P(j,:)=pivotp %Takes the origional top row and replaces it to pivot row postition

    %%%%%%%pivoting A Matrix
    A(M,:)=A(j,:);%takes the pivot row, and sets it to the first row 
    A(j,:)=pivotA %takes the origional top row, and sets it to the pivot row   
    
    %%%%%%%%%Pivot L matrix
    L(M,:)=L(M,:);
    L(j,:)=pivotL
    for i=j+1:D %runs the calculations down the rows %keeps running up to 4 instead of 3 so i added the -1
        
        %keeping track of coefficients 
        %elimination for rows 
        coef=A(i,j)/A(j,j) %calculates coefficient 
        rownew=coef*(A(j,:))-(A(i,:)) %multiplies coefficient by the first row %chnged a - infront of corf and a + infront of (A(i,:))
        A(i,:)=rownew;
        L(i,j)=coef 
        
    end 
end
A=A
U=A
L=L+eye(size(A)) 
P=P
  end



  
  
  
  
  
  