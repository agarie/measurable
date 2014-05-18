require 'measurable/version'

# Distance measures. The require order is important.
require 'measurable/euclidean'
require 'measurable/minkowski'
require 'measurable/cosine'
require 'measurable/jaccard'
require 'measurable/tanimoto'
require 'measurable/chebyshev'
require 'measurable/maxmin'
require 'measurable/haversine'
require 'measurable/hamming'
require 'measurable/levenshtein'
require 'measurable/kullback_leibler'

module Measurable
  # PI / 180 degrees.
  RAD_PER_DEG = Math::PI / 180
end
