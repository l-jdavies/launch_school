# Take everything you've learned so far and build a mortgage calculator
# (or car payment calculator -- it's the same thing).

# You'll need three pieces of information:

# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

# From the above, you'll need to calculate the following two things:

# monthly interest rate
# loan duration in months
# You can use the following formula:

# m = p * (j / (1 - (1 + j)**(-n)))

# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

################################################################################
# PEDAC PROCESS

# INPUTS:
# loan amount
# Annual Percentage Rate (APR)
# loan duration

# OUTPUTS:
# monthly payment amount

# RULES:
#	 Explicit requirements:
#		* convery APR to monthly rate
#		* loan duration in months
#		* clarify format of inputs i.e. APR as 5% or 0.5

#	Implicit requirements:
#		* Convert calculation result into dollar amount
#		* Return result to two decimal places?

# EXAMPLES:
# mortage_calculator(100_000, 5%, 1 year) = 8551.5856
# mortage_calculator(100_000, 10%, 12 years) = 1172.08540
# mortage_calculator(500_500, 1%, 12 years) = 3677.448542

# DATA STRUCTURE:
# The input type will be strings containing digits
# need to valid input and convert to floats
# Specify format user should input APR
# Specify if user should input loan duration in months or years
# Output should summarise the inputs plus return the monthly payment value

# ALGORITHM:
# * welcome user
# * request user for loan amount
# * check input is valid, if not produce error message
# * request user for APR
# * check input if valid, if not produce error message
# * divide APR by 12 to determine percentage per month
# * divide this value by 100 and save in variable
# * request user for loan duration in years
# * check if input is valid, if not produce error message
# * multiply duration by 12 and save in variable
# * pass loan amount, monthly percentage rate and duration(months) to equation
# * print monthly payment and summary of inputs to the user
# * ask user if they want to perform another calculation
# * thank user and close

##########################################################
require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  puts("=>#{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def float?(num)
  num.to_f.to_s == num && num.to_f > 0
end

# Welcome the user
prompt(MESSAGES['welcome'])

loop do # main loop
  # Get loan amount from the user
  loan_amount = ''
  loop do
    prompt(MESSAGES['amount'])
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt(MESSAGES['amount_error'])
    end
  end

  # Get loan APR from user
  loan_apr = ''
  loop do
    prompt(MESSAGES['apr'])
    loan_apr = gets.chomp
    if valid_number?(loan_apr)
      break
    else
      prompt(MESSAGES['apr_error'])
    end
  end

  # Convert annual percentage rate to monthly and convert to correct decimals
  loan_monthly_percentage = (loan_apr.to_f / 12) / 100

  # Get loan duration from user
  loan_duration = ''
  loop do
    prompt(MESSAGES['loan_length'])
    loan_duration = gets.chomp
    if integer?(loan_duration)
      break
    else
      prompt(MESSAGES['length_error'])
    end
  end

  # Convert loan duration in years to months
  loan_duration_months = loan_duration.to_f * 12

  # Perform calculation to determine monthly repayment

  monthly_result = loan_amount.to_f * \
                   (loan_monthly_percentage / \
                   (1 - (1 + loan_monthly_percentage) \
                   **(-loan_duration_months)))
  
  monthly_payment = format('%.2f', monthly_result)

  # Return the monthly repayment to the user
  puts prompt("Based on a loan amount of $#{loan_amount} \
              with a #{loan_apr}% APR paid over #{loan_duration} \
              years, your monthly repayment is $#{monthly_payment}.")

  # Ask user if they want to perform another calculation
  prompt(MESSAGES['repeat_operation'])
  answer = gets.chomp
  if answer.downcase == 'y'
    system "clear"
  else
    break
  end
end # end of main loop

prompt(MESSAGES['thank_you'])


