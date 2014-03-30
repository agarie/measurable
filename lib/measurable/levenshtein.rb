module Measurable
  module Levenshtein

    def levenshtein(u, v)
      v_size = v.size
      u_size = u.size
      return v_size if u_size == 0
      return u_size if v_size == 0
      cost = u_size == v_size ? 0 : 1

      [
        (levenshtein(u, v[1,v_size-1]) + 1),
        (levenshtein(u[1,u_size-1], v) + 1),
        (levenshtein(u[1,u_size-1], v[1,v_size-1]) + cost)
      ].min
    end
  end

  extend Measurable::Levenshtein
end
