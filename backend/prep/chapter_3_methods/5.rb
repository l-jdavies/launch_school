# 1) Edit the method definition in exercise #4 so that it does print words on the screen. 2) What does it return now?

def scream(words)
  words = words + "!!!!"
  p words
end

scream("Yippeee")


# By removing `return` and replacing `puts` with `p` "Yippeee!!!!" will be printed to terminal and returned.
