
function nadji_minimum(a,b)
  min=Inf
  index=1
  for i=1:size(a,1)
    if(b[i]==0 && a[i]<=min)
      index=i
      min=a[i]
    end
  end
  return index
end


function najkraci_put(M,prvi)
  x,y=size(M)(
  putevi=[[i for i=1:x] fill(Inf,x) fill(prvi,x) fill(0,x)]
  putevi[prvi,2]=0
  putevi[prvi,3]=prvi

  println(putevi)

  while(sum(putevi[:,4])<x)
    u=nadji_minimum(putevi[:,2],putevi[:,4])
    
    println(u)

    putevi[u,4]=1
    for i=1:x
      if(putevi[i,4]==0 && M[u,i]>0 && putevi[u,2]<=Inf && putevi[u,2]+M[u,i]<putevi[i,4])
        putevi[i,2]=putevi[u,2]+M[u,i]
        putevi[i,3]=u
      end
    end
  end
  println(putevi)
  return putevi[:,1:end-1]
end

M=[0 6 2 0 0 0; 0 0 3 3 0 0; 0 5 0 0 1 0; 0 0 4 0 0 3; 0 1 0 0 0 2; 0 6 2 0 0 0];
najkraci_put(M,1)
