describe "Cosine distance" do
  
  before :all do
    @u = [1, 2]
    @v = [2, 3]
    @w = [4, 5]
  end
  
  it "accepts two arguments" do
    expect { Measurable.cosine(@u, @v) }.to_not raise_error
    expect { Measurable.cosine(@u, @v, @w) }.to raise_error(ArgumentError)
  end
  
  it "should be symmetric" do
    x = Measurable.cosine(@u, @v)
    y = Measurable.cosine(@v, @u)

    x.should be_within(TOLERANCE).of(y)
  end

  it "should return the correct value" do
    x = Measurable.cosine(@u, @v)
    x.should be_within(TOLERANCE).of(0.992277877)
  end

  it "shouldn't work with vectors of different length" do
    expect { Measurable.cosine(@u, [1, 3, 5, 7]) }.to raise_error
  end
end