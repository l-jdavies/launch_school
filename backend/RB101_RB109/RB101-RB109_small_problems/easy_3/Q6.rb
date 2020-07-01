def true_or_false(arg_1, arg_2)
  return true if arg_1 && !arg_2
  return true if arg_2 && !arg_1
end
