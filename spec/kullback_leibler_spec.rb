describe "Kullback-Leibler" do
  before :all do
    @p = [0.10, 0.15, 0.35, 0.25, 0.15]
    @q = [0.09, 0.13, 0.39, 0.22, 0.17]
    @uniform = [0.20, 0.20, 0.20, 0.20, 0.20]
  end

  context "Divergence" do
    it "accepts two arguments" do
      expect { Measurable.kullback_leibler(@p, @q) }.to_not raise_error
      expect { Measurable.kullback_leibler(@p, @q, []) }.to raise_error(ArgumentError)
    end

    it "shouldn't work with vectors of different length" do
      expect { Measurable.kullback_leibler(@p, [0.50, 0.50]) }.to raise_error(ArgumentError)
    end

    it "shouldn't be symmetric" do
      Measurable.kullback_leibler(@p, @q).should_not == Measurable.kullback_leibler(@q, @p)
    end

    it "should increase with dissimilarity" do
      Measurable.kullback_leibler(@p, @uniform).should > Measurable.kullback_leibler(@p, @q)
    end

    it "should return the correct value" do
      Measurable.kullback_leibler(@p, @uniform).should be_within(TOLERANCE).of 0.0960320738
    end

    it "can be extended separately" do
      klass = Class.new do
        extend Measurable::KullbackLeibler
      end

      klass.kullback_leibler(@p, @q).should be_within(TOLERANCE).of 0.007310294
    end

    it "can be included separately" do
      klass = Class.new do
        include Measurable::KullbackLeibler
      end

      klass.new.kullback_leibler(@p, @q).should be_within(TOLERANCE).of 0.007310294
    end
  end
end
