Write out pseudo-code (both casual and formal) that does the following:

1. a method that returns the sum of two integers.

**Casual**
* Print a message to screen asking user to input the first integer
* Save the first integer 
* Print a message to screen asking user to input the second integer
* Save the second integer 
* Return the value of the sum of integer 1 and 2

**Formal**
```
START

GET Integer 1 from the user

SET saved_number_1 = user input

GET Integer_2 from the user

SET saved_number_2 = user input

RETURN saved_number_1 + saved_number_2

END
```
2. a method that takes an array of strings, and returns a string that is all those strings concatenated together.

**Casual**

* Is the array a nested array? We will assume not
* Save the first string as the first element to be concatenated
* Iterate over an array and add each individual string to the previous string/s
* Problem is return concatenated string, not print
* Return when all strings in the array have been added to the previous string

**Formal**
```
START

Given an array containing strings called "arr"

SET which string in the array should be the first string

SET index position arr[0]

SET concatenated_string = nil

WHILE index < size of the array
  
  Access array elements at each of the index positions and and to concatenated_string
  
  index_postiion +=1

END
```
3. a method that takes an array of integers, and returns a new array with every other element

**Casual**

* Save the first integer in a new array
* Loop over the array and access every other element
* Add every other element to the new array
* Break when all elements in the array have been looped over
* Return the new array

**Formal**
```
START

Provided with an array of integers called arr_integers

SET new_arr = [ ]

SET index_value = 0

WHILE 
  
  index_value < length of arr_integers and index_value is odd
    
  Add integer to new_arr

BREAK when the index_value == length of arr_integers

END
```




