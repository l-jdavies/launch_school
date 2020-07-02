## Initial thoughts on bonus features

1. **Keeping score**
* Create a `Score` class
* score will be kept in a object
* write method to declare winner
    * one method to declare game winner and another for overall winner?
    * increment score object within method
* need two display winner methods:
    * display game winner
    * display overall winner
* Might be too much duplication - might need a `Win` class

########################################################
Score
########################################################
* has a number_of_wins                  | * Win
                                        |
                                        |
                                        |
########################################################



#######################################################
Win
######################################################
* can determine the game winner        | * Win
* can determine the overall winner     |
                                       |
                                       |
#####################################################

2. **Add lizard and spock**
* Will need to update the `>` and `<` method to accomodate additional options
* Or maybe I should move those methods to a `Win` class?

3. **Add class for each move**
* Instead of using the `@value` instance variable to track each move, the move would be the initialization of a new class object
* Could get rid of all the `scissors?`, `rock?` etc methods

4. **Keep track of a history of moves**
* Could be part of the `move` class
* Could initialize an array within the move class and each time a `Rock`, `Paper` etc object is created, it could be added to the array
* Would I need a separate array for human and computer?
* I don't think so because the array will be associated with a `Human` or `Computer` class object

5. **Computer personalities**
* Easy enough to make one computer name always choose a particular play but no idea how to code making a random selection but with a preference to some options over others!


