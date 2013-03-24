# http://en.wikipedia.org/wiki/Jaccard_coefficient
module Measurable
  
  def jaccard(u, v)
    1 - jaccard_index(u, v)
  end
  
  def jaccard_index(u, v)
    union = (u + v).uniq.size.to_f
    i = intersection(u, v).size.to_f
        
    i / union
  end
  
  def binary_jaccard(u, v)
    1 - binary_jaccard_index(u, v)
  end
  
  def binary_jaccard_index(u, v)
    i = binary_intersection(u, v).delete_if {|x| x == 0}.size.to_f
    union = binary_union(u, v).delete_if {|x| x == 0}.size.to_f
    
    i / union
  end
end