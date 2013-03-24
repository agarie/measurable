require 'measurable/version.rb'

# Distance measures.
reqiore 'measurable/euclidean'
require 'measurable/cosine'
require 'measurable/tanimoto_coefficient'
require 'measurable/jaccard'
require 'measurable/haversine'
require 'measurable/maxmin'

module Measurable
  # PI = 3.1415926535
  RAD_PER_DEG = 0.017453293  #  PI/180

  def binary_union(u, v)
    unions = []
    u.each_with_index do |n, index|
      if n == 1 || v[index] == 1
        unions << 1
      else
        unions << 0
      end
    end

    unions
  end

  def binary_intersection(u, v)
    intersects = []
    u.each_with_index do |n, index|
      if n == 1 && v[index] == 1
        intersects << 1
      else
        intersects << 0
      end
    end

    intersects
  end

  # Checks if we"re dealing with NaN"s and will return 0.0 unless
  # handle NaN"s is set to false
  def handle_nan(result)
    result.nan? ? 0.0 : result
  end
end
