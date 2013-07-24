module Measurable

  # call-seq:
  #     cosine(u, v) -> Float
  #
  # Calculate the similarity between the orientation of two vectors.
  #
  # See: http://en.wikipedia.org/wiki/Cosine_similarity
  #
  # * *Arguments* :
  #   - +u+ -> An array of Numeric objects.
  #   - +v+ -> An array of Numeric objects.
  # * *Returns* :
  #   - The normalized dot product of +u+ and +v+, that is, the angle between
  #     them in the n-dimensional space.
  # * *Raises* :
  #   - +ArgumentError+ -> The sizes of +u+ and +v+ doesn't match.
  #
  def cosine(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    dot_product = u.zip(v).reduce(0.0) { |acc, ary| acc += ary[0] * ary[1] }

    dot_product / (euclidean(u) * euclidean(v))
  end
end