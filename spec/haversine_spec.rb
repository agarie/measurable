describe "Haversine distance" do

  before :all do
    # We have very big errors in this formula, due to:
    #   - The Earth is considered a sphere.
    #   - Earth's radius is considered constant (same as above).
    #
    # Given these conditions, I'll just assume the error to be less than 1.
    # TODO: Calculate better error estimates.
    @haversine_tolerance = 1

    @u = [ 35.66667, 139.75] # Tokyo: 35 40' N, 139 45' E.
    @v = [-23.53333, -46.61667] # São Paulo: 23 32' S, 46 37' W.
  end

  it "accepts two arguments" do
    expect { Measurable.haversine(@u, @v) }.to_not raise_error
    expect { Measurable.haversine(@u, @v, [-24.5, 40.23]) }.to raise_error(ArgumentError)
  end

  it "should be symmetric" do
    x = Measurable.haversine(@u, @v)
    y = Measurable.haversine(@v, @u)

    x.should be_within(TOLERANCE).of(y)
  end

  it "should return the correct value" do
    x = Measurable.haversine(@u, @v, :km)

    x.should be_within(@haversine_tolerance).of(18533)
  end

  it "should only work with [lat, long] vectors" do
    expect { Measurable.haversine([2, 4], [1, 3, 5, 7]) }.to raise_error(ArgumentError)
  end
end