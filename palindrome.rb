# Palindrome class that finds the largest palindrome in a string of lower case letters
# 
# POSSIBLE IMPROVEMENTS: 
# 1.  Create and return an array of palidromes if 2+ same sized largest palindrome found
# 2.  Create a method that returns all palidromes found sorted in the order of length(easily done with ruby)
#
require "active_support/core_ext/integer/inflections"  # ordinalize method

class Palindrome
  attr_reader :string, :largest, :location, :largest_length
  
  def initialize(string)
    self.string = string
  end

  def string=(new_string)
    @string = new_string

    @largest = ""
    @location = nil
    @largest_length = 0
    find_largest
  end

  # to_string method
  def to_s
    unless @largest.empty?
      "The largest palindrome found in the string \"#{ @string }\" is \"#{ @largest }\".  " +
      "It begins at #{ @location.ordinalize } index from the left with the length of #{ @largest_length }."
    end
  end

  private
  # find largest palidrome in @string and populates all the gettable variables
  def find_largest

    # hash (choice over just variables for clearer code)
    current_longest = {begin_index: nil, string: "", length: 1}

    for cursor in 0...@string.length
      
      # check out of bound and if next letter is the same as current
      if cursor+1 < @string.length && @string[cursor] == @string[cursor+1]  
        alternative = find_palindrome :cursor => cursor, :initial_length => 2
      end

      # check for the palindrome normally(surrounding the current letter)
      found_palindrome = find_palindrome :cursor => cursor

      # compare the two options
      unless alternative.nil?
        found_palindrome = alternative if alternative[:length] > found_palindrome[:length]
      end
      
      # check if this paladrome is the largest
      if found_palindrome[:length] > current_longest[:length]
        current_longest[:length] = found_palindrome[:length]
        current_longest[:begin_index] = found_palindrome[:begin_index]
        current_longest[:string] = @string[current_longest[:begin_index], found_palindrome[:length]]
      end
    end

    @location = current_longest[:begin_index]
    @largest_length = current_longest[:length] if current_longest[:length] > 1
    @largest = current_longest[:string]

  end

  # finds a palindrome given the current position on @string and the initial_length( set of [1,2] )
  #   Default initial_length is 1
  def find_palindrome(args)
    cursor, initial_length = args[:cursor], args[:initial_length] || 1
    palindrome = {length: 0, begin_index: nil}

    palindrome.tap do # returns this object at the end

      # variables for readability
      begin_index = cursor-1
      end_index = cursor+1

      # set the initial length
      palindrome[:length] = initial_length

      # need to start from 2 instead of 1 for "even" palindrome
      end_index = cursor + initial_length
      
      # check out of bounds and is it palindrome?
      while begin_index >= 0 && end_index < @string.length && @string[begin_index] == @string[end_index] 
        palindrome[:length] += 2 # adjust length of the palindrome
        begin_index -= 1
        end_index += 1
      end

      palindrome[:begin_index] = begin_index + 1  # "add one" b/c undo the decrement made in the while loop

    end
  end
end
