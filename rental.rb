require_relative 'book'
require_relative 'person'
require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.add_rental(self)
    person.add_rental(self)
  end
end

book3 = Book.new('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling')
book4 = Book.new('Pride and Prejudice', 'Jane Austen')

person3 = Person.new(30, name: 'Emma')
person4 = Person.new(19, name: 'Daniel', parent_permission: false)

rental3 = Rental.new(Date.today, book3, person3)
rental4 = Rental.new(Date.today, book4, person4)

p rental3.date
p rental3.book.title
p rental3.person.name

p rental4.date
p rental4.book.title
p rental4.person.name
