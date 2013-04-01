describe "Jaccard" do
  
  context "Distance" do
    before :all do
      @u = [1, 3, 16]
      @v = [1, 4, 16]
      @w = [4, 5, 6]
    end
  
    it "accepts two arguments" do
      expect { Measurable.jaccard(@u, @v) }.to_not raise_error
      expect { Measurable.jaccard(@u, @v, @w) }.to raise_error(ArgumentError)
    end
          
    it "should be symmetric" do
      x = Measurable.jaccard(@u, @v)
      y = Measurable.jaccard(@v, @u)
    
      x.should be_within(TOLERANCE).of(y)
    end

    it "should return the correct value"
  
    it "shouldn't work with vectors of different length"
  end
  
  context "Binary Distance" do
    before :all do
      @u = [1, 3, 16]
      @v = [1, 4, 16]
      @w = [4, 5, 6]
    end

    it "accepts two arguments" do
      expect { Measurable.binary_jaccard(@u, @v) }.to_not raise_error
      expect { Measurable.binary_jaccard(@u, @v, @w) }.to raise_error(ArgumentError)
    end
          
    it "should be symmetric" do
      x = Measurable.binary_jaccard(@u, @v)
      y = Measurable.binary_jaccard(@v, @u)
    
      x.should be_within(TOLERANCE).of(y)
    end

    it "should return the correct value"
  
    it "shouldn't work with vectors of different length" 
  end
end