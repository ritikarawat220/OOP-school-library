require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # list all books and people
  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |_people|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  # create a student
  def create_student
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Has Parent permission? [Y/N]'
    permission = gets.chomp
    permission = true if %w[Y y].include?(permission)
    permission = false if %w[N n].include?(permission)

    student = Student.new(age, nil, name: name, parent_permission: permission)
    @people.push(student)
    puts 'Student Created Successfully'
  end

  # Create a teacher
  def create_teacher
    print 'Specialization:'
    specialization = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    @people << Teacher.new(age, specialization, name: name)
    puts 'Teacher Created Successfully'
  end

  # Create a person
  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    input_result = gets.chomp.to_i

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  # Create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
  end

  # Create a rental
  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not ID)'

    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(@books[book_index], @people[person_index], date)
    puts 'Rental created successfully'
  end

  # List all rentals for a given person
  def list_rentals_by_person_id
    puts 'Enter a person ID:'
    person_id = gets.chomp.to_i

    person = @people.find { |prsn| prsn.id == person_id }
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each do |rental|
      puts "Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end
end
