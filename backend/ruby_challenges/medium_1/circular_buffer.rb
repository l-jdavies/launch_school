# A circular buffer, cyclic buffer or ring buffer is a data structure that uses a single, fixed-size buffer as if it were connected end-to-end.
# 
# A circular buffer first starts empty and of some predefined length. For example, this is an empty 7-element buffer:
# 
# [ ][ ][ ][ ][ ][ ][ ]
# Assume that a 1 is written into the middle of the buffer (exact starting location does not matter in a circular buffer):
# 
# [ ][ ][ ][1][ ][ ][ ]
# Then assume that two more elements are added, or written to the buffer — 2 & 3 — which get appended after the 1:
# 
# [ ][ ][ ][1][2][3][ ]
# If two elements are then read, or removed from the buffer, the oldest values inside the buffer are removed. The two elements removed, in this case, are 1 & 2, leaving the buffer with just a 3:
# 
# [ ][ ][ ][ ][ ][3][ ]
# If the buffer has 7 elements then it is completely full:
# 
# [6][7][8][9][3][4][5]
# When the buffer is full an error will be raised, alerting the client that further writes are blocked until a slot becomes free.
# 
# The client can opt to overwrite the oldest data with a forced write. In this case, two more elements — A & B — are added and they overwrite the 3 & 4:
# 
# [6][7][8][9][A][B][5]
# Finally, if two elements are now removed then what would be returned is not 3 & 4 but 5 & 6 because A & B overwrote the 3 & the 4 yielding the buffer with:
# 
# [ ][7][8][9][A][B][ ]

# PEDAC
#
# INPUT
# string
#
# OUTPUT
# elements from buffer
#
# RULES
# from test suite:
# a CircularBuffer instance will always be created
# no class methods required
# class instance created with integer passed in as argument - size of buffer
# if user tries to add an element when the buffer is full, raise `BufferFullException`
# exception can be overriden
# if the buffer is empty and the user tries to read, raise `BufferEmptyException`
#
# instance methods required:
# `write` takes one argument, adds argument to buffer
# if `nil` is passed into `write`, it shouldn't be added to buffer
# `write!` overrides the `BufferFullException`
# `write!` overrides the 'oldest' element in buffer
# `read` removes and returns the 'oldest' element in buffer
# `clear` resets all elements in buffer to nil

# ALGORITHM
# `initialize`
#  need a 'head' and 'tail' pointer to track where elements should be read from or written to
#  integer passed in is the maximum size of the buffer
#  create Array.new(max)
#
#  `write`
#  add element to index position referenced by `head`
#  test cases don't state how to handle if user tries to write to a position > max size of buffer but I'll assume we need to raise `IndexError`
#  fetch the element in the buffer at the index position referenced by `tail`
#  if this element is nil
#    re-assign element to argument passed in to `write`
#  if it isn't nil, raise the `BufferFullException`
#  increment the `tail` by 1
#
#  `write!`
#  if the buffer is full, override the element at the `head` index position
#  increment `head`
#
#  `read`
#  removes and returns the element at index position referenced by `head`
#  if element at that position is nil, raise `BufferEmptyException`
#  retrieve element from buffer at `head` index position and store in local variable (`return_val`)
#  reset the element at the `head` position to nil
#  increment `head`
#  return `return_val`

class CircularBuffer
  attr_accessor :queue, :head, :tail

  def initialize(max)
    @head = 0
    @tail = 0
    @max = max
    @buffer = Array.new(max)
  end

  def write(arg)
    return if arg.nil?

    raise BufferFullException if !@buffer.fetch(@tail).nil?
    
    @buffer[@tail] = arg
    @tail = increment(@tail)
  end

  def write!(arg)
    return if arg.nil?

    if !@buffer.fetch(@tail).nil?
      @buffer[@head] = arg
      @head = increment(@head)
    else
      write(arg)
    end
  end

  def read
    raise BufferEmptyException if @buffer.fetch(@head).nil?
      
    return_val = @buffer.fetch(@head)
    @buffer[@head] = nil
    @head = increment(@head)

    return_val
  end

  def clear
    @buffer.map! { |el| el = nil }
  end

  class BufferFullException < StandardError

  end

  class BufferEmptyException < StandardError

  end


  def enqueue(element)
    if queue[tail].nil?
      queue[tail] = element
      self.tail = increment(tail)
    else
      queue[head] = element
      self.head = increment(head)
    end
  end

  def dequeue
    return nil if queue.all? { |e| e.nil? }
    return_value = queue[head]
    queue[head] = nil
    self.head = increment(head)
    return_value
  end

  private

  def increment(pointer)
    (pointer + 1) % @max
  end
end
