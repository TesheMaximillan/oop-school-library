require 'json'

module PreserveData
  def create_obj(preserve_obj, class_type, data)
    case class_type
    when 'person'
      if preserve_obj['type'] == 'Student'
        Student.new(preserve_obj['age'], preserve_obj['classroom'],
                    preserve_obj['parent_permission'], preserve_obj['name'])
      else
        Teacher.new(preserve_obj['age'], preserve_obj['specialization'],
                    preserve_obj['parent_permission'], preserve_obj['name'])
      end
    when 'book'
      Book.new(preserve_obj['title'], preserve_obj['author'], preserve_obj['rentals'])
    else
      Rental.new(data['date'], @book[data['book']], @person[data['person']])
    end
  end

  def preserve_data(path, data, class_type)
    data_json = []
    if class_type == 'rentals'
      if !File.zero?(path) && File.exist?(path)
        JSON.parse(File.read(path)).each do |d|
          data_json << { date: d['date'], book: d['book'], person: d['person'] }
        end
      end
      data_json << { date: data[0], book: data[1], person: data[2] }
    else
      data.each { |d| data_json << d.to_json }
    end
    File.write(path, JSON.pretty_generate(data_json))
  end

  def get_data(path, class_type)
    preserve_data = []
    return preserve_data unless File.exist?(path)
    return preserve_data if File.zero?(path)

    data = JSON.parse(File.read(path))
    data.each do |d|
      preserve_obj = []
      preserve_obj = JSON.parse(d) unless class_type == 'rentals'
      preserve_data << create_obj(preserve_obj, class_type, d)
    end
    preserve_data
  end
end
