module Measurable

  # call-seq:
  #     hamming(s1, s2) -> Integer
  #
  #
  #
  # See: http://en.wikipedia.org/wiki/Cosine_similarity
  #
  # * *Arguments* :
  #   - +s1+ -> A String.
  #   - +s2+ -> A String with the same size of +s1+.
  # * *Returns* :
  #   - The number of characters in which +s1+ and +s2+ differ.
  # * *Raises* :
  #   - +ArgumentError+ -> The sizes of +s1+ and +s2+ don't match.
  #
  def hamming(s1, s2)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if s1.size != s2.size

    s1.chars.zip(s2.chars).reduce(0) do |acc, c|
      acc += 1 if c[0] != c[1]
      acc
    end
  end
end