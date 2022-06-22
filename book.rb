require 'json'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author, rentals = [])
    @title = title
    @author = author
    @rentals = rentals
  end

  def as_json(_options = {})
    {
      title: @title,
      author: @author,
      rentals: @rentals
    }
  end

  def to_json(*options)
    JSON.pretty_generate(as_json(*options))
  end
end
