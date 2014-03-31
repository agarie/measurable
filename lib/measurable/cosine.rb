require 'measurable/euclidean'

module Measurable
  module Cosine

    # call-seq:
    #     cosine_similarity(u, v) -> Float
    #
    # Calculate the cosine similarity between the orientation of two vectors.
    #
    # See: http://en.wikipedia.org/wiki/Cosine_similarity
    #
    # * *Arguments* :
    #   - +u+ -> An array of Numeric objects.
    #   - +v+ -> An array of Numeric objects.
    # * *Returns* :
    #   - The normalized dot product of +u+ and +v+, that is, the angle between
    #     them in the n-dimensional space.
    # * *Raises* :
    #   - +ArgumentError+ -> The sizes of +u+ and +v+ don't match.
    #
    def cosine_similarity(u, v)
      # TODO: Change this to a more specific, custom-made exception.
      raise ArgumentError if u.size != v.size

      dot_product = u.zip(v).reduce(0.0) { |acc, ary| acc += ary[0] * ary[1] }

      dot_product / (euclidean(u) * euclidean(v))
    end

    # call-seq:
    #     cosine_distance(u, v) -> Float
    #
    # Calculate the cosine distance between the orientation of two vectors.
    #
    # See: http://en.wikipedia.org/wiki/Cosine_similarity
    #
    # * *Arguments* :
    #   - +u+ -> An array of Numeric objects.
    #   - +v+ -> An array of Numeric objects.
    # * *Returns* :
    #   - The normalized dot product of +u+ and +v+, that is, the angle between
    #     them in the n-dimensional space.
    # * *Raises* :
    #   - +ArgumentError+ -> The sizes of +u+ and +v+ don't match.
    #
    def cosine_distance(u, v)
      # TODO: Change this to a more specific, custom-made exception.
      raise ArgumentError if u.size != v.size

      1 - cosine_similarity(u, v)
    end

    def self.extended(klass) # :nodoc:
      klass.extend Measurable::Euclidean
      super
    end

    def self.included(klass) # :nodoc:
      klass.include Measurable::Euclidean
      super
    end
  end

  extend Measurable::Cosine
end
