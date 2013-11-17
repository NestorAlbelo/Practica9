require "Matrices.rb"
require "Fracciones.rb"

describe Matrices do  
	before :each do
		@Arr = [10,10,10,10,10,10,10,10,10]
		@m1=Matrices.new(2,1,1,1,1)
		@m2=Matrices.new(2,2,2,2,2)
		@m3=Matrices.new(2,3,3,3,3)
		@m4=Matrices.new(2,-1,-1,-1,-1)
		@m5=Matrices.new(2,4,4,4,4)
		@m6=Matrices.new(2,-1,-1,-1,-1)
		@m7=Matrices.new(2,Fracciones.new(1,2),Fracciones.new(1,3),Fracciones.new(1,4),Fracciones.new(1,5))
		@m8=Matrices.new(2,Fracciones.new(1,2),Fracciones.new(2,3),Fracciones.new(3,4),Fracciones.new(4,5))
		@m9=Matrices.new(2,Fracciones.new(1,1),Fracciones.new(1,1),Fracciones.new(1,1),Fracciones.new(1,1))
		@m10=Matrices.new(2,Fracciones.new(1,2),Fracciones.new(3,5),Fracciones.new(11,40),Fracciones.new(49,150))
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
			(@m1+@m2).should eq(@m3)
		end

			it "Multiplicar modificacion" do
			(@m1*@m2).should eq(@m5)
		end
		
		
                
    end
end
