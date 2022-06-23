require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def as_json(_options = {})
    {
      type: '[Teacher]',
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      rentals: @rentals,
      specialization: @specialization
    }
  end

  def to_json(*options)
    JSON.pretty_generate(as_json(*options))
  end
end
