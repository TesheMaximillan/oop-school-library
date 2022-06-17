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
end