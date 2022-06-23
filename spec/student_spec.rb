require_relative '../student'

describe Student do
  before(:each) do
    @student = Student.new(25, '1A', true, 'John')
  end

  context '#initialize' do
    it 'should return a new Student object' do
      expect(@student).to be_a(Student)
    end

    it 'Should have take at least 3 arguments and returns student object' do
      expect { Student.new(25, '1A') }.to raise_error(ArgumentError)
    end
  end

  context '#age' do
    it 'should return the age of the student' do
      expect(@student.age).to eq(25)
    end
  end

  context '#classroom' do
    it 'should return the classroom of the student' do
      expect(@student.classroom).to eq('1A')
    end
  end

  context '#parent_permission' do
    it 'should return the parent permission of the student' do
      expect(@student.parent_permission).to eq(true)
    end
  end

  context '#name' do
    it 'should return the name of the student' do
      expect(@student.name).to eq('John')
    end
  end

  context '#classroom' do
    it 'should return the classroom of the student' do
      expect(@student.classroom).to eq('1A')
    end
  end

  context '#play_hooky' do
    it 'should return a string' do
      expect(@student.play_hooky).to be_a(String)
    end
  end

  context '#as_json' do
    it 'should return a hash with the student attributes' do
      expect(@student.as_json).to eq({
                                       type: '[Student]',
                                       id: @student.id,
                                       age: @student.age,
                                       name: @student.name,
                                       parent_permission: @student.parent_permission,
                                       rentals: @student.rentals,
                                       classroom: @student.classroom
                                     })
    end
  end

  context '#to_json' do
    it 'should return a json string with the student attributes' do
      expect(@student.to_json).to eq(JSON.pretty_generate(@student.as_json))
    end
  end
end
