module Measurable
  def maxmin(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    sum_min, sum_max = u.zip(v).reduce([0.0, 0.0]) do |acc, attributes|
      acc[0] += attributes.min
      acc[1] += attributes.max
      acc
    end

    sum_min / sum_max
  end
end