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
  # See: http://en.wikipedia.org/wiki/Jaccard_coefficient
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

    intersection = u & v
    union = u | v

    intersection.length.to_f / union.length
  end

  # call-seq:
  #     jaccard(u, v) -> Float
  #
  # The jaccard distance is a measure of dissimilarity between two sets. It is
  # calculated as:
  #   jaccard_distance = 1 - jaccard_index
  #
  # This is a proper metric, i.e. the following conditions hold:
  #   - Symmetry:              jaccard(u, v) == jaccard(v, u)
  #   - Non-negative:          jaccard(u, v) >= 0
  #   - Coincidence axiom:     jaccard(u, v) == 0 if u == v
  #   - Triangular inequality: jaccard(u, v) <= jaccard(u, w) + jaccard(w, v)
  #
  # * *Arguments* :
  #   - +u+ -> Array of 1s and 0s.
  #   - +v+ -> Array of 1s and 0s.
  # * *Returns* :
  #   - Float value representing the dissimilarity between +u+ and +v+.
  # * *Raises* :
  #   - +ArgumentError+ -> The size of the input arrays doesn't match.
  #
  def jaccard(u, v)
    1 - jaccard_index(u, v)
  end
end
