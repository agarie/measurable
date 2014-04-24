describe Measurable::Levenshtein do

  it "can be extended seperately" do
    klass = Class.new do
      extend Measurable::Levenshtein
    end

    klass.levenshtein("ab", "abc").should == 1
  end

  it "can be included seperately" do
    klass = Class.new do
      include Measurable::Levenshtein
    end

    klass.new.levenshtein("ab", "abc").should == 1
  end

  context "strings" do

    it "handles empty" do
      Measurable.levenshtein("", "").should == 0
      Measurable.levenshtein("", "abcd").should == 4
      Measurable.levenshtein("abcd", "").should == 4
    end

    it "should not count equality" do
      Measurable.levenshtein("aa", "aa").should == 0
    end

    it "should count deletion" do
      Measurable.levenshtein("ab", "a").should == 1
    end

    it "should count insertion" do
      Measurable.levenshtein("ab", "abc").should == 1
    end

    it "should count substitution" do
      Measurable.levenshtein("aa", "ab").should == 1
    end

  end

  context "arrays" do

    it "handles empty" do
      Measurable.levenshtein([], []).should == 0
      Measurable.levenshtein([], %w[ a b c d ]).should == 4
      Measurable.levenshtein(%w[ a b c d ], []).should == 4
    end

    it "should not count equality" do
      Measurable.levenshtein(%w[ a ], %w[ a ]).should == 0
    end

    it "should count deletion" do
      Measurable.levenshtein(%w[ a b ], %w[ a ]).should == 1
    end

    it "should count insertion" do
      Measurable.levenshtein(%w[ a b ], %w[ a b c ]).should == 1
    end

    it "should count substitution" do
      Measurable.levenshtein(%w[ a a ], %w[ a b ]).should == 1
    end

  end

end
