require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def run
    puts "\nWelcome to School library APP!"
    actions = 'start'

    until actions == 'quit'
      menu
      actions = @app.actions
    end
    puts "\nThank you for using this app!"
  end

  private

  def menu
    puts
    45.times { print '=' }
    puts "\nPlease choose an option by entering a number:"
    45.times { print '-' }
    puts "\n"
    print "1. List all books\n2. List all people\n3. Create a person\n" \
          "4. Create a book\n5. Create a rental\n6. List all rentals for " \
          "a given person id\n7. Exit\n"
  end
end

Main.new.run
