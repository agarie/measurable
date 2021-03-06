describe "Chebyshev distance" do

  before :all do
    @u = [1.4, 2.5, 5.8]
    @v = [2.2, 3.6, 2.7]
    @w = [4.1, 5.7, 1.2]
  end

  it "accepts two arguments" do
    expect { Measurable.chebyshev(@u, @v) }.to_not raise_error
    expect { Measurable.chebyshev(@u, @v, @w) }.to raise_error(ArgumentError)
  end

  it "should be symmetric" do
    x = Measurable.chebyshev(@u, @v)
    y = Measurable.chebyshev(@v, @u)

    expect(x).to be_within(TOLERANCE).of(y)
  end

  it "should return the correct value" do
    x = Measurable.chebyshev(@u, @v)
    expect(x).to be_within(TOLERANCE).of(3.1)
  end

  it "shouldn't work with vectors of different length" do
    expect { Measurable.chebyshev(@u, [1, 3, 5, 7]) }.to raise_error(ArgumentError)
  end

  it "can be extended separately" do
    klass = Class.new do
      extend Measurable::Chebyshev
    end

    x = klass.chebyshev(@u, @v)
    expect(x).to be_within(TOLERANCE).of(3.1)
  end

  it "can be included separately" do
    klass = Class.new do
      include Measurable::Chebyshev
    end

    x = klass.new.chebyshev(@u, @v)
    expect(x).to be_within(TOLERANCE).of(3.1)
  end

end
