require_relative 'book'
require_relative 'person'

require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
    book.add_rental(self)
    person.add_rental(self)
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end
end
