using LineaAlgebra

function nadji_pocetno_SZU(C,I,O)
    m,n=size(C)
    sumaI=sum(I)
    sumaO=sum(O)
    
    if(sumaI>sumaO)
      O=[0 sumaI-sumaO]
      C=[C; zeros(m,1)]
      m=m+1
    elseif(sumaI<sumaO)
      I=[0 sumaO-sumaI]
      C=[C; zeros(1,n)]
      n=n+1
    
    end
    
    A=zeros(m,n)
    
    i=1
    j=1
    
    while(i<=m && j<=n)
      if(I[i]<O[j])
        A[i,j]=I[i]
        O[j]=O[j]-I[i]
        I[i]=0
        i=i+1
        
      elseif(I[i]>O[j])
       A[i,j]=O[j]
       I[i]=I[i]-O[j]
       O[j]=0 
       j=j+1
    
      else
        A[i,j]=I[i]
        I[i]=0
        O[j]=0
        j=j+1
        i=i+1
      end
    end
    
    return A, sum(A.*C)
    end
    
    C=[8 9 4 6; 6 9 5 3; 5 6 7 4]
    I=[100 120 140]
    O=[90 125 80 65]
    A,suma=nadji_pocetno_SZU(C,I,O)
    println("funkcija cilja ",suma)
    println("matrica ")
    A
    
    
    
    
    