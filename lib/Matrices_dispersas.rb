require "Matrices.rb"
require "Matrices_densas.rb"

# = Clase Martriz dispersa.
#  En las matrices dispersas,el número de elementos no puede se mayor que el #40% del tamaño de la matriz.
#  Su finalidad es la representación y correcto almacenamiento de una matriz dispersa. Además de posibilitar las operaciones básicas como son:
# - Suma.
# - Resta.
# - Multiplicación.
# - Comparación de igualdad.
# - Opuesto.
# - Valor mínimo.
# - Valor máximo.
# Además se permite realizar operaciones con matrices densas.

class MatricesDis < Matrices
  	def initialize(ancho,elementos=nil, posiciones=nil)
  		super
		@ancho = ancho 
		if elementos ==nil
			@matriz=nil
		else
			@matriz = Array.new
			j=0
			elementos.length.times do |i|
				@matriz << elementos[i]
				@matriz << posiciones[i]
			end
		end
	end

	def +(other)
		if (other.instance_of?MatricesDis)
			if @ancho == other.ancho 
				result = Array.new 
				pos = Array.new 
				0.upto(@matriz.length/2-1) do |x|
					i=x*2+1
					t=false
					0.upto(other.matriz.length/2-1) do |y|
					    j=y*2+1  
						if @matriz[i] == other.matriz[j] 
							result << (@matriz[i-1]+other.matriz[j-1])
							pos << @matriz[i]
							t=true 
						end
					end
					if t==false 
						result << @matriz[i-1]
						pos << @matriz[i]
					end
				end

				0.upto(other.matriz.length/2-1) do |x|
					i=x*2+1
					t=false 
					pos.length.times do |j|
						if other.matriz[i]==pos[j]
							t=true
						end
					end
					if t==false
						result << other.matriz[i-1]
						pos << other.matriz[i]					
					end
				end
				t=false
				result.length.times do |i|
					if result[i]!=0
						t=true
					end
				end
				if t==false
					return MatricesDis.new(@ancho)	
				end
				return MatricesDis.new(@ancho, result, pos)
			end
		
		else 
			if (other.instance_of?MatricesDen)
				resultado= MatricesDen.new(@ancho)
				@ancho.times do |i|
				  @ancho.times do |j|
	      				resultado.matriz[i][j]=other.matriz[i][j]
				  end
	  			end
	  			0.upto(@matriz.length/2-1) do |x|
				  l=x*2
				  j=@matriz[l+1]%other.ancho
				  i=@matriz[l+1]/other.ancho
				  resultado[i][j]=@matriz[l]+other.matriz[i][j]
	  			end
				return resultado
			end
		end
	end

		def -(other)
			if (other.instance_of?MatricesDis)
			if @ancho == other.ancho
				result = Array.new
				pos = Array.new 
				0.upto(@matriz.length/2-1) do |x|
					i=x*2+1
					t=false 
					0.upto(other.matriz.length/2-1) do |y|
						j=y*2+1
						if @matriz[i] == other.matriz[j]
							result << (@matriz[i-1]-other.matriz[j-1])
							pos << @matriz[i]
							t=true 
						end
					end
					if t==false 
						result << @matriz[i-1]
						pos << @matriz[i]
					end
				end

			
				0.upto(other.matriz.length/2-1) do |x|
					i=x*2+1
					t=false 
					pos.length.times do |j|
						if other.matriz[i]==pos[j]
							t=true
						end
					end
					if t==false
						result << other.matriz[i-1]
						pos << other.matriz[i]					
					end
				end
				t=false
				result.length.times do |i|
					if result[i]!=0
						t=true
					end
				end
				if t==false
					return MatricesDis.new(@ancho)	
				end
				return MatricesDis.new(@ancho, result, pos)
			end
		
		else 
			if (other.instance_of?MatricesDen)
				resultado= MatricesDen.new(@ancho)
				@ancho.times do |i|
				  @ancho.times do |j|
	      				resultado.matriz[i][j]=other.matriz[i][j]
				  end
	  			end
	  			0.upto(@matriz.length/2-1) do |x|
				  l=x*2
				  j=@matriz[l+1]%other.ancho
				  i=@matriz[l+1]/other.ancho
				  resultado[i][j]=@matriz[l]-other.matriz[i][j]
	  			end
				return resultado
			end
		end
	end

	def *(other)
		if @ancho==other.ancho
			if (other.instance_of?MatricesDis)
				resultado=Array.new
				pos=Array.new
				@ancho.times do |i|
	  				@ancho.times do |j|
	    				@ancho.times do |k|
	    					t=false
	    					0.upto(@matriz.length/2-1) do |x|
								l=x*2+1
	    						if matriz[l]==(i*@ancho+k)
	    							0.upto(other.matriz.length/2-1) do |y|
										m=y*2+1
	    								if other.matriz[m]==(k*ancho+j)
	    									if t==false
	    										resultado << @matriz[l-1]*other.matriz[m-1]
	    										pos << i*ancho+j
	    										t=true
	    									else
	    										resultado[resultado.length-1]+= @matriz[l-1]*other.matriz[m-1]
	    									end
	    								end
    								end
    							end
    						end
	    				end
	  				end
				end
				if resultado.length==0
					return MatricesDis.new(@ancho)
				end
				return MatricesDis.new(@ancho,resultado,pos)
			else 
				if (other.instance_of?MatricesDen)
					resultado= MatricesDen.new(@ancho)
					@ancho.times do |i|
					  @ancho.times do |j|
					      resultado.matriz[i][j]=0
					  end
					end
					
				
					0.upto(@ancho-1) do |i|
						0.upto(@ancho-1) do |j|
							0.upto(@ancho-1) do |k|
								0.upto(@matriz.length/2-1) do |x|
									l=x*2
						      		if (((@matriz[l+1]%@ancho)==j) && ((@matriz[l+1]/@ancho)==k))
		  								resultado.matriz[i][j]+=other.matriz[i][k]*@matriz[l]
						      		end 
						    	end 
	      					end 
					    end 
					end 
					resultado 
				end	
			end	
		end
	end	

	def -@
		resultado = Array.new
		pos = Array.new
		#i=0
		#while i < @matriz.length
		0.upto(@matriz.length/2-1) do |x|
			i=x*2+1
			resultado << -@matriz[i]
			pos << @matriz[i+1]
		end
		return MatricesDis.new(@ancho,resultado,pos)
	end

	def ==(other)
		if @matriz == nil
			if other.matriz== nil
				if @ancho == other.ancho
					return true
				end
			end
			return false
		else
			if other.matriz == nil || @ancho!=other.ancho
				return false
			else
				@matriz.length.times do |i|
					if @matriz[i] != other.matriz[i]
						return false
					end
				end
				return true
			end
		end
	end

	def max
      	max=@matriz[0]
      	#i=0
      	#while i < @matriz.length
      	0.upto(@matriz.length/2-1) do |x|
			i=x*2+1
      		if matriz[i]>max
      			max=matriz[i]
      		end
      	end
      	if max<0
      		max=0
      	end
      	return max
    end
    
    def min
      	min=@matriz[0]
      	#i=0
      	#while i < @matriz.length
      	0.upto(@matriz.length/2-1) do |x|
			i=x*2+1
      		if matriz[i]<min
      			min=matriz[i]
      		end
      	end
      	if min>0
      		min=0
      	end
      	return min
    end

 end	
