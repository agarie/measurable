describe Measurable::Levenshtein do

  # def levenshtein(func, t, **kwargs):

  # # types; only for c
  # if kwargs["lang"] == "C":
  # 	try:
  # 		func(1, t("foo"))
  # 	except ValueError:
  # 		pass
  # 	try:
  # 		func(t("foo"), 1)
  # 	except ValueError:
  # 		pass
  #
  # # empty strings
  # assert func(t(""), t("")) == 0
  # assert func(t(""), t("abcd")) == func(t("abcd"), t("")) == 4
  #
  # # edit ops
  # assert func(t("aa"), t("aa")) == 0
  # assert func(t("ab"), t("aa")) == 1
  # assert func(t("ab"), t("a")) == 1
  # assert func(t("ab"), t("abc")) == 1

  it "handles empty strings" do
    Measurable.levenshtein("", "").should == 0
    Measurable.levenshtein("", "abcd").should == 4
    Measurable.levenshtein("abcd", "").should == 4
  end

  it "should return 0 for matching strings" do
    Measurable.levenshtein("aa", "aa").should == 0
  end

  it "should count insertion" do
    #Measurable.levenshtein("ab", "a").should == 1
    Measurable.levenshtein("ab", "abc").should == 1
  end

end
