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
      elsif selected_person.to_i.negative? || selected_person.to_i >= @student.length + @teacher.length
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

  def rental_person_menu(person)
    person.empty? && return

    si = @student.length
    person.each_with_index do |p, i|
      if i < si
        puts "#{i}) [Student] Name: #{p.name}\t\tID: #{p.id}\t\tAge: #{p.age}"
      else
        puts "#{i}) [Teacher] Name: #{p.name}\t\tID: #{p.id}\t\tAge: #{p.age}"
      end
    end
  end

  def preserve_data(path, data)
    data_json = []
    data.each { |d| data_json << d.to_json }
    File.write(path, JSON.pretty_generate(data_json))
  end

  def get_data(path)
    preserve_data = []
    return preserve_data unless File.exist?(path)

    data = JSON.parse(File.read(path))
    data.each do |d|
      preserve_data << JSON.parse(d)
    end
    preserve_data
  end
end
