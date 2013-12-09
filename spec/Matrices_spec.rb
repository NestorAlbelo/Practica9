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
		@m12=MatricesDis.new(2,[1],[0])
		@m13=MatricesDis.new(2,[3],[0])
		@m14=MatricesDis.new(2,[4],[0])
		@m15=MatricesDis.new(2,[-2],[0])
		@m16=MatricesDis.new(2,[-1],[0])
		@m17=MatricesDis.new(2,[Fracciones.new(1,2)],[0])
		@m18=MatricesDis.new(2,[Fracciones.new(1,2)],[0])
		@m19=MatricesDis.new(2,[Fracciones.new(1,1)],[0])
		@m20=MatricesDis.new(2,[Fracciones.new(1,4)],[0])
		@m22=MatricesDen.new(2,6,0,6,0)
		@m23=MatricesDen.new(2,-1,2,2,2)
		@m24=MatricesDen.new(2,5,2,2,2)
		@m25=MatricesDis.new(2,[6,6],[0,2])
		@m26=MatricesDis.new(2,[-1,2,2,2],[0,1,2,3])
		@m25=MatricesDis.new(2,[5,2,2,2],[0,1,2,3])
		#matrices encontrar.
		@mE1=MatricesDen.new(3,1,2,3,4,5,6,7,8,9)
		@rE=[1,0]
		
		
	end
	describe "Operaciones de Matrices Densas" do
	  
	it "Modificacion" do
	      (@mE1.encontrar{|e| e*e >=16}).should eq(@rE)
	end
	
	  
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

    describe "Operaciones Matrices Dispersas" do
    	it "Sumar" do
			(@m12+@m13).should eq(@m14)
		end	

        it "Restar" do
			(@m12-@m13).should eq(@m15)
		end

        it "Multiplicar" do
			(@m12*@m13).should eq(@m13)
		end

        /it "Opuesto" do
			(-@m12).should ==(@m16)
	end
/
	it "Sumar modificacion" do
			(@m17+@m18).should eq(@m19)
	end

	it "Multiplicar modificacion" do
			(@m17*@m18).should eq(@m20)
	end
		
	it "Maximos" do
			(@m14.max).should eq(4)
	end
		
	it "Minimos" do 
			(@m14.min).should eq(0)
	end
	
	
    end

    describe "Operaciones Matrices Dispersas y Densas" do
    	/it "MultiplicarDensa-Dis" do
			(@m2*@m13).should eq(@m22)
		end
	/
	it "RestarDensa-Dis" do
			(@m2-@m13).should eq(@m23)
		end

        it "SumarDensa-Dis" do
			(@m2+@m13).should eq(@m24)
		end

	/it "MultiplicarDis-Den" do
			(@m13*@m2).should eq(@m22)
		end
	

        it "SumaDis-Den" do
			(@m13+@m2).should eq(@m24)
		end
	/
    end	
end
