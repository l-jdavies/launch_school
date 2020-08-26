# Lets write a program that will translate RNA sequences into proteins. RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:
# 
# RNA: "AUGUUUUCU" => translates to
# 
# Codons: "AUG", "UUU", "UCU"
# => which become a polypeptide with the following sequence =>
# 
# Protein: "Methionine", "Phenylalanine", "Serine"
# There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise.
# 
# There are also four terminating codons (also known as 'STOP' codons); if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated. All subsequent codons after are ignored, like this:
# 
# RNA: "AUGUUUUCUUAAAUG" =>
# 
# Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>
# 
# Protein: "Methionine", "Phenylalanine", "Serine"
# Note the stop codon terminates the translation and the final methionine is not translated into the protein sequence.--
# 
# Below are the codons and resulting Amino Acids needed for the exercise.
# 
# Codon	Amino Acids
# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
# UCU, UCC, UCA, UCG	Serine
# UAU, UAC	Tyrosine
# UGU, UGC	Cysteine
# UGG	Tryptophan
# UAA, UAG, UGA	STOP
#
# PEDAC
# INPUTS
# string
#
# OUTPUTS
# string or array of strings
#
# DATA STRUCTURE
# use hash with RNA seq as key and amino acid as the value
#
# RULES
# need to create two class methods, both of which take an argument
# `of_codon` - translates three bp into single aa
# `of_rna` - takes RNA strand as argument and returns an array of aa as strings
# stop codons are not translated and terminates translation
# need to raise `InvalidCodonError` if input is not valid RNA seq
#
# ALGORITHM
# create hash `translation_hsh`
#
# `of_codon`
# determine if input is valid? if false, raise InvalidCodonError
# return the value associated with the key from `translation_hsh`
#
# `of_rna`
# split the string into array of triplets `triplet_arr`
# iterate over the array, passing each triplet into the `of_codon` method as an argument
# add the return value to `translated_arr`
# break the iteration if "STOP" is returned
# return `translated_arr`

TRANSLATION = {
  'AUG' => "Methionine",
  'UUU' => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UUA" => "Leucine",
  "UUG" => "Leucine",
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine",
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine",
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UGG" => "Tryptophan",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP"
}
require 'byebug'
class Translation
  def self.of_codon(seq)
    raise InvalidCodonError if invalid?(seq)

    TRANSLATION[seq]
  end

  def self.invalid?(seq)
    seq.match?(/[^AUCG]/)
  end

  def self.of_rna(seq)
    triplet_arr = split_seq(seq)
    translated = []

    triplet_arr.each do |triplet|
      break if self.of_codon(triplet) == "STOP"
      translated << self.of_codon(triplet)
    end
    translated
  end

  private

  def self.split_seq(seq)
    split = []
    arr = seq.chars

    until arr.empty?
      split << arr.shift(3).join
    end
    split
  end
end

class InvalidCodonError < StandardError

end

