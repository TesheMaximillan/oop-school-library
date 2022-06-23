require_relative '../teacher'
require 'json'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(25, 'Math', true, 'John')
  end

  context '#initialize' do
    it 'should return a new Teacher object' do
      expect(@teacher).to be_a(Teacher)
    end

    it 'Should have take at least 3 arguments and returns teacher object' do
      expect { Teacher.new(25, 'Math') }.to raise_error(ArgumentError)
    end
  end

  context '#age' do
    it 'should return the age of the teacher' do
      expect(@teacher.age).to eq(25)
    end
  end

  context '#specialization' do
    it 'should return the specialization of the teacher' do
      expect(@teacher.specialization).to eq('Math')
    end
  end

  context '#parent_permission' do
    it 'should return the parent permission of the teacher' do
      expect(@teacher.parent_permission).to eq(true)
    end
  end

  context '#name' do
    it 'should return the name of the teacher' do
      expect(@teacher.name).to eq('John')
    end
  end

  context '#can_use_services?' do
    it 'should return true if the teacher is of age or has parent permission' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end

  context '#as_json' do
    it 'should return a hash with the teacher attributes' do
      expect(@teacher.as_json).to eq({
                                       type: '[Teacher]',
                                       id: @teacher.id,
                                       age: @teacher.age,
                                       name: @teacher.name,
                                       parent_permission: @teacher.parent_permission,
                                       rentals: @teacher.rentals,
                                       specialization: @teacher.specialization
                                     })
    end
  end

  context '#to_json' do
    it 'should return a json string with the teacher attributes' do
      expect(@teacher.to_json).to eq(JSON.pretty_generate(@teacher.as_json))
    end
  end
end
