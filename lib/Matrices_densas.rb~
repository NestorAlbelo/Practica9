require "Matrices.rb" 
require "Matrices_dispersas.rb" 

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
	      			resultado.matriz[i][j]=@matriz[i][j]+other.matriz[i][j]
	  			end
			end
     	else 
			if (other.instance_of?MatricesDis)
	  			for i in 0...@ancho
	    			for j in 0...@ancho
	      				resultado[i][j]=@matriz[i][j]+0
	    			end
	  			end
	  			l=0
	  			while l<other.matriz.length
	    			j=other.matriz[l+1]%other.ancho
	    			i=other.matriz[l+1]/other.ancho
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
	      			resultado.matriz[i][j]=@matriz[i][j]-other.matriz[i][j]
	  			end
			end
      	else 
			if (other.instance_of? MatricesDis)
	  			for i in 0...@ancho
	    			for j in 0...@ancho
	      				resultado.matriz[i][j]=@matriz[i][j]-0
	    			end
	  			end
	  			l=0
	  			while (l<other.matriz.length)
	    			j=other.matriz[l+1]%other.ancho
	    			i=other.matriz[l+1]/other.ancho
	    			resultado.matriz[i][j]=@matriz[i][j]-other.matriz[l]
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
	 			resultado.matriz[i][j]=0
			end
      	end
      	if (other.instance_of? MatricesDen)
			for i in 0...@ancho
	  			for j in 0...@ancho
	    			for k in 0...@ancho
	      				resultado.matriz[i][j]+=@matriz[i][k]*other.matriz[k][j]
	    			end
	  			end
			end
     	else
			if (other.instance_of? MatricesDis)				
				i=j=k=0
	  			while (i < @ancho)
					j=0
	   				while (j < @ancho)
						k=0	      					
						while (k < @ancho)
							l=0
							while (l<other.matriz.length)
								if (((other.matriz[l+1]%other.ancho)==j) && ((other.matriz[l+1]/  other.ancho)==k))
		  							resultado.matriz[i][j]+=@matriz[i][k]*other.matriz[l]
							
								end #if
								l+=2
							end
							k+=1
	      					end #whilek
	      					j+=1
	   				end #whilej
	   				i+=1
	 			end #whilei
			end #elseif
      	end #ifexterior
      	 resultado				
   	end

    def -@
      	resultado= MatricesDen.new(@ancho)
      	for i in 0...@ancho
			for j in 0...@ancho
	  			resultado.matriz[i][j]=-@matriz[i][j]
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
