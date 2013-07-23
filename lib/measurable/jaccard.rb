# http://en.wikipedia.org/wiki/Jaccard_coefficient
module Measurable

  def jaccard_index(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    union = (u | v).size.to_f
    intersection = (u & v).size.to_f

    intersection / union
  end

  def jaccard(u, v)
    1 - jaccard_index(u, v)
  end

  def binary_jaccard_index(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    intersection = binary_intersection(u, v).delete_if {|x| x == 0}.size.to_f
    union = binary_union(u, v).delete_if {|x| x == 0}.size.to_f

    intersection / union
  end

  def binary_jaccard(u, v)
    1 - binary_jaccard_index(u, v)
  end
end