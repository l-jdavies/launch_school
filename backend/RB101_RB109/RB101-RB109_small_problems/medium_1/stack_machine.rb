# INPUT
# strings contaiing chain of commands
#
# OUTPUT
# print stack if input string contains the command PRINT
# otherwise, no output
#
# RULES
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value 

# ALGORITHM
# initializethe stack as an empty array
# initialise the register as 0
# split the input string into an array of words
# iterate over each word in the array
# use a case statement to perform an action based on command

def minilang(str)
  stack = []
  register = 0

  str.split.each do |command|
    case command
    when 'PUSH' then stack.push(register)
    when 'ADD'  then register += stack.pop
    when 'SUB'  then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV'  then register /= stack.pop
    when 'MOD'  then register %= stack.pop
    when 'POP'  then register  = stack.pop
    when 'PRINT' then        puts register
    else                     register = command.to_i
    end
  end
end
