module Measurable

  # call-seq:
  #     minkowski(u, v) -> Numeric
  #
  # Calculate the sum of the absolute value of the differences between each
  # coordinate of +u+ and +v+.
  #
  # * *Arguments* :
  #   - +u+ -> An array of Numeric objects.
  #   - +v+ -> An array of Numeric objects.
  # * *Returns* :
  #   - The Minkowski (or L1) distance between +u+ and +v+.
  # * *Raises* :
  #   - +ArgumentError+ -> The sizes of +u+ and +v+ doesn't match.
  #
  def minkowski(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    u.zip(v).reduce(0) do |acc, elem|
      acc += (elem[0] - elem[1]).abs
    end
  end

  alias :cityblock :minkowski
  alias :manhattan :minkowski
end