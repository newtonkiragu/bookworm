module ReadingList
  def add_reading
    @books = Book.where.not(reading_list: nil)
    @reading_list = []
    @books.each do |book|
      if book.reading_list.split(",").include? current_user.id.to_s
        @reading_list.push(book)
      end
      @reading_list
    end
    @reading_list
  end

end
