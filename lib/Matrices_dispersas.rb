require "Matrices.rb"
require "Matrices_densas.rb"

class MatricesDis < Matrices
  	def initialize(ancho,elementos, posiciones)
  		super
		#if (elementos.length < (ancho*ancho*0.4) && elementos.length == posiciones.length) #El numero de elementos no puede se mayor que el 
					  																		#40% del tamaño y debe coincidir con el numero de posiciones pasadas
			@ancho = ancho 
			@matriz = Array.new
			j=0
			for i in 0...elementos.length
				@matriz << elementos[i]
				@matriz << posiciones[i]
			end
		#else
		#	puts "No se puede crear la matriz, parametros incorrectos, intentelo de nuevo"
		#end
	end
	def +(other)
		if (other.instance_of?MatricesDis)
			if @ancho == other.ancho #Compruebo el ancho de las matrices
				result = Array.new #Vector para guardar los valores
				pos = Array.new #Vector para guardar los resultados
				i=1
				while i < @matriz.length # Recorre el vector de matriz visitando unicamente las posiciones no los valores
					t=false # Permite comprobar si el elemento i de matriz se ha introducido o no
					j=1
					while j < other.matriz.length #Recorre el vector de other.matriz unicamente por las posiciones
						if @matriz[i] == other.matriz[j] #Si las posiciones coinciden las suma
							result << (@matriz[i-1]+other.matriz[j-1])
							pos << @matriz[i]
							t=true #Significa que la posicion i de matriz ya esta introducida en result
						end
						j+=2
					end
					if t==false # Si no se ha operado la posicion i de matriz se introduce tal cual
						result << @matriz[i-1]
						pos << @matriz[i]
					end
					i+=2
				end

				i=1

				while i < other.matriz.length #Recorre el vector other.matriz por las posiciones
					t=false # Indica si el elemento ya esta en result
					for j in 0..pos.length
						if other.matriz[i]==pos[j]
							t=true
						end
					end
					if t==false
						result << other.matriz[i-1]
						pos << other.matriz[i]					
					end
					i+=2
				end
				return MatricesDis.new(@ancho, result, pos)
			end
		##Final de Matrices Dispersas
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
			if @ancho == other.ancho #Compruebo el ancho de las matrices
				result = Array.new #Vector para guardar los valores
				pos = Array.new #Vector para guardar los resultados
				i=1
				while i < @matriz.length # Recorre el vector de matriz visitando unicamente las posiciones no los valores
					t=false # Permite comprobar si el elemento i de matriz se ha introducido o no
					j=1
					while j < other.matriz.length #Recorre el vector de other.matriz unicamente por las posiciones
						if @matriz[i] == other.matriz[j] #Si las posiciones coinciden las suma
							result << (@matriz[i-1]-other.matriz[j-1])
							pos << @matriz[i]
							t=true #Significa que la posicion i de matriz ya esta introducida en result
						end
						j+=2
					end
					if t==false # Si no se ha operado la posicion i de matriz se introduce tal cual
						result << @matriz[i-1]
						pos << @matriz[i]
					end
					i+=2
				end

				i=1

				while i < other.matriz.length #Recorre el vector other.matriz por las posiciones
					t=false # Indica si el elemento ya esta en result
					for j in 0..pos.length
						if other.matriz[i]==pos[j]
							t=true
						end
					end
					if t==false
						result << -other.matriz[i-1]
						pos << other.matriz[i]					
					end
					i+=2
				end
				return MatricesDis.new(@ancho, result, pos)
			end
		##Final de Matrices Dispersas
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
		#if other.ancho == @ancho
		#	if 	@matriz.length == other.matriz.length
				for i in 0...@matriz.length
					if @matriz[i] != other.matriz[i]
						return false
					end
				end
				return true
		#	end
		#else 
		#	return false
		#end
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