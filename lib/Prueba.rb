require "MatricesDSL.rb"

#Densas
#----------------------------------------------------------------------
puts "DENSAS"
puts "#{'*' * 60}"
sumaDen = MatricesDSL.new("Suma") do
    option "Densas"
    operand 2, [1,2,3,4]
    operand 2, [1,2,3,4]
    operation
end

restaDen = MatricesDSL.new("Resta") do
    option "Densas"
    operand 2, [1,2,3,4]
    operand 2, [1,2,3,4]  
    operation
end

mutiDen = MatricesDSL.new("Multiplicacion") do
    option "Densas"
    operand 2, [1,2,3,4]
    operand 2, [1,2,3,4] 
    operation
end

opuestoDen = MatricesDSL.new("Opuesto") do
    option "Densas" 
    operand 2, [1,2,3,4] 
    operation 
end

maxDen = MatricesDSL.new("Max") do
    option "Densas" 
    operand 2, [1,2,3,4]  
    operation
end

minDen = MatricesDSL.new("Min") do
    option "Densas" 
    operand 2, [1,2,3,4]  
    operation
end
#Dispersa
#----------------------------------------------------------------------
puts "\n\nDISPERSAS"
puts "#{'*' * 60}"
sumaDis = MatricesDSL.new("Suma") do
    option "Dispersas"
    operand 2, [1,2],[0,1]
    operand 2, [1,2],[0,1]
    operation
end

restaDis = MatricesDSL.new("Resta") do
    option "Dispersas"
    operand 2, [1,2], [0,1]
    operand 2, [1,2], [0,1]
    operation
end

mutiDis = MatricesDSL.new("Multiplicacion") do
    option "Dispersas"
    operand 2, [1,2], [0,1]
    operand 2, [1,2], [0,1]
    operation
end

opuestoDis = MatricesDSL.new("Opuesto") do
    option "Dispersas" 
    operand  2, [1,2], [0,1]
    operation
end

maxDis = MatricesDSL.new("Max") do
    option "Dispersas" 
    operand  2, [1,2], [0,1]  
    operation
end

minDis = MatricesDSL.new("Min") do
    option "Dispersas" 
    operand  2, [1,2], [0,1]
    operation
end

#Densa Dispersa
#----------------------------------------------------------------------
puts "\n\nDENSAS DISPERSAS"
puts "#{'*' * 60}"
sumaDenDis = MatricesDSL.new("Suma") do
    option "DensasDispersas"
    operand 2, [1,2,3,4]
    operand 2, [1,2], [0,1]
    operation
end

restaDenDis = MatricesDSL.new("Resta") do
    option "DensasDispersas"
    operand 2, [1,2,3,4]
    operand 2, [1,2], [0,1]
    operation
end

mutiDenDis = MatricesDSL.new("Multiplicacion") do
    option "DensasDispersas"
    operand 2, [1,2,3,4]
    operand 2, [1,2], [0,1] 
    operation
end

#Dispersa Densa
#----------------------------------------------------------------------
puts "\n\nDISPERSAS DENSAS"
puts "#{'*' * 60}"
sumaDisDen = MatricesDSL.new("Suma") do
    option "DispersasDensas"
    operand 2, [1,2], [0,1]
    operand 2, [1,2,3,4]
    operation
end

restaDisDen = MatricesDSL.new("Resta") do
    option "DispersasDensas"
    operand 2, [1,2], [0,1]
    operand 2, [1,2,3,4]
    operation
end

mutiDisDen = MatricesDSL.new("Multiplicacion") do
    option "DispersasDensas"
    operand 2, [1,2], [0,1]
    operand 2, [1,2,3,4] 
    operation
end


