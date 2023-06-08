class DNA
  def initialize(strand)
    @seq = strand
  end

  def hamming_distance(other)
    shorter, longer = [@seq, other].sort_by(&:length).map(&:chars)
    points = shorter.zip(longer)
    points.select { |pair| pair.uniq.size > 1 }.size
  end
end


## Algoirthm ##
# hamming distance calculation
#   1) express both DNA strand strings as arrays of characters
#   2) leverage the `zip` function to create a 2-d nested array, `points` where each subarray contains index-corresponding values from each of the two DNA strand arrays. 
#       > note: for unequal length strands, we are to calculate the distance over the shorter length -- so we need to base the receiving object and argument for `zip` based on the lengths of the two strands
#   3) Remove all subarrays from `points` that have the same value. 
#   4) Count up and return the remaining elements in `points`

# strand = 'GACTACGGACAGGGTAGGGAAT'
# distance = 'GACATCGCACACC'
# 
# dna1 = DNA.new(strand)
# 
# p dna1.hamming_distance(distance)