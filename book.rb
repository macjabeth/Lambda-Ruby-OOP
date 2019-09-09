module Lendable
  def lend
    if @count > 0
      @count -= 1
    end
  end
end

class Book
  include Lendable
  attr_reader :title, :author
  attr_writer :finished
  attr_reader :count
  def initialize(title, author)
    @title = title
    @author = author
    @finished = false
    @count = 3
  end
end

def Book.recommended_books
  [
    Book.new('The Well-Grounded Rubyist', 'David A. Black'),
    Book.new("Practical Object-Oriented Design in Ruby", "Sandi Metz"),
    Book.new("Effective Testing with RSpec 3", "Myron Marston")
  ]
end

class AudioBook < Book
  def listen
    @finished = true
  end
end

class ComicBook < Book
  def read
    @finished = true
  end
end

rubyist = Book.recommended_books[0]

rubyist.lend

puts rubyist.count