require "gcd.rb"

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
		a=(num*frac.denom + frac.num*denom)
		Fracciones.new(a,b)
	end
	def - (frac)
		a=(num*frac.denom - frac.num*denom)
		b=(denom*frac.denom)
		Fracciones.new(a,b)
	end
	def * (frac)
		a=(num*frac.num)
		b=(denom*frac.denom)
		Fracciones.new(a,b)
	end
	def / (frac)
		a=(num*frac.denom)
		b=(denom*frac.num)
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
		
			
	
end
