require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Measurable do

  include Measurable

  let(:u) { NVector.new(3, [1, 3, 16]) }
  let(:v) { NVector.new(3, [1, 4, 16]) }
  let(:array) { [1, 1, 1] }

  describe "Euclidean distance" do
    it "accepts two arguments" do
      expect { euclidean(:u) }.to raise_error(ArgumentError)
      expect { euclidean(:u, :v) }.to_not raise_error(ArgumentError)
      expect { euclidean(:u, :v, :array) }.to raise_error(ArgumentError)
    end
    
    it "accepts one argument and returns the vector's norm"
    
    it "should handle arrays" do
      expect { euclidean(:u, :array) }.to_not raise_error
    end
    
    it "should handle NVectors" do
      expect { euclidean(:u, :v) }.to_not raise_error
      expect { euclidean(:array, :array) }.to_not raise_error
    end
    
    it "should be symmetric"

    it "should return the correct value" do
      euclidean(:u, :u).should == 0
      euclidean(:u, :v).should == 1
    end
    
    it "shouldn't work with vectors of different length" do
      expect { euclidean(:u, [2, 2, 2, 2]) }.to raise_error(DiffLengthError)
    end
  end

  describe "Cosine similarity measure" do
    it "accepts two arguments"
    
    it "accepts one argument and returns the vector's norm"
    
    it "should handle arrays"
    
    it "should handle NVectors"

    it "should handle NaN's"
    
    it "should be symmetric"

    it "should return the correct value"

    it "shouldn't work with vectors of different length"
  end
  
  
  describe "Chebyshev distance" do
    it "accepts two arguments"
    
    it "accepts one argument and returns the vector's norm"
    
    it "should handle arrays"
    
    it "should handle NVectors"
    
    it "should be symmetric"

    it "should return the correct value"
    
    it "shouldn't work with vectors of different length"
  end
  
  describe "Max-min similarity measure" do
    it "accepts two arguments"
    
    it "accepts one argument and returns the vector's norm"
    
    it "should handle arrays"
    
    it "should handle NVectors"
    
    it "should be symmetric"

    it "should return the correct value"

    it "shouldn't work with vectors of different length"
  end
end
