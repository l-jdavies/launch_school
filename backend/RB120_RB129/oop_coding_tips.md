## General tips:

1. **Explore the problem before design**
It's difficult to determine all the required classes and methods when you first approach a problem. Take the time to explore the problem and with a **spike**, which is exploratory code. This can help validate hunches and hypotheses. A spike is through away code, like an intial brain dump.

2. **Repetitive nouns in method names is a sign you're missing a class.**

3. **Don't include the class name when naming methods**
Otherwise your code will look like this: `player1.player_info`.

4. **Avoid long method invocation chains.**
They are too vunerable to begin broken if you get an unexpected return value or `nil`.

## Steps for creating CRC cards:
1. Write a description of the problem and extract major nouns and verbs.

2. Make an initial guess at organising classes and methods then do a spike to explore the problem with temporary code.

3. When you have a better grasp of the problem, model thoughts into CRC cards.

