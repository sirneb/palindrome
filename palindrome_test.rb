require "minitest/unit"
require "minitest/spec"
require "minitest/autorun"
require "./palindrome.rb"

class PalindromeTest < MiniTest::Unit::TestCase

  describe "Palindrome" do
    
    before do
      @palindrome = Palindrome.new("")
    end

    describe "initialize" do
      it "should throw an error if non-lowercase letters are in the string" do
        # 
      end
    end

    describe "string accessor" do
      it "should be able to read and write" do
        @string = "test test test"
        @palindrome.string = @string
        assert_equal(@string, @palindrome.string )
      end
    end

    describe "largest" do
      before do
        @one_palin = "lsjzlfjabababac" # abababa
        @one_palin2 = "lsdflkbajkkjabdflfjbac" # bajkkjab
        @two_palin = "lsdfqwertytrewqaba" #qwertytrewq
        @two_same_length_palin = "lsjzlfjabababc" # ababa, babab
        @no_palin = "lksjdflsjfsl" # nil
        @repeat_letters = "a"*14 #itself
        @repeat_letters2 = "a"*15 #itself
        @more_test1 = "a"*7 + "b"*8
        @more_test1b = "a"*8 + "b"*7
        @more_test2 = "lsjdflsjkdfkaabjdlkjbdl" #aa
        @more_test3 = "lsdfqwerytrewqaba" #aba
        @more_test4 = "abalsdfqwerytrewq" #aba
        @more_test5 = "ababa" #ababa
        @more_test6 = "cbaabc" #ababa
        @more_test7 = "cbaaabd" #ababa
      end

      it "should find the largest palindrome in the string" do
        @palindrome.string = @one_palin
        assert_equal("abababa",@palindrome.largest)
        @palindrome.string = @one_palin2
        assert_equal("bajkkjab",@palindrome.largest)
        @palindrome.string = @two_palin
        assert_equal("qwertytrewq",@palindrome.largest)
        @palindrome.string = @two_same_length_palin
        assert_equal("ababa",@palindrome.largest)
        @palindrome.string = @no_palin
        assert_equal("",@palindrome.largest)
        @palindrome.string = @repeat_letters
        assert_equal(@repeat_letters,@palindrome.largest)
        @palindrome.string = @repeat_letters2
        assert_equal(@repeat_letters2,@palindrome.largest)
        @palindrome.string = @more_test1
        assert_equal("b"*8,@palindrome.largest)
        @palindrome.string = @more_test1b
        assert_equal("a"*8,@palindrome.largest)
        @palindrome.string = @more_test2
        assert_equal("aa",@palindrome.largest)
        @palindrome.string = @more_test3
        assert_equal("aba",@palindrome.largest)
        @palindrome.string = @more_test4
        assert_equal("aba",@palindrome.largest)
        @palindrome.string = @more_test5
        assert_equal("ababa",@palindrome.largest)
        @palindrome.string = @more_test6
        assert_equal("cbaabc",@palindrome.largest)
        @palindrome.string = @more_test7
        assert_equal("baaab",@palindrome.largest)
      end
    end
  end
end
