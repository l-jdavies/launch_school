# Part 1 - understanding the requirements

**Understand the problem**
* Break down the problem into inputs and outputs
* Check the examples for any implict requirements
* When the problem is predominantly explained by examples, explain the example into everyday language
* How should failures be handled?
* Identify and define important terms and concepts
* Should you be returning or printing output or both?
* Model the problem
* Develop set of rule


**Develop example cases**
* Testing serves two purposes:
  - help understand the problem
  - allow verification of solutions
* Develop 'edge' cases'
  - focus on the different types on input permitted
  - how to deal with emptiness (nil/null, "", [], {})
  - boundary conditions - if end of range is 20, what happens if input in 19, 20 or 21
  - How to deal with upper or lowcase strings
* Failures?
  - raise exception/report errors
  - return a special value (null, 0, [], {})
* Ask questions to verify understanding


**Data Structure**
* Consider the form of the input and output data
* What are the requirements stated in the problem outline?
* Data type (for Ruby and JS) will be string, array, hash/object, number
* Consider the methods available for each data type
  * *String*
    - Able to perform concatenation, strip (removes leading and trailing whitespaces), reverse etc
    - Use regex to split, replace or match
  * *Array*
    - Use if need to iterate over data
    - Can use index to perform a function on specific elements
    - Can perform abstractions such as map, reduce, select and others
  * *Hash*
    - Use if need to create a lookup table or dictionary
    - Can simplify data so it can be accessed more easily 
  * *Number*
    - Can perform mathematical operations
    - Consider if number or number as string is best


**Algorithm**
* Describe the steps required to solve the problem in the language of chosen data structure (i.e. select elements in an array that are greater than 3)
 


Understanding the problem:

Input:


  *
  
  *

Output:

  *
  
  *

Rules:
  
  Explicit requirements:
  
  *
  
  Implicit requirements:
  
  *

Examples / test cases

(method call with arguments) => (expected output)

Data Structure:
  
  *
  
  *

Algorithm:
  
  *
  
  *
