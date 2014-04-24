describe "Cosine" do

  context "Similarity" do
    before :all do
      @u = [1, 2]
      @v = [2, 3]
      @w = [4, 5]
    end

    it "accepts two arguments" do
      expect { Measurable.cosine_similarity(@u, @v) }.to_not raise_error
      expect { Measurable.cosine_similarity(@u, @v, @w) }.to raise_error(ArgumentError)
    end

    it "should be symmetric" do
      x = Measurable.cosine_similarity(@u, @v)
      y = Measurable.cosine_similarity(@v, @u)

      x.should be_within(TOLERANCE).of(y)
    end

    it "should return the correct value" do
      x = Measurable.cosine_similarity(@u, @v)
      x.should be_within(TOLERANCE).of(0.992277877)
    end

    it "shouldn't work with vectors of different length" do
      expect { Measurable.cosine_similarity(@u, [1, 3, 5, 7]) }.to raise_error(ArgumentError)
    end

    it "can be extended separately" do
      klass = Class.new do
        extend Measurable::Cosine
      end
      x = klass.cosine_similarity(@u, @v)
      x.should be_within(TOLERANCE).of(0.992277877)
    end

    it "can be extended separately" do
      klass = Class.new do
        include Measurable::Cosine
      end
      x = klass.new.cosine_similarity(@u, @v)
      x.should be_within(TOLERANCE).of(0.992277877)
    end
  end

  context "Distance" do
    before :all do
      @u = [1, 2]
      @v = [2, 3]
      @w = [4, 5]
    end

    it "accepts two arguments" do
      expect { Measurable.cosine_distance(@u, @v) }.to_not raise_error
      expect { Measurable.cosine_distance(@u, @v, @w) }.to raise_error(ArgumentError)
    end

    it "should be symmetric" do
      x = Measurable.cosine_distance(@u, @v)
      y = Measurable.cosine_distance(@v, @u)

      x.should be_within(TOLERANCE).of(y)
    end

    it "should return the correct value" do
      x = Measurable.cosine_distance(@u, @v)
      # TODO: Use a real example.
      x.should be_within(TOLERANCE).of(1.0 - 0.992277877)
    end

    it "shouldn't work with vectors of different length" do
      expect { Measurable.cosine_distance(@u, [1, 3, 5, 7]) }.to raise_error(ArgumentError)
    end
  end
end
