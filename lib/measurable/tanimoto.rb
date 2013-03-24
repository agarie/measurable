# http://en.wikipedia.org/wiki/Jaccard_index#Tanimoto_coefficient_.28extended_Jaccard_coefficient.29
module Measurable
  class << self
    def tanimoto(u, v)
      dot = dot(u, v).to_f
      result = dot / (u.sum_of_squares + v.sum_of_squares - dot).to_f
    
      handle_nan(result)
    end
  end
end