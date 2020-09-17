echo 'Enter a word:'
read word_1

echo 'Enter another word:'
read word_2

if [[ word_1 = word_2 ]]
then
  echo 'The two words you entered are the same!'
else
  echo 'You have entered two different words'
fi
