require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = "Unknown", parent_permission = true)
    @age = age
    @name = name
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end

puts Teacher.new(5, "Maths", "Abebe", false).can_use_services?
