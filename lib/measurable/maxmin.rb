module Measurable
  module Maxmin

    # call-seq:
    #     maxmin(u, v) -> Float
    #
    # The "Max-min distance" is used to measure similarity between two vectors.
    #
    # When used in k-means clustering, this similarity measure can give better
    # results in some datasets, as pointed out in the paper "K-means clustering
    # using Max-min distance measure" --- Visalakshi, N. K.; Suguna, J.
    #
    # See: http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=05156398
    #
    # * *Arguments* :
    #   - +u+ -> An array of Numeric objects.
    #   - +v+ -> An array of Numeric objects.
    # * *Returns* :
    #   - Similarity between +u+ and +v+.
    # * *Raises* :
    #   - +ArgumentError+ -> The sizes of +u+ and +v+ don't match.
    #
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

  extend Measurable::Maxmin
end
