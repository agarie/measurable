describe "Hamming distance" do

  before :all do
    @u = "Hi, I'm a test string!"
    @v = "Hello, not a test omg."
    @w = "Hey there, a test wtf!"
  end

  it "accepts two arguments" do
    expect { Measurable.hamming(@u, @v) }.to_not raise_error
    expect { Measurable.hamming(@u, @v, @w) }.to raise_error(ArgumentError)
  end

  it "should be symmetric" do
    x = Measurable.hamming(@u, @v)
    y = Measurable.hamming(@v, @u)

    x.should be(y)
  end

  it "should return the correct value" do
    x = Measurable.hamming(@u, @v)
    x.should be(17)
  end

  it "shouldn't work with strings of different length" do
    expect { Measurable.hamming(@u, "smallstring") }.to raise_error(ArgumentError)
    expect { Measurable.hamming(@u, "largestring" * 20) }.to raise_error(ArgumentError)
  end
end