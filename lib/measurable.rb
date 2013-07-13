require 'measurable/version'

# Distance measures.
require 'measurable/euclidean'
require 'measurable/cosine'
require 'measurable/tanimoto'
require 'measurable/jaccard'
require 'measurable/haversine'
require 'measurable/maxmin'

module Measurable
  extend self # expose all instance methods as singleton methods.

  # PI = 3.1415926535
  RAD_PER_DEG = 0.017453293  #  PI/180

  def binary_union(u, v)
    unions = []
    u.each_with_index do |i, index|
      if v[i] == 1 || v[index] == 1
        unions << 1
      else
        unions << 0
      end
    end

    unions
  end

  def binary_intersection(u, v)
    intersects = []
    u.each_with_index do |i, index|
      if v[i] == 1 && v[index] == 1
        intersects << 1
      else
        intersects << 0
      end
    end

    intersects
  end
end
