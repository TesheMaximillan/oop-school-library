require 'json'

module Utility
  def proper_age?
    print 'Age: '
    age = gets.chomp

    loop do
      return age if age.to_i.to_s == age

      print "Please Add a proper age!!\nAge: "
      age = gets.chomp
    end
  end

  def book_available?
    selected_book = gets.chomp

    loop do
      if selected_book.to_i.to_s != selected_book
        puts "\n>>>> Please insert a number <<<<\n\n"
        print '[Book #]: '
        selected_book = gets.chomp
      elsif selected_book.to_i.negative? || selected_book.to_i >= @book.length
        puts "\n>>>> Please insert a valid number <<<<\n\n"
        print '[Book #]: '
        selected_book = gets.chomp
      else
        return selected_book
      end
    end
  end

  def person_available?
    selected_person = gets.chomp

    loop do
      if selected_person.to_i.to_s != selected_person
        puts "\n>>>> Please insert a number <<<<\n\n"
        print '[Person #]: '
        selected_person = gets.chomp
      elsif selected_person.to_i.negative? || selected_person.to_i >= @person.length
        puts "\n>>>> Please insert a valid number <<<<\n\n"
        print '[Person #]: '
        selected_person = gets.chomp
      else
        return selected_person
      end
    end
  end

  def permission?
    permission = gets.chomp.downcase

    loop do
      %w[y n].include?(permission) && break

      print "\nPlease insert [Y] or [N]: "
      permission = gets.chomp.downcase
    end
    permission = permission != 'n'
  end

  def rental_book_menu
    @book.each_with_index do |b, i|
      puts "#{i}) Title: #{b.title}\t\tAuthor: #{b.author}"
    end
  end

  def rental_person_menu
    @person.empty? && return

    @person.each_with_index do |p, i|
      puts "#{i}) [#{p.class}] Name: #{p.name}\t\tID: #{p.id}\t\tAge: #{p.age}"
    end
  end

  def create_obj(preserve_obj, class_type, data)
    case class_type
    when 'person'
      if preserve_obj['type'] == 'Student'
        Student.new(preserve_obj['age'], preserve_obj['classroom'],
                    preserve_obj['parent_permission'], preserve_obj['name'])
      else
        Teacher.new(preserve_obj['age'], preserve_obj['specialization'],
                    preserve_obj['parent_permission'], preserve_obj['name'])
      end
    when 'book'
      Book.new(preserve_obj['title'], preserve_obj['author'], preserve_obj['rentals'])
    else
      Rental.new(data['date'], @book[data['book']], @person[data['person']])
    end
  end

  def preserve_data(path, data, class_type)
    data_json = []
    if class_type == 'rentals'
      unless File.zero?(path) && !File.exist?(path)
        JSON.parse(File.read(path)).each do |d|
          data_json << { date: d['date'], book: d['book'], person: d['person'] }
        end
      end
      data_json << { date: data[0], book: data[1], person: data[2] }
    else
      data.each { |d| data_json << d.to_json }
    end
    File.write(path, JSON.pretty_generate(data_json))
  end

  def get_data(path, class_type)
    preserve_data = []
    return preserve_data unless File.exist?(path)
    return preserve_data if File.zero?(path)

    data = JSON.parse(File.read(path))
    data.each do |d|
      preserve_obj = []
      preserve_obj = JSON.parse(d) unless class_type == 'rentals'
      preserve_data << create_obj(preserve_obj, class_type, d)
    end
    preserve_data
  end
end
