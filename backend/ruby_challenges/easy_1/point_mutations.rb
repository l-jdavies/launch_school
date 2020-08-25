# Write a program that can calculate the Hamming distance between two DNA strands.

# The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

class DNA
  def initialize(seq)
    @dna_seq = seq
  end

  def hamming_distance(seq2)
    if @dna_seq.size > seq2.size
      shortest = seq2
      comparison = @dna_seq
    else
      shortest = @dna_seq
      comparison = seq2
    end
     
    mutations = 0

    shortest.each_char.with_index do |base, idx|
      mutations += 1 if comparison[idx] != base 
    end

    mutations
  end
end
