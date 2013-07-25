describe "Max-min distance" do

  before :all do
    @u = [1, 3, 16]
    @v = [1, 4, 16]
    @w = [4, 5, 6]
  end

  it "accepts two arguments" do
    expect { Measurable.maxmin(@u, @v) }.to_not raise_error
    expect { Measurable.maxmin(@u, @v, @w) }.to raise_error(ArgumentError)
  end

  it "should be symmetric" do
    x = Measurable.maxmin(@u, @v)
    y = Measurable.maxmin(@v, @u)

    x.should be_within(TOLERANCE).of(y)
  end

  it "should return the correct value" do
    x = Measurable.maxmin(@u, @v)

    x.should be_within(TOLERANCE).of(0.9523809523)
  end

  it "shouldn't work with vectors of different length" do
    expect { Measurable.maxmin(@u, [1, 3, 5, 7]) }.to raise_error(ArgumentError)
  end
end