describe "Jaccard" do

  context "Index" do
    before :all do
      @u = [1, 3, 16]
      @v = [1, 4, 16]
      @w = [4, 5, 6]
    end

    it "accepts two arguments" do
      expect { Measurable.jaccard_index(@u, @v) }.to_not raise_error
      expect { Measurable.jaccard_index(@u, @v, @w) }.to raise_error(ArgumentError)
    end

    it "should be symmetric" do
      x = Measurable.jaccard_index(@u, @v)
      y = Measurable.jaccard_index(@v, @u)

      x.should be_within(TOLERANCE).of(y)
    end

    it "should return the correct value"

    it "shouldn't work with vectors of different length" do
      expect { Measurable.jaccard_index(@u, [1, 2, 3, 4]) }.to raise_error
    end
  end

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

    it "shouldn't work with vectors of different length" do
      expect { Measurable.jaccard(@u, [1, 2, 3, 4]) }.to raise_error
    end
  end
end