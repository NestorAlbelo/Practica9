require "Matrices.rb"  

  class MatricesDen < Matrices
    
    def initialize(ancho,*elements)
      super
      @matriz= Array.new(ancho)
      for j in 0...ancho
	@matriz[j]=Array.new(ancho)
      end
      for i in 0...ancho
	for k in 0...ancho
	  @matriz[i][k]=elements[i*ancho+k]
	end
      end
	
    end
    
    def +(other)
      	resultado= MatricesDen.new(@ancho)
      if (other.instance_of?MatricesDen)
	for i in 0...@ancho
	  for j in 0...@ancho
	      resultado[i][j]=@matriz[i][j]+other.matriz[i][j]
	  end
	end
      else 
	if (other.instance_of? MatricesDis)
	  for i in 0...@ancho
	    for j in 0...@ancho
	      resultado[i][j]=@matriz[i][j]+0
	    end
	  end
	  while (l<@ancho)
	    j=other.matriz[i+1]%other.ancho
	    i=other.matriz[i+1]/other.ancho
	    resultado[i][j]=@matriz[i][j]+other.matriz[l]
	    l+=2
	  end
	end
      end
      resultado
    end
    
    def - (other)
	resultado= MatricesDen.new(@ancho)
      if (other.instance_of? MatricesDen)
	for i in 0...@ancho
	  for j in 0...@ancho
	      resultado[i][j]=@matriz[i][j]-other.matriz[i][j]
	  end
	end
      else 
	if (other.instance_of? MatricesDis)
	  for i in 0...@ancho
	    for j in 0...@ancho
	      resultado[i][j]=@matriz[i][j]-0
	    end
	  end
	  while (l<@ancho)
	    j=other.matriz[i+1]%other.ancho
	    i=other.matriz[i+1]/other.ancho
	    resultado[i][j]=@matriz[i][j]-other.matriz[l]
	    l+=2
	  end
	end
      end
      resultado
    end
   
    def * (other)
      resultado= MatricesDen.new(@ancho)
      for i in 0...@ancho
	for j in 0...@ancho
	  resultado[i][j]=0
	end
      end
      if (other.instance_of? MatricesDen)
	for i in 0...@ancho
	  for j in 0...@ancho
	    for k in 0...@ancho
	      resultado[i][j]+=@matriz[i][k]*other.matriz[k][j]
	    end
	  end
	end
      else
	if (other.instance_of? MatricesDis)
	l=0
	  while (i < @ancho)
	    while (j < @ancho)
	      while (k < @ancho)
		if (((other.matriz[l+1]%other.ancho)==k) && ((other.matriz[l+1]/other.ancho)==j))
		  resultado[i][j]+=@matriz[i][k]*other.matriz[l]
		  l+=2
		else
		  resultado[i][j]+=@matriz[i][k]*0
		end #if
	      end #whilek
	   end #whilej
	 end #whilei
	end #elseif
      end #ifexterior
      resultado				
   end

    def -@
      resultado= MatricesDen.new(@ancho)
      for i in 0...@ancho
	for j in 0...@ancho
	  resultado[i][j]=-@matriz[i][j]
	end
      end
      resultado
    end
  
    def == (other)
      if (other.instance_of? MatricesDis)
	return false
      end  
      for i in 0...@ancho
	for j in 0...@ancho
	    if(matriz[i][j]!=other.matriz[i][j])
	      return false
	    end
	end
      end
      return true
    end
    

    def max
      maxtem=-99999999999999
      for i in 0...@ancho
	for j in 0...@ancho
	  if (@matriz[i][j] > maxtem)
	    maxtem=@matriz[i][j]
	  end
	end
      end
      return maxtem
    end
    
    def min
      mintem=+99999999999999
      for i in 0...@ancho
	for j in 0...@ancho
	  if (@matriz[i][j] < mintem)
	    mintem=@matriz[i][j]
	  end
	end
      end
      return mintem
    end
    
end	
