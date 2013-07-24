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

  # PI / 180 degrees.
  RAD_PER_DEG = Math::PI / 180
end
