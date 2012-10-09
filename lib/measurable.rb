$:.unshift(File.dirname(__FILE__) + "/../lib")

require "measurable/version.rb"

require "measurable/cosine_similarity"
require "measurable/tanimoto_coefficient"
require "measurable/jaccard"
require "measurable/haversine"

require "measurable.so"

class Array
  include Measurable

  # http://en.wikipedia.org/wiki/Intersection_(set_theory)
  def intersection_with(other)
    (self & other)
  end

  # http://en.wikipedia.org/wiki/Union_(set_theory)
  def union_with(other)
    (self + other).uniq
  end

  private

  # Checks if we"re dealing with NaN"s and will return 0.0 unless
  # handle NaN"s is set to false
  def handle_nan(result)
    result.nan? ? 0.0 : result
  end
end