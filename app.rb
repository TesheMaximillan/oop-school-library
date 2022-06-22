require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'utility'
require 'pry'
require 'json'

class App
  attr_reader :person, :book, :rentals, :person_path, :books_path, :rentals_path

  include Utility

  def initialize
    @person_path = 'person.json'
    @books_path = 'books.json'
    @rentals_path = 'rentals.json'
    @person = get_data(@person_path, 'person')
    @book = get_data(@books_path, 'book')
    @rentals = get_data(@rentals_path, 'rentals')
  end

  def book_input
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_book
    user_input = book_input
    @book << Book.new(user_input.first, user_input.last)
    preserve_data(@books_path, @book)
    puts "\n> Book created successfully\n\n"
  end

  def display_book
    return puts "\n>>>> No books available<<<" if @book.empty?

    puts
    @book.each { |b| puts "Title: #{b.title}\t\tAuthor: #{b.author}" }
    puts
  end

  def person_input(person_type)
    print 'Name: '
    name = gets.chomp
    if person_type == '1'
      print 'Has parent permission? [Y/N]: '
      permission = permission?
      print 'Classroom: '
      classroom = gets.chomp
      [name, permission, classroom]
    else
      print 'Specialization: '
      specialization = gets.chomp
      [name, specialization]
    end
  end

  def create_person_object(person_type)
    age = proper_age?
    user_input = person_input(person_type)
    @person << if person_type == '1'
                 Student.new(age, user_input.last, user_input[1], user_input.first)
               else
                 Teacher.new(age, user_input.last, true, user_input.first)
               end
    preserve_data(@person_path, @person)
    puts "\n> Person crated successfully\n\n"
  end

  def create_person
    print 'Do you want to crate a student (1) or a teacher (2)? [Input the number]: '
    select_person = gets.chomp
    if select_person != '1' && select_person != '2'
      puts "\n>>>> Please insert [1] or [2] <<<<\n\n"
      return
    end
    create_person_object(select_person)
  end

  def display_person
    return puts "\n>>>> No Person available<<<" if @person.empty?

    puts
    @person.each do |p|
      puts "#{p.class} Name: #{p.name}\t\tID: #{p.id}\t\tAge: #{p.age}"
    end
  end

  def rental_input
    puts 'Select a book from the following list by number'
    rental_book_menu
    selected_book = book_available?.to_i

    puts 'Select a person from the following list by number (not id)'
    rental_person_menu
    selected_person = person_available?.to_i

    print "\nDate: "
    date = gets.chomp
    [selected_book, selected_person, date]
  end

  def create_rental
    (@book.empty? || @person.empty?) && return

    user_input = rental_input
    @rentals << Rental.new(user_input.last, @book[user_input.first], @person[user_input[1]])
    # preserve_data(@rentals_path, @rentals)
    puts "\n> Rental crated successfully\n\n"
  end

  def display_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      rent.person.id != id && next
      puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by #{rent.book.author}"
    end
  end

  def sub_actions(input)
    case input
    when '1' then display_book
    when '2' then display_person
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then display_rental
    end
  end

  def actions
    print "\n[Menu] > "
    user_input = gets.chomp
    return 'quit' if user_input == '7'

    puts "\n>>>> Please insert a valid number <<<<\n\n" \
    unless (1..8).to_a.include?(user_input.to_i)
    sub_actions(user_input)
  end
end
