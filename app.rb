require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :teacher, :student, :book, :rentals

  def initialize
    @teacher = []
    @student = []
    @book = []
    @rentals = []
  end

  def menu
    puts
    45.times { print '=' }
    puts "\nPlease choose an option by entering a number:"
    45.times { print '-' }
    puts "\n"
    print "1. List all books\n2. List all people\n3. Create a person\n4. Create a book\n"
    print "5. Create a rental\n6. List all rentals for a given person id\n7. Exit\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @book << Book.new(title, author)
    puts "\n> Book crated successfully\n\n"
  end

  def display_book
    if !@book.empty?
      puts
      @book.each { |b| puts "Title: #{b.title}\t\tAuthor: #{b.author}" }
      puts
    end
  end

  def actions
    print "\n[Input] > "
    user_input = gets.chomp

    case user_input
    when '1'
      display_book()
    when '2'
      puts
      display_person(@student)
      display_person(@teacher)
      puts
    when '3'
      create_person()
    when '4'
      create_book()
    when '5'
      create_rental()
    when '6'
      display_rental()
    when '7'
      return 'Exit'
    end
  end

  def run
    user_input = ''
    puts "\nWelcome to School library APP!"

    while user_input != 'Exit'
      menu()
      user_input = actions()
    end
    puts "\nThank you for using this app!"
  end
end