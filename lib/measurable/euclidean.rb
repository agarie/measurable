module Measurable
  module Euclidean

    # call-seq:
    #     euclidean(u) -> Float
    #     euclidean(u, v) -> Float
    #
    # Calculate the ordinary distance between arrays +u+ and +v+.
    #
    # If +v+ isn't given, calculate the Euclidean norm of +u+.
    #
    # See: http://en.wikipedia.org/wiki/Euclidean_distance#N_dimensions
    #
    # Arguments:
    # - +u+ -> An array of Numeric objects.
    # - +v+ -> (Optional) An array of Numeric objects.
    # Returns:
    # - The euclidean norm of +u+ or the euclidean distance between +u+ and +v+.
    # Raises:
    # - +ArgumentError+ -> The sizes of +u+ and +v+ don't match.
    def euclidean(u, v = nil)
      Math.sqrt(self.euclidean_squared(u, v))
    end

    # call-seq:
    #     euclidean_squared(u) -> Float
    #     euclidean_squared(u, v) -> Float
    #
    # Calculate the same value as euclidean(u, v), but don't take the square root
    # of it.
    #
    # This isn't a metric in the strict sense, i.e. it doesn't respect the
    # triangle inequality. However, the squared Euclidean distance is very useful
    # whenever only the relative values of distances are important, for example
    # in optimization problems.
    #
    # See: http://en.wikipedia.org/wiki/Euclidean_distance#Squared_Euclidean_distance
    #
    # Arguments:
    # - +u+ -> An array of Numeric objects.
    # - +v+ -> (Optional) An array of Numeric objects.
    # Returns:
    # - The squared value of the euclidean norm of +u+ or of the euclidean
    #   distance between +u+ and +v+.
    # Raises:
    # - +ArgumentError+ -> The sizes of +u+ and +v+ don't match.
    def euclidean_squared(u, v = nil)
      # If the second argument is nil, the method should return the norm of
      # vector u. For this, we need the distance between u and the origin.
      if v.nil?
        v = Array.new(u.size, 0)
      end

      # TODO: Change this to a more specific, custom-made exception.
      raise ArgumentError if u.size != v.size

      u.zip(v).reduce(0.0) do |acc, ary|
        acc += (ary[0] - ary[-1]) ** 2
      end
    end
  end

  extend Measurable::Euclidean
end
