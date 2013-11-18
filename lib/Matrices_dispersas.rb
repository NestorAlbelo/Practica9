require "Matrices.rb"
require "Matrices_densas.rb"

class MatricesDis < Matrices
  	def initialize(ancho,elementos, posiciones)
  		super
		if (elementos.length < (ancho*ancho*0.4).to_int && elementos.length == posiciones.length) #El numero de elementos no puede se mayor que el 
																								  #40% del tamaño y debe coincidir con el numero de posiciones pasadas
			@ancho = ancho 
			@matriz = Array.new(elementos.length*2)
			i=0
			j=0
			while i <= elementos.length*2 do
				@matriz[i]=elementos[j]
				@matriz[i+1]=posiciones[j]
				i+=2
				j+=1
			end
		else
			puts "No se puede crear la matriz, parametros incorrectos, intentelo de nuevo"
		end
	end
	def +(other)
		if (other.instance_of?MatricesDis)
			if @ancho == other.ancho
				i=j=1
				result = Array.new
				while i < @matriz.length/2
					t=false
					while j < other.matriz.length/2
						if @matriz[i] == other.matriz[j]
							result << (@matriz[i-1]+other.matriz[j-1])
							result << @matriz[i]
							t=true
						end
						j+=2
					end
					if t==false
						result << @matriz[i-1]
						result << @matriz[i]
					end
					i+=2
				end

				i=j=1
				while i < other.matriz.length/2
					t=false
					while j < result.length/2
						if other.matriz[i]==result[j]
							t=true
						end
						j+=2
					end
					if t=false
						result << other.matriz[i-1]
						result << other.matriz[i]
					end
					i+=2
				end
				return result
			end

		else 
			if (other.instance_of?MatricesDen)
				m1=Array.new(other.ancho*other.ancho)
				for i in 0...other.ancho
					for j in 0...other.ancho
						m1[i*other.ancho+j]=other.matriz[i][j]
					end
				end
				m2=MatricesDen.new(other.ancho, m1)
				return m2+self
			end
		end
	end

	def -(other)
		if (other.instance_of?MatricesDis)
			if @ancho == other.ancho
				i=j=1
				result = Array.new
				while i < @matriz.length
					t=false
					while j < other.matriz.length
						if @matriz[i] == other.matriz[j]
							result << (@matriz[i-1]-other.matriz[j-1])
							result << @matriz[i]
							t=true
						end
						j+=2
					end
					if t==false
						result << @matriz[i-1]
						result << @matriz[i]
					end
					i+=2
				end

				i=j=1
				while i < other.matriz.length
					t=false
					while j < result.length
						if other.matriz[i]==result[j]
							t=true
						end
						j+=2
					end
					if t=false
						result << -other.matriz[i-1]
						result << -other.matriz[i]
					end
					i+=2
				end
				return result
			end
		else 
			if (other.instance_of?MatricesDen)
				m1=Array.new(other.ancho*other.ancho)
				for i in 0...other.ancho
					for j in 0...other.ancho
						m1[i*other.ancho+j]=other.matriz[i][j]
					end
				end
				m2=MatricesDen.new(other.ancho, m1)
				return m2-self
			end
		end
	end

	def *(other)
		if @ancho==other.ancho
			if (other.instance_of?MatricesDis)
				resultado=Array.new
				for i in 0...@ancho
	  				for j in 0...@ancho
	    				for k in 0...@ancho
	    					t=false
	    					for l in 1...@matriz.length
	    						if matriz[l]==(i*@ancho+k)
	    							for m in 1...other.matriz.length
	    								if other.matriz[m]==(k*ancho+j)
	    									if t==false
	    										resultado << @matriz[l-1]*other.matriz[m-1]
	    										resultado << î*ancho+j
	    										t=true
	    									else
	    										resultado[resultado.length-2]+= @matriz[l-1]*other.matriz[m-1]
	    									end
	    								end
    								m+=1
    								end
    							end
    						l+=1
    						end
	    				end
	  				end
				end
				return resultado
			else 
				if (other.instance_of?MatricesDen)
					m1=Array.new(@ancho*@ancho)
					for i in 0...@ancho
						for j in 0...@ancho
							t=false
							for k in 1...@matriz.length
								if matriz[k]==(i*ancho+j)
									m1[i*ancho+j]=matriz[k-1]
									t=true
								else
									if t==false
										m1[i*ancho+j]=0
									end
								end
								k+=1
							end
						end
					end
					m2=MatricesDen.new(@ancho, m1)
					return m2*other
				end	
			end	
		end
	end	

	def -@
		resultado = Array.new(@matriz.length)
		for i in 0...@matriz.length
			resultado << -@matriz[i]
			resultado << @matriz[i+1]
			i+=1
		end
		return resultado
	end

	def ==(other)
		if other.ancho == @ancho && @matriz.length == other.matriz.length
			for i in 0...@matriz.length
				if @matriz[i] != other.matriz[i]
					return false
				end
			end
			return true
		else 
			return false
		end
	end

	def max
      	max=@matriz[0]
      	for i in 0...@matriz.length
      		if matriz[i]>max
      			max=matriz[i]
      		end
      		i+=1
      	end
      	if max<0
      		max=0
      	end
      	return max
    end
    
    def min
      	min=@matriz[0]
      	for i in 0...@matriz.length
      		if matriz[i]<min
      			min=matriz[i]
      		end
      		i+=1
      	end
      	if min>0
      		min=0
      	end
      	return min
    end

 end	