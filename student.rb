require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = "Unknown",  parent_permission = true)
    @age = age
    @name = name
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end
