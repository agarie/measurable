# Notes:
#
# translated into Ruby based on information contained in:
# http://mathforum.org/library/drmath/view/51879.html
# Dr. Rick and Dr. Peterson - 4/20/99
#
# http://www.movable-type.co.uk/scripts/latlong.html
# http://en.wikipedia.org/wiki/Haversine_formula
#
# This formula can compute accurate distances between two points given latitude
# and longitude, even for short distances.

module Measurable

  R_MILES = 3956     # radius of the great circle in miles
  R_KM = 6371        # radius in kilometers...some algorithms use 6367
  
  # the great circle distance d will be in whatever units R is in
  R = {
    :miles => R_MILES,
    :km => R_KM,
    :feet => R_MILES * 5282,
    :meters => R_KM * 1000
  }

  def haversine(u, v, um = :meters)
    dlon = u[1] - v[1]
    dlat = u[0] - v[0]

    dlon_rad = dlon * RAD_PER_DEG 
    dlat_rad = dlat * RAD_PER_DEG

    lat1_rad = v[0] * RAD_PER_DEG
    lon1_rad = v[1] * RAD_PER_DEG

    lat2_rad = u[0] * RAD_PER_DEG
    lon2_rad = u[1] * RAD_PER_DEG

    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

    R[um] * c
  end
end