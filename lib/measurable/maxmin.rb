module Measurable
  class << self
    def maxmin(u, v)
      sum_min, sum_max = u.zip(v).reduce([0.0, 0.0]) do |acc, attributes|
        acc[0] += attributes.min
        acc[-1] += attributes.max
        acc
      end
    
      sum_min / sum_max
    end
  end
end