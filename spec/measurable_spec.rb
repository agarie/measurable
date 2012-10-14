require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Measurable do

  include Measurable

  let(:u) { NVector.new(3, [1, 3, 16]) }
  let(:v) { NVector.new(3, [1, 4, 16]) }
  let(:array) { [1, 1, 1] }

  describe "Euclidean distance" do
    it "should handle only two arguments" do
      expect { euclidean(:u) }.to raise_error(ArgumentError)
      expect { euclidean(:u, :v) }.to_not raise_error(ArgumentError)
      expect { euclidean(:u, :v, :array) }.to raise_error(ArgumentError)
    end
    
    it "should handle arrays" do
      expect { euclidean(:u, :array) }.to_not raise_error
    end
    
    it "should handle NVectors" do
      expect { euclidean(:u, :v) }.to_not raise_error
      expect { euclidean(:array, :array) }.to_not raise_error
    end

    it "should return the correct value" do
      euclidean(:u, :u).should == 0
      euclidean(:u, :v).should == 1
    end
    
    it "shouldn't work with vectors of different length" do
      expect { euclidean(:u, [2, 2, 2, 2]) }.to raise_error(DiffLengthError)
    end
  end

  describe "Cosine Similarity" do
    it "should return the correct result"

    it "should handle NaN's" do
      [0.0, 0.0].cosine_similarity([0.0, 0.0]).nan?.should be_false
    end
  end

  describe "Tanimoto Coefficient" do
    it "should return 1.0"

    it "should handle NaN's" do
      [0.0, 0.0].tanimoto_coefficient([0.0, 0.0]).nan?.should be_false
    end
  end

  describe "Jaccard" do
    describe "Jaccard Distance" do
      it "should return"
    end

    describe "Jaccard Index" do
      it "should return"
    end

    describe "Binary Jaccard Index" do
      it "should return 1/4" do
        [1,1,1,1].binary_jaccard_index([0,1,0,0]).should == 1/4.0
      end
    end
  end

  describe "Binary Jaccard Distance" do
    it "should return 0.75" do
      [1,1,1,1].binary_jaccard_distance([0,1,0,0]).should == 1 - (1/4.0)
    end
  end

  describe "Intersection" do
    it "should return"
  end

  describe "Union" do
    it "should return"
  end

  describe "Binary Intersection" do
    it "should return"
  end

  describe "Binary Union" do
    it "should return [1,1,1,0]" do
      [1,1,1,0].binary_union_with([0,0,0,0]).should == [1,1,1,0]
    end
  end
end
