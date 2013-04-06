describe Measurable do

  describe "Binary union" do
    before :each do
      @u = [1, 0, 1]
      @v = [0, 1, 1]
    end
    
    it "should work properly" do
      Measurable.binary_union(@u, @v).should == [1, 1, 1]
    end
  end

  describe "Binary intersection" do
    before :each do
      @u = [1, 0, 1]
      @v = [0, 1, 1]
    end

    it "should work properly" do
      Measurable.binary_intersection(@u, @v).should == [0, 0, 1]
    end
  end
end