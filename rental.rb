class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def as_json(_options={})
    {
      date: @date,
      book: @book,
      person: @person,
    }
  end

  def to_json(*options)
    JSON.pretty_generate(as_json(*options))
  end
end
