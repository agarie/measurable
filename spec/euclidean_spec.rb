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
      expect { Measurable.euclidean(@u, [2, 2, 2, 2]) }.to raise_error(ArgumentError)
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
      expect { Measurable.euclidean_squared(@u, [2, 2, 2, 2]) }.to raise_error(ArgumentError)
    end
  end
end