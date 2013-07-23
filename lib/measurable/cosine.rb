module Measurable
  def cosine(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    dot_product = u.zip(v).reduce(0.0) { |acc, ary| acc += ary[0] * ary[1] }

    dot_product / (euclidean(u) * euclidean(v))
  end
end