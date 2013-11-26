require "Matrices_dispersas.rb"
require "Matrices_densas.rb"


m1=MatricesDen.new(2,4,4,4,4)
m2=MatricesDis.new(2,[4],[0])
m4=MatricesDis.new(2,[4],[0])
m5=MatricesDis.new(2)
suma=MatricesDis.new(2,[8],[0])
suma2=MatricesDis.new(2,[-1],[0])
multi=MatricesDis.new(2,[16],[0])
m3=MatricesDen.new(2,0,4,4,4)
m6=MatricesDen.new(2,8,4,4,4)


m10=m4*m2


if m10==multi
	puts "Toma"
end
