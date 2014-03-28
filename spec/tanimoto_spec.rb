describe "Tanimoto distance" do

  before :all do
    @u = [1, 0, 1]
    @v = [1, 1, 1]
    @w = [0, 1, 0]
  end

  it "accepts two arguments" do
    expect { Measurable.tanimoto(@u, @v) }.to_not raise_error
    expect { Measurable.tanimoto(@u, @v, @w) }.to raise_error(ArgumentError)
  end

  it "should be symmetric" do
    x = Measurable.tanimoto(@u, @v)
    y = Measurable.tanimoto(@v, @u)

    x.should be_within(TOLERANCE).of(y)
  end

  it "should return the correct value" do
    x = Measurable.tanimoto(@u, @v)

    x.should be_within(TOLERANCE).of(-Math.log2(1.0 / 2.0))
  end

  it "shouldn't work with vectors of different length" do
    expect { Measurable.tanimoto(@u, [1, 3, 5, 7]) }.to raise_error(ArgumentError)
  end
end
