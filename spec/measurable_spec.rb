describe Measurable do

  describe "Binary union" do
    
  end

  describe "Binary intersection" do
    
  end

  describe "Euclidean" do
    
    before :all do
      @u = [1, 3, 16]
      @v = [1, 4, 16]
      @w = [4, 5, 6]
    end
    
    context "Distance" do
      it "accepts two arguments" do
        expect { Measurable.euclidean(@u, @v) }.to_not raise_error
        expect { Measurable.euclidean(@u, @v, @w) }.to raise_error(ArgumentError)
      end
    
      it "accepts one argument and returns the vector's norm" do
        # Remember that 3^2 + 4^2 = 5^2.
        Measurable.euclidean([3, 4]).should == 5
      end
            
      it "should be symmetric" do
        Measurable.euclidean(@u, @v).should == Measurable.euclidean(@v, @u)
      end

      it "should return the correct value" do
        Measurable.euclidean(@u, @u).should == 0
        Measurable.euclidean(@u, @v).should == 1
      end
    
      it "shouldn't work with vectors of different length" do
        expect { Measurable.euclidean(@u, [2, 2, 2, 2]) }.to raise_error
      end
    end
    
    context "Squared Distance" do
      it "accepts two arguments" do
        expect { Measurable.euclidean_squared(@u, @v) }.to_not raise_error
        expect { Measurable.euclidean_squared(@u, @v, @w) }.to raise_error(ArgumentError)
      end
    
      it "accepts one argument and returns the vector's norm" do
        # Remember that 3^2 + 4^2 = 5^2.
        Measurable.euclidean_squared([3, 4]).should == 25
      end
            
      it "should be symmetric" do
        x = Measurable.euclidean_squared(@u, @v)
        y = Measurable.euclidean_squared(@v, @u)
        
        x.should == y
      end

      it "should return the correct value" do
        Measurable.euclidean_squared(@u, @u).should == 0
        Measurable.euclidean_squared(@u, @v).should == 1
      end
    
      it "shouldn't work with vectors of different length" do
        expect { Measurable.euclidean_squared(@u, [2, 2, 2, 2]) }.to raise_error
      end    
    end
    
  end

  describe "Cosine distance" do
    it "accepts two arguments" do
      expect { Measurable.cosine(@u, @v) }.to_not raise_error
      expect { Measurable.cosine(@u, @v, @w) }.to raise_error(ArgumentError)
    end
        
    it "should handle NaN's"
    
    it "should be symmetric" do
      Measurable.cosine(@u, @v).should == Measurable.cosine(@v, @u)
    end

    it "should return the correct value"

    it "shouldn't work with vectors of different length" do
      expect { Measurable.cosine(@u, [1, 3, 5, 7]) }.to raise_error
    end
  end
    
  describe "Chebyshev distance" do
    it "accepts two arguments"
    
    it "accepts one argument and returns the vector's norm"
        
    it "should be symmetric"

    it "should return the correct value"
    
    it "shouldn't work with vectors of different length"
  end
  
  describe "Tanimoto distance" do
    it "accepts two arguments" do
      expect { Measurable.tanimoto(@u, @v) }.to_not raise_error
      expect { Measurable.tanimoto(@u, @v, @w) }.to raise_error(ArgumentError)
    end
    
    it "accepts one argument and returns the vector's norm"
        
    it "should be symmetric"

    it "should return the correct value"
    
    it "shouldn't work with vectors of different length" do
      expect { Measurable.tanimoto(@u, [1, 3, 5, 7]) }.to raise_error
    end
  end

  describe "Haversine distance" do
    it "accepts two arguments" do
      expect { Measurable.haversine([1, 2], [4, 5]) }.to_not raise_error
      expect { Measurable.haversine([1, 12], [4, 9], [2, 3]) }.to raise_error(ArgumentError)
    end
    
    it "should be symmetric"

    it "should return the correct value"
    
    it "should only work with [lat, long] vectors" do
      expect { Measurable.haversine([2, 4], [1, 3, 5, 7]) }.to raise_error
    end
  end
  
  describe "Jaccard distance" do
    it "accepts two arguments" do
      expect { Measurable.jaccard(@u, @v) }.to_not raise_error
      expect { Measurable.jaccard(@u, @v, @w) }.to raise_error(ArgumentError)
    end
    
    it "accepts one argument and returns the vector's norm"
        
    it "should be symmetric"

    it "should return the correct value"
    
    it "shouldn't work with vectors of different length"
  end
  
  describe "Binary Jaccard distance" do
    it "accepts two arguments"
    
    it "accepts one argument and returns the vector's norm"
        
    it "should be symmetric"

    it "should return the correct value"
    
    it "shouldn't work with vectors of different length"
  end
  
  describe "Max-min distance" do
    it "accepts two arguments" do
      expect { Measurable.maxmin(@u, @v) }.to_not raise_error
      expect { Measurable.maxmin(@u, @v, @w) }.to raise_error(ArgumentError)
    end
    
    it "accepts one argument and returns the vector's norm"
    
    it "should be symmetric" do
      Measurable.maxmin(@u, @v).should == Measurable.maxmin(@v, @u)
    end

    it "should return the correct value"

    it "shouldn't work with vectors of different length" do
      expect { Measurable.maxmin(@u, [1, 3, 5, 7]) }.to raise_error      
    end
  end
end
