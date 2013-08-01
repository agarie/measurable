module Measurable

  # call-seq:
  #     chebyshev(u, v) -> Float
  #
  #
  #
  # * *Arguments* :
  #   - +u+ -> An array of Numeric objects.
  #   - +v+ -> An array of Numeric objects.
  # * *Returns* :
  #   - The L-infinite distance between +u+ and +v+.
  # * *Raises* :
  #   - +ArgumentError+ -> The sizes of +u+ and +v+ don't match.
  #
  def chebyshev(u, v)
    # TODO: Change this to a more specific, custom-made exception.
    raise ArgumentError if u.size != v.size

    abs_differences = u.zip(v).map { |a| (a[0] - a[1]).abs }
    abs_differences.max
  end
end