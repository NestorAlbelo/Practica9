
# = Clase madre Matriz.
# Contiene los métodos comunes entres las clase matrizDen y matrizDis, que son:
# - att_reader para ancho y elementos de matriz.
# - to_s.
# - [](i), para poder acceder directamente a los elementos.
# - []=(i,other), que permite indexar elementos de matriz.
# La jerarquía de herencias es la siguiente:
# MatricesDen y MatricesDis heredan de Matrices.

class Matrices
	attr_reader :ancho, :matriz
	def initialize(ancho,*elements)
	  @ancho=ancho
	end
	def to_s
	  @matriz
	end  
	def [](i)
		@matriz[i]
	end

	def []=(i,other)
		@matriz[i]=other
	end
end