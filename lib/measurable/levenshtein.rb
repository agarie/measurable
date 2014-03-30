module Measurable
  module Levenshtein

    def levenshtein(u, v)
      return 0 if u == v
      return u.size if v.size == 0
      return v.size if u.size == 0

      matrix = Array.new(u.size+1) { (0..v.size).to_a }

      if v.size < u.size
        u, v = v, u
      end

      (1..u.size).each do |i|
        (1..v.size).each do |j|
          if u[i] == v[j]
            matrix[i][j] = matrix[i-1][j-1]
          else
            matrix[i][j] = [
              matrix[i-1][j] + 1,   # deletion
              matrix[i][j-1] + 1,   # insertion
              matrix[i-1][j-1] + 1, # substitution
            ].min
          end
        end
      end

      matrix[u.size][v.size]
    end
  end

  extend Measurable::Levenshtein
end
