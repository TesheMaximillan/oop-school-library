class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def as_json(options={})
    {
      title: @title,
      author: @author,
      rentals: @rentals
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
  
end
