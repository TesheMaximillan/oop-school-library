require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'label'
  end

  context 'New Classroom' do
    it 'takes three parameters and returns a Classroom object' do
      expect(@classroom).to be_a(Classroom)
    end
  end

  context '#Label' do
    it 'returns the correct date' do
      expect(@classroom.label).to eq('label')
    end
  end

  context 'students = []' do
    it 'should have a list of students' do
      expect(@classroom.students).to eq([])
    end
  end

  context '#add_student' do
    it 'Adding a student' do
      name = 'Name'
      age = 'Age'
      parent_permission = true
      student = Student.new(age, name, parent_permission)
      @classroom.add_student(student)
      expect(@classroom.students).to eq([student])
    end
  end
end
