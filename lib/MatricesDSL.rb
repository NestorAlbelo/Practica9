require "Matrices_densas.rb"
require "Matrices_dispersas.rb"

class MatricesDSL
  
  def initialize(op, &block)
      @operand = []
      @tipo
      @operacion=op
      @resultado
      
      instance_eval &block
  end
  
  def operand(*arg)
  	if arg.size == 2
  		@operand << MatricesDen.new(arg[0],arg[1])
  	elsif arg.size == 3
  		@operand << MatricesDis.new(arg[0],arg[1],arg[2])
  	else 
  		puts "Error al introducir la matriz"
  	end
  end

  def option(text)
     if (text=='Densas' || text=='Dispersas' || text=='DensasDispersas' || text=='DispersasDensas')
       @tipo=text
     else
       puts "Error en la sintaxis"
     end
    
  end
  
  def operation
  	(@operand.size).times do |i|
  		if @operacion == 'Suma' && (i<@operand.size-1)
    		@resultado=@operand[i] + @operand[i+1]
  		elsif @operacion == 'Resta' && (i<@operand.size-1)
        	@resultado=@operand[i] - @operand[i+1]
  		elsif @operacion == 'Multiplicacion' && (i<@operand.size-1)
        	@resultado=@operand[i] * @operand[i+1]
 		elsif @operacion == 'Opuesto'
        	@resultado=-@operand[i]
    	elsif @operacion == 'Max'
        	@resultado=@operand[i].max
   	 	elsif @operacion == 'Min'
        	@resultado=@operand[i].min
    	end

      	if (i<@operand.size-1 && (@operacion == "Suma" || @operacion == "Resta" || @operacion == 'Multiplicacion'))
      	  puts "\nOperacion: \n"
          puts "\t#{@operand[i].to_s} #{@operacion} #{@operand[i+1].to_s}\n"
          puts "Resultado:\n"
      	  puts "\t#{@resultado}"
      	elsif (@operacion == "Opuesto" || @operacion == "Max" || @operacion == 'Min')
      	  puts "\nOperacion: \n"
          puts "\t#{@operacion} #{@operand[i].to_s}\n"
          puts "Resultado:\n"
      	  puts "\t#{@resultado}"
      	end  
	end
  end

end  