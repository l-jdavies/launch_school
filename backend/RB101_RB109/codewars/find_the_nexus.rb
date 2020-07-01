# Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.
# If nobody has an exact rank/honor match, return the rank of the user who comes closest.
# If there are several users who come closest, return the one with the lowest rank (numeric value).
# The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.
# INPUT
# hash
#
# OUTPUT
# hash key
#
# RULES
# if no hash keys match hash values exactly, return hash key with closest match
# if mulitple users are the nexus, return user with lowest rank
#
# ALGORITHM
#
# SET difference = 100
# SET nexus = []
#
# iterate over the `input_hsh` to access |k, v|
#   IF k is equal to v
#     add k and v to `nexus`
def nexus(hsh)
  nexus = []
  hsh.each do |k, v|
    nexus << k if k == v
  end

  return nexus.min if nexus.empty? == false
  
  difference = 1
  loop do

    hsh.each do |k, v|
      if k - v == difference || v - k == difference
        nexus << k
      else
        next
      end
    end

    if nexus.empty?
      difference += 1
    else
      return nexus.min
    end
  end
end

nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1})
