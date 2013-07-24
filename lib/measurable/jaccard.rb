module Measurable

  # call-seq:
  #     jaccard_index(u, v) -> Float
  #
  # Give the similarity between two binary vectors +u+ and +v+. Calculated as:
  #  jaccard_index = |intersection| / |union|
  #
  # In which intersection and union refer to +u+ and +v+ and |x| is the
  # cardinality of set x.
  #
  # For example:
  #   jaccard_index([1, 0, 1], [1, 1, 1]) == 0.666...
  #
  # Because |intersection| = |(1, 0, 1)| = 2 and |union| = |(1, 1, 1)| = 3.
  #
  # http://en.wikipedia.org/wiki/Jaccard_coefficient
  #
  # * *Arguments* :
  #   - +u+ -> Array of 1s and 0s.
  #   - +v+ -> Array of 1s and 0s.
  # * *Returns* :
  #   - Float value representing the Jaccard similarity coefficient between
  #     +u+ and +v+.
  # * *Raises* :
  #   - +ArgumentError+ -> The size of the input arrays doesn't match.
  #
  def jaccard_index(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    intersection = u.zip(v).reduce(0) do |acc, elem|
      elem[0] == elem[1] ? (acc + 1) : acc
    end

    union = u.zip(v).reduce(0) do
      |acc, elem| elem[0] * elem[1] == 1 ? (acc + 1) : acc
    end

    intersection.to_f / union
  end

  def jaccard(u, v)
    1 - jaccard_index(u, v)
  end
end