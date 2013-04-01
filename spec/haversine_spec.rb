describe "Haversine distance" do
  
  before :all do
    @u = [1, 3]
    @v = [1, 4]
    @w = [4, 5]
  end
  
  it "accepts two arguments" do
    expect { Measurable.haversine(@u, @v) }.to_not raise_error
    expect { Measurable.haversine(@u, @v, @w) }.to raise_error(ArgumentError)
  end
  
  it "should be symmetric" do
    x = Measurable.haversine(@u, @v)
    y = Measurable.haversine(@v, @u)
    
    x.should be_within(TOLERANCE).of(y)
  end

  it "should return the correct value"
  
  it "should only work with [lat, long] vectors" do
    expect { Measurable.haversine([2, 4], [1, 3, 5, 7]) }.to raise_error
  end
end