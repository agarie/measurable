describe "Jaccard" do

  context "Index" do
    before :all do
      @u = [1, 0, 1]
      @v = [1, 1, 1]
      @w = [0, 1, 0]
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

    it "should return the correct value" do
      x = Measurable.jaccard_index(@u, @v)

      x.should be_within(TOLERANCE).of(1.0 / 2.0)
    end

    it "shouldn't work with vectors of different length" do
      expect { Measurable.jaccard_index(@u, [1, 2, 3, 4]) }.to raise_error(ArgumentError)
    end
  end

  context "Distance" do
    before :all do
      @u = [1, 0, 1]
      @v = [1, 1, 1]
      @w = [0, 1, 0]
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

    it "should return the correct value" do
      x = Measurable.jaccard(@u, @v)

      x.should be_within(TOLERANCE).of(1.0 / 2.0)
    end

    it "shouldn't work with vectors of different length" do
      expect { Measurable.jaccard(@u, [1, 2, 3, 4]) }.to raise_error(ArgumentError)
    end
  end
end
