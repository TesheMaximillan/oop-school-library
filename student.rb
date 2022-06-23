require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def as_json(_options = {})
    {
      type: '[Student]',
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      rentals: @rentals,
      classroom: @classroom
    }
  end

  def to_json(*options)
    JSON.pretty_generate(as_json(*options))
  end
end
