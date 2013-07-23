# http://en.wikipedia.org/wiki/Jaccard_index#Tanimoto_coefficient_.28extended_Jaccard_coefficient.29
module Measurable
  def tanimoto(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    dot_product = u.zip(v).reduce(0.0) { |acc, ary| acc += ary[0] * ary[1] }
    denominator = euclidean_squared(u) + euclidean_squared(v) - dot_product

    dot_product / denominator
  end
end