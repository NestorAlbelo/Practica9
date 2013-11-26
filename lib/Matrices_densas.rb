require "Matrices.rb" 
require "Matrices_dispersas.rb" 

# = Clase Martriz densas.
#  En las matrices densas,el número de elementos debe se mayor que el #40% del tamaño de la matriz.
#  Su finalidad es la representación y correcto almacenamiento de una matriz densa. Además de posibilitar las operaciones básicas como son:
# - Suma.
# - Resta.
# - Multiplicación.
# - Comparación de igualdad.
# - Opuesto.
# - Valor mínimo.
# - Valor máximo.
# Además se permite realizar operaciones con matrices dispersas. 

class MatricesDen < Matrices
    def initialize(ancho,*elements)
    	super
      	@matriz= Array.new(ancho)
      	ancho.times do |j|
			@matriz[j]=Array.new(ancho)
      	end
      	ancho.times do |i|
			ancho.times do |k|
	  			@matriz[i][k]=elements[i*ancho+k]
			end
      	end
    end
    
    def +(other)
      	resultado= MatricesDen.new(@ancho)
      	if (other.instance_of?MatricesDen)
			@ancho.times do |i|
	  			@ancho.times do |j|
	      			resultado.matriz[i][j]=@matriz[i][j]+other.matriz[i][j]
	  			end
			end
     	else 
			if (other.instance_of?MatricesDis)
	  			@ancho.times do |i|
	    			@ancho.times do |j|
	      				resultado[i][j]=@matriz[i][j]+0
	    			end
	  			end
	  			0.upto(other.matriz.length/2-1) do |x|
					l=x*2
	    			j=other.matriz[l+1]%other.ancho
	    			i=other.matriz[l+1]/other.ancho
	    			resultado[i][j]=@matriz[i][j]+other.matriz[l]
	  			end
			end
      	end
      	resultado
    end
    
    def - (other)
		resultado= MatricesDen.new(@ancho)
      	if (other.instance_of? MatricesDen)
			@ancho.times do |i|
	  			@ancho.times do |j|
	      			resultado.matriz[i][j]=@matriz[i][j]-other.matriz[i][j]
	  			end
			end
      	else 
			if (other.instance_of? MatricesDis)
	  			@ancho.times do |i|
	    			@ancho.times do |j|
	      				resultado.matriz[i][j]=@matriz[i][j]-0
	    			end
	  			end
	  			0.upto(other.matriz.length/2-1) do |x|
					l=x*2
	    			j=other.matriz[l+1]%other.ancho
	    			i=other.matriz[l+1]/other.ancho
	    			resultado.matriz[i][j]=@matriz[i][j]-other.matriz[l]
	    		end
			end
      	end
      	resultado
    end
   
    def * (other)
      	resultado= MatricesDen.new(@ancho)
      	@ancho.times do |i|
			@ancho.times do |j|
	 			resultado.matriz[i][j]=0
			end
      	end
      	if (other.instance_of? MatricesDen)
			@ancho.times do |i|
	  			@ancho.times do |j|
	    			@ancho.times do |k|
	      				resultado.matriz[i][j]+=@matriz[i][k]*other.matriz[k][j]
	    			end
	  			end
			end
     	else
			if (other.instance_of? MatricesDis)				
				0.upto(@ancho) do |i|
					0.upto(@ancho) do |j|
						0.upto(@ancho) do |k|
							0.upto(other.matriz.length/2-1) do |l|
								l=x*2
								if (((other.matriz[l+1]%other.ancho)==j) && ((other.matriz[l+1]/  other.ancho)==k))
		  							resultado.matriz[i][j]+=@matriz[i][k]*other.matriz[l]
							
								end 
							end
	      				end 
	   				end 
	 			end 
			end 
      	end 
      	 resultado				
   	end

    def -@
      	resultado= MatricesDen.new(@ancho)
      	@ancho.times do |i|
			@ancho.times do |j|
	  			resultado.matriz[i][j]=-@matriz[i][j]
			end
      	end
      	resultado
    end
  
    def == (other)
      	if (other.instance_of? MatricesDis)
			return false
      	end  
      	@ancho.times do |i|
			@ancho.times do |j|
	    		if(matriz[i][j]!=other.matriz[i][j])
	      			return false
	    		end
			end
     	end
      	return true
    end
    

    def max
      	maxtem=-99999999999999
      	@ancho.times do |i|
			@ancho.times do |j|
	  			if (@matriz[i][j] > maxtem)
	    			maxtem=@matriz[i][j]
	  			end
			end
      	end
      	return maxtem
    end
    
    def min
      	mintem=+99999999999999
      	@ancho.times do |i|
			@ancho.times do |j|
	  			if (@matriz[i][j] < mintem)
	   				mintem=@matriz[i][j]
	  			end
			end
      	end
      	return mintem
    end
    
end	
