module Measurable

  # Earth radius in miles.
  EARTH_RADIUS_IN_MILES = 3956

  # Earth radius in kilometers. Some algorithms use 6367.
  EARTH_RADIUS_IN_KILOMETERS = 6371

  # The great circle distance returned will be in whatever units R is in.
  # Provides
  EARTH_RADIUS = {
    :miles => EARTH_RADIUS_IN_MILES,
    :km => EARTH_RADIUS_IN_KILOMETERS,
    :feet => EARTH_RADIUS_IN_MILES * 5282,
    :meters => EARTH_RADIUS_IN_KILOMETERS * 1000
  }

  # call-seq:
  #     haversine(u, v) -> Float
  #
  # Compute accurate distances between two points given their latitudes and
  # longitudes, even for short distances. This isn't a distance measure in the
  # same sense as the other methods in +Measurable+.
  #
  # The distance returned is the great circle (or orthodromic) distance between
  # +u+ and +v+, which is the shortest distance between them on the surface of
  # a sphere. Thus, this implementation considers the Earth to be a sphere.
  #
  # Reminding that the input vectors are of the form [latitude, longitude] in
  # degrees, so if you have the coordinates [23 32' S, 46 37' W] (from São
  # Paulo), the corresponding vector is [-23.53333, -46.61667].
  #
  # References:
  # - http://www.movable-type.co.uk/scripts/latlong.html
  # - http://en.wikipedia.org/wiki/Haversine_formula
  # - http://en.wikipedia.org/wiki/Great-circle_distance
  #
  # * *Arguments* :
  #   - +u+ -> An array of Numeric objects.
  #   - +v+ -> An array of Numeric objects.
  #   - +unit+ -> (Optional) A Symbol representing the unit of measure. Available
  #               options are +:miles+, +:feet+, +:km+ and +:meters+.
  # * *Returns* :
  #   - The great circle distance between +u+ and +v+.
  # * *Raises* :
  #   - +ArgumentError+ -> The size of +u+ and +v+ must be 2.
  #   - +ArgumentError+ -> +unit+ must be a Symbol.
  #
  def haversine(u, v, unit = :meters)
    # TODO: Create better exceptions.
    raise ArgumentError if u.size != 2 || v.size != 2
    raise ArgumentError if unit.class != Symbol

    dlat = u[0] - v[0]
    dlon = u[1] - v[1]

    dlon_rad = dlon * RAD_PER_DEG
    dlat_rad = dlat * RAD_PER_DEG

    lat1_rad = v[0] * RAD_PER_DEG
    lon1_rad = v[1] * RAD_PER_DEG

    lat2_rad = u[0] * RAD_PER_DEG
    lon2_rad = u[1] * RAD_PER_DEG

    a = (Math.sin(dlat_rad / 2)) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad / 2)) ** 2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    EARTH_RADIUS[unit] * c
  end
end