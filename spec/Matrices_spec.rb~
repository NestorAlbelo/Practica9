require "Matrices_densas.rb"
require "Matrices_dispersas.rb"
require "Fracciones.rb"


describe Matrices do  
	before :each do
		@Arr = [10,10,10,10,10,10,10,10,10]
		@m1=MatricesDen.new(2,1,1,1,1)
		@m2=MatricesDen.new(2,2,2,2,2)
		@m3=MatricesDen.new(2,3,3,3,3)
		@m4=MatricesDen.new(2,-1,-1,-1,-1)
		@m5=MatricesDen.new(2,4,4,4,4)
		@m6=MatricesDen.new(2,-1,-1,-1,-1)
		@m7=MatricesDen.new(2,Fracciones.new(1,2),Fracciones.new(1,3),Fracciones.new(1,4),Fracciones.new(1,5))
		@m8=MatricesDen.new(2,Fracciones.new(1,2),Fracciones.new(2,3),Fracciones.new(3,4),Fracciones.new(4,5))
		@m9=MatricesDen.new(2,Fracciones.new(1,1),Fracciones.new(1,1),Fracciones.new(1,1),Fracciones.new(1,1))
		@m10=MatricesDen.new(2,Fracciones.new(1,2),Fracciones.new(3,5),Fracciones.new(11,40),Fracciones.new(49,150))
		@m11=MatricesDen.new(2,0,20,-4,200)
	end
	describe "Operaciones de Matrices" do
                it "Sumar" do
			(@m1+@m2).should eq(@m3)
		end	

                it "Restar" do
			(@m1-@m2).should eq(@m4)
		end

                it "Multiplicar" do
			(@m1*@m2).should eq(@m5)
		end

        	it "Opuesto" do
			(-@m1).should eq(@m6)
		end

		it "Sumar modificacion" do
			(@m7+@m8).should eq(@m9)
		end

		it "Multiplicar modificacion" do
			(@m7*@m8).should eq(@m10)
		end
		
		it "Maximos" do
			(@m11.max).should eq(200)
		end
		
		it "Minimos" do 
			(@m11.min).should eq(-4)
		end
		
                
    end
end
