require "Matrices_densas.rb"
require "Matrices_dispersas.rb"

class MatricesDSL
  
  def initialize(op, &block)
      @operand1
      @operand2
      @tipo
      @operacion=op
      @resultado
      
      instance_eval &block
  end
  
  def to_s
      output = "\n#{@operacion} de #{@tipo}"
      output << "\n#{'=' * output.size}\n\n"
      output << "Operacion: \n"
      if (@operand2)
          output << "\t#{@operand1.to_s} #{@operacion} #{@operand2.to_s}\n"
      else
          output << "\t#{@operacion} #{@operand1.to_s}\n"
      end
      output << "Resultado:\n"
      
      output << "\t#{@resultado}"  
      output
  end
  
  def operand(*arg)
      if arg.size == 2 && @tipo=='Densas'
	@operand1=MatricesDen.new(arg[0],arg[1])
      else
	 if arg.size == 3 && @tipo=='Dispersas'
	    @operand1 = MatricesDis.new(arg[0],arg[1],arg[2])
	 else
	   if arg.size == 4 && @tipo=='Densas'
	      @operand1=MatricesDen.new(arg[0],arg[1])
	      @operand2=MatricesDen.new(arg[2],arg[3])
	   else
	     if arg.size == 6 && @tipo=='Dispersas'
		@operand1=MatricesDis.new(arg[0],arg[1],arg[2])
		@operand2=MatricesDis.new(arg[3],arg[4],arg[5])
	     else
		if @tipo == 'DensasDispersas'
		  @operand1=MatricesDen.new(arg[0],arg[1])
		  @operand2=MatricesDis.new(arg[2],arg[3],arg[4])
		else
		  @operand1=MatricesDis.new(arg[0],arg[1],arg[2])
		  @operand2=MatricesDen.new(arg[3],arg[4])
		end
	     end
	   end
	 end
      end    
      operation
  end

  def option(text)
     if (text=='Densas' || text=='Dispersas' || text=='DensasDispersas' || text=='DispersasDensas')
       @tipo=text
     else
       puts "Error en la sintaxis"
     end
    
  end
  
  def operation
  if @operacion == "Suma"
     @resultado=@operand1 + @operand2
  else
      if @operacion == 'Resta'
        @resultado=@operand1 - @operand2
      else
          if @operacion == 'Multiplicacion'
            @resultado=@operand1 * @operand2
          else
            if @operacion == 'Opuesto'
              @resultado=-@operand1
            else
              if @operacion == 'Max'
                @resultado=@operand1.max
              else
                if @operacion == 'Min'
                  @resultado=@operand1.min
                end
              end
            end
          end
        end
      end
  end

end  