require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:person) { Person.new(18, 'Name 01') }
  let(:book) { Book.new('Title 01', 'Author 01') }
  let(:rental) { Rental.new('2022/01/01', book, person) }

  context 'New Rental' do
    it 'should be a Rental' do
      expect(rental).to be_a(Rental)
    end
  end

  describe 'Passing parameters' do
    context '#Date' do
      it 'returns the correct date' do
        expect(rental.date).to eq('2022/01/01')
      end
    end

    context '#Book' do
      it 'returns the correct book' do
        expect(rental.book).to eq(book)
      end
    end

    context '#Person' do
      it 'returns the correct person' do
        expect(rental.person).to eq(person)
      end
    end
  end

  context 'Having the rentals' do
    it 'having person`s rentals' do
      expect(person.rentals).to eq([rental])
    end

    it 'having book`s rentals' do
      expect(book.rentals).to eq([rental])
    end
  end
end
