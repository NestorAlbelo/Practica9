require "gcd.rb"

# = Clase Fracciones.
# La finalidad de esta clase es la de representar números racionales de la forma numerador/denominador y comprender un conjunto de operaciones.
# Estas operaciones son:
# - to_s.
# - flotante: pasa el numero de la forma numerador/denominador a número flotante.
# - abs : valor absoluto.
# - reciproco: numerador/denominador -> denominador/numerador.
# - opuesto: numerador/denominador -> -numerador/denominador.
# - Suma.
# - Resta.
# - Multiplicar.
# - División.
# - Módulo.
# - Coerce.
# - <=> para este operador es necesario incluir el módulo Comparable.
class Fracciones
	include Comparable
	def initialize(x,y)
		i=gcd(x,y)
		@numerador=x/i
		@denominador=y/i
	end
	def num
		@numerador
	end
	def denom
		@denominador
	end
	def to_s
		"#{num}/#{denom}".to_s
	end
	def flotante
		num/denom
	end
	def abs
		if (num<0)
			@numerador = - @numerador
		end
		if (denom<0)
			@denominador = - @denominador
		end
	end
	
	def reciproco
		Fracciones.new(@denominador,@numerador)
	end	
		
	def opuesto
		Fracciones.new(-@numerador,@denominador)
	end
		
	def + (frac)
		a,b=0
		if (frac == 0)
		  a=num
		  b=denom
		else
		  a=(num*frac.denom + frac.num*denom)
		  b=(denom*frac.denom)
		end  
		Fracciones.new(a,b)
	end
	def - (frac)
		a,b=0
		if (frac == 0)
		  a=num
		  b=denom
		else
		  a=(num*frac.denom - frac.num*denom)
		  b=(denom*frac.denom)
		end  
		Fracciones.new(a,b)
	end
	def * (frac)
		a,b=0
		if (frac == 0)
		  a=0
		  b=1
		else  
		  a=(num*frac.num)
		  b=(denom*frac.denom)
		end
		Fracciones.new(a,b)
	end
	def / (frac)
		a,b=0
		if (frac == 0)
		 return -1
		else  
		  a=(num*frac.denom)
		  b=(denom*frac.num)
		end
		Fracciones.new(a,b)
	end
		
	def % (other)
		a = num/denom
		b = other.num/other.denom
		a%b
	end
	def <=>(other)
		(@numerador/@denominador) <=> (other.num/other.denom)
	end
	
	def coerce(other)
	  [self,other]
	end
end
