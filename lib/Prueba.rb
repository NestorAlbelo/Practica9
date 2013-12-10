require "MatricesDSL.rb"

#Densas
#----------------------------------------------------------------------
sumaDen = MatricesDSL.new("Suma") do
    option "Densas"
    operand 2,[1,2,3,4], 2, [1,2,3,4]
end

restaDen = MatricesDSL.new("Resta") do
    option "Densas"
    operand 2,[1,2,3,4], 2, [1,2,3,4]  
end

mutiDen = MatricesDSL.new("Multiplicacion") do
    option "Densas"
    operand 2,[1,2,3,4], 2, [1,2,3,4] 
end

opuestoDen = MatricesDSL.new("Opuesto") do
    option "Densas" 
    operand 2,[1,2,3,4]  
end

maxDen = MatricesDSL.new("Max") do
    option "Densas" 
    operand 2,[1,2,3,4]  
end

minDen = MatricesDSL.new("Min") do
    option "Densas" 
    operand 2,[1,2,3,4]  
end
#Dispersa
#----------------------------------------------------------------------
sumaDis = MatricesDSL.new("Suma") do
    option "Dispersas"
    operand 2,[1,2],[0,1],2,[1,2],[0,1]
end

restaDis = MatricesDSL.new("Resta") do
    option "Dispersas"
    operand  2, [1,2], [0,1],2, [1,2], [0,1]
end

mutiDis = MatricesDSL.new("Multiplicacion") do
    option "Dispersas"
    operand  2, [1,2], [0,1],2, [1,2], [0,1]
end

opuestoDis = MatricesDSL.new("Opuesto") do
    option "Dispersas" 
    operand  2, [1,2], [0,1]
end

maxDis = MatricesDSL.new("Max") do
    option "Dispersas" 
    operand  2, [1,2], [0,1]  
end

minDis = MatricesDSL.new("Min") do
    option "Dispersas" 
    operand  2, [1,2], [0,1]
end

#Densa Dispersa
#----------------------------------------------------------------------
sumaDenDis = MatricesDSL.new("Suma") do
    option "DensasDispersas"
    operand 2,[1,2,3,4], 2, [1,2], [0,1]
end

restaDenDis = MatricesDSL.new("Resta") do
    option "DensasDispersas"
    operand 2,[1,2,3,4], 2, [1,2], [0,1]
end

mutiDenDis = MatricesDSL.new("Multiplicacion") do
    option "DensasDispersas"
    operand 2,[1,2,3,4], 2, [1,2], [0,1] 
end

#Dispersa Densa
#----------------------------------------------------------------------
sumaDisDen = MatricesDSL.new("Suma") do
    option "DispersasDensas"
    operand 2, [1,2], [0,1], 2,[1,2,3,4]
end

restaDisDen = MatricesDSL.new("Resta") do
    option "DispersasDensas"
    operand 2, [1,2], [0,1], 2,[1,2,3,4]
end

mutiDisDen = MatricesDSL.new("Multiplicacion") do
    option "DispersasDensas"
    operand 2, [1,2], [0,1], 2,[1,2,3,4] 
end



puts "DENSAS"
puts "#{'*' * 60}"
puts sumaDen
puts restaDen
puts mutiDen
puts opuestoDen
puts minDen
puts maxDen
puts "\n\nDISPERSAS"
puts "#{'*' * 60}"	
puts sumaDis
puts restaDis
puts mutiDis
puts opuestoDis
puts minDis
puts maxDis
puts "\n\nDENSAS DISPERSAS"
puts "#{'*' * 60}"
puts sumaDenDis
puts restaDenDis
puts mutiDenDis
puts "\n\nDISPERSAS DENSAS"
puts "#{'*' * 60}"
puts sumaDisDen
puts restaDisDen 
puts mutiDisDen
